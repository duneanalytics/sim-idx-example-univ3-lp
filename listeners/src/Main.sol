// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-sol/Simidx.sol";
import "sim-idx-generated/Generated.sol";
import {IUniswapV3Pool} from "./interfaces/IUniswapV3Pool.sol";
import {INonfungiblePositionManager} from "./interfaces/INonfungiblePositionManager.sol";
import {IUniswapV3Factory} from "./interfaces/IUniswapV3Factory.sol";

struct LpEvent {
    bytes32 txn_hash;
    uint256 block_number;
    uint256 block_timestamp;
    address pool;
    string event_type;
    address owner;
    uint256 amount;
    int64 tick_lower;
    int64 tick_upper;
    uint256 token_id;
}

struct PoolTick {
    bytes32 txn_hash;
    uint256 block_number;
    uint256 block_timestamp;
    address pool;
    int64 tick;
}

contract Triggers is BaseTriggers {
    /// Constants
    address constant FACTORY = 0x1F98431c8aD98523631AE4a59f267346ea31F984;
    address constant POSITION_MANAGER = 0xC36442b4a4522E871399CD717aBDD847Ab11FE88;

    function triggers() external virtual override {
        Listener listener = new Listener();
        addTrigger(ChainIdAbi(1, UniswapV3Pool$Abi()), listener.triggerOnBurnEvent());
        addTrigger(ChainIdAbi(1, UniswapV3Pool$Abi()), listener.triggerOnMintEvent());
        addTrigger(ChainIdAbi(1, UniswapV3Pool$Abi()), listener.triggerOnSwapEvent());
        addTrigger(
            ChainIdContract(1, POSITION_MANAGER),
            listener.triggerOnTransferEvent()
        );
        addTrigger(
            ChainIdContract(1, POSITION_MANAGER),
            listener.triggerOnIncreaseLiquidityEvent()
        );
        addTrigger(
            ChainIdContract(1, POSITION_MANAGER),
            listener.triggerOnDecreaseLiquidityEvent()
        );
        addTrigger(ChainIdGlobal(1), listener.triggerOnBlock());
    }
}

/// Index LP events and tick changes in official UniswapV3Pools.
/// Index ownership changes in positions in the NFTPositionManager.
contract Listener is
    UniswapV3Pool$OnBurnEvent,
    UniswapV3Pool$OnMintEvent,
    UniswapV3Pool$OnSwapEvent,
    NonfungiblePositionManager$OnTransferEvent,
    NonfungiblePositionManager$OnIncreaseLiquidityEvent,
    NonfungiblePositionManager$OnDecreaseLiquidityEvent,
    Raw$OnBlock
{
    /// Constants
    address constant FACTORY = 0x1F98431c8aD98523631AE4a59f267346ea31F984;
    address constant POSITION_MANAGER = 0xC36442b4a4522E871399CD717aBDD847Ab11FE88;
    /// Ephemeral state
    mapping(address => PoolTick) poolTicks;
    address[] visitedPools;
    // Saved positions that will be emitted later.
    // Mapping key is: keccak256(txn_hash, amount, event_type)
    mapping (bytes32 => LpEvent) savedPositions;
    address latestPool;

    /// Event to index the ownership changes of a positions in the NFTPositionManager.
    event PositionOwnerChanges(
        bytes32 txn_hash,
        uint256 block_number,
        uint256 block_timestamp,
        address from_address,
        address to_address,
        uint256 token_id,
        address pool
    );
    /// Event to index the changes in pool ticks
    event PoolTicksPerBlock(
        bytes32 txn_hash, 
        uint256 block_number, 
        uint256 block_timestamp, 
        address pool, 
        int64 tick
    );
    /// Event to track changes in liquidity of positions
    event LpEvents(
        bytes32 txn_hash,
        uint256 block_number,
        uint256 block_timestamp,
        address pool,
        string event_type,
        address owner,
        uint256 amount,
        int64 tick_lower,
        int64 tick_upper,
        uint256 token_id
    );

    constructor() {
    }

    function onBurnEvent(EventContext memory ctx, UniswapV3Pool$BurnEventParams memory inputs) external override {
        if (isOfficialPool(ctx.txn.call.callee) && inputs.amount > 0) {
            latestPool = ctx.txn.call.callee;
            if (inputs.owner == POSITION_MANAGER) {
                // Save event for later emission as we need to get the correct token_id from the NFTPositionManager.
                savedPositions[keccak256(abi.encode(ctx.txn.hash, inputs.amount, "burn"))] = LpEvent({
                    txn_hash: ctx.txn.hash,
                    block_number: block.number,
                    block_timestamp: block.timestamp,
                    pool: latestPool,
                    event_type: "burn",
                    owner: inputs.owner,
                    amount: inputs.amount,
                    tick_lower: inputs.tickLower,
                    tick_upper: inputs.tickUpper,
                    token_id: 0
                });
            } else {
                emit LpEvents(
                    ctx.txn.hash,
                    block.number,
                    block.timestamp,
                    latestPool,
                    "burn",
                    inputs.owner,
                    inputs.amount,
                    inputs.tickLower,
                    inputs.tickUpper,
                    0
                );
            }
        }
    }

    function onMintEvent(EventContext memory ctx, UniswapV3Pool$MintEventParams memory inputs) external override {
        if (isOfficialPool(ctx.txn.call.callee) && inputs.amount > 0) {
            latestPool = ctx.txn.call.callee;
            if (inputs.owner == POSITION_MANAGER) {
                // Save event for later emission as we need to get the correct token_id from the NFTPositionManager.
                savedPositions[keccak256(abi.encode(ctx.txn.hash, inputs.amount, "mint"))] = LpEvent({
                    txn_hash: ctx.txn.hash,
                    block_number: block.number,
                    block_timestamp: block.timestamp,
                    pool: latestPool,
                    event_type: "mint",
                    owner: inputs.owner,
                    amount: inputs.amount,
                    tick_lower: inputs.tickLower,
                    tick_upper: inputs.tickUpper,
                    token_id: 0
                });
            } else {
                emit LpEvents(
                    ctx.txn.hash,
                    block.number,
                    block.timestamp,
                    latestPool,
                    "mint",
                    inputs.owner,
                    inputs.amount,
                    inputs.tickLower,
                    inputs.tickUpper,
                    0
                );
            }
        }
    }

    function onSwapEvent(EventContext memory ctx, UniswapV3Pool$SwapEventParams memory inputs) external override {
        if (isOfficialPool(ctx.txn.call.callee)) {
            if (poolTicks[ctx.txn.call.callee].txn_hash != bytes32(0)) {
                visitedPools.push(ctx.txn.call.callee);
            }
            poolTicks[ctx.txn.call.callee] = PoolTick({
                txn_hash: ctx.txn.hash,
                block_number: block.number,
                block_timestamp: block.timestamp,
                pool: ctx.txn.call.callee,
                tick: inputs.tick
            });
        }
    }

    function onTransferEvent(EventContext memory ctx, NonfungiblePositionManager$TransferEventParams memory inputs)
        external
        override
    {
        address pool;
        try INonfungiblePositionManager(ctx.txn.call.callee).positions(inputs.tokenId) returns (
            uint96 nonce,
            address operator,
            address token0,
            address token1,
            uint24 fee,
            int24 tickLower,
            int24 tickUpper,
            uint128 liquidity,
            uint256 feeGrowthInside0LastX128,
            uint256 feeGrowthInside1LastX128,
            uint128 tokensOwed0,
            uint128 tokensOwed1
        ) {
            pool = IUniswapV3Factory(FACTORY).getPool(token0, token1, fee);
        } catch {
            pool = latestPool;
        }
        emit PositionOwnerChanges(
            ctx.txn.hash, block.number, block.timestamp, inputs.from, inputs.to, inputs.tokenId, pool
        );
    }

    function onIncreaseLiquidityEvent(
        EventContext memory ctx,
        NonfungiblePositionManager$IncreaseLiquidityEventParams memory inputs
    ) external override {
        LpEvent memory latestPosition = savedPositions[keccak256(abi.encode(ctx.txn.hash, inputs.liquidity, "mint"))];
        latestPosition.token_id = inputs.tokenId;
        emit LpEvents(
            latestPosition.txn_hash,
            latestPosition.block_number,
            latestPosition.block_timestamp,
            latestPosition.pool,
            latestPosition.event_type,
            latestPosition.owner,
            latestPosition.amount,
            latestPosition.tick_lower,
            latestPosition.tick_upper,
            latestPosition.token_id
        );
    }

    function onDecreaseLiquidityEvent(
        EventContext memory ctx,
        NonfungiblePositionManager$DecreaseLiquidityEventParams memory inputs
    ) external override {
        LpEvent memory latestPosition = savedPositions[keccak256(abi.encode(ctx.txn.hash, inputs.liquidity, "burn"))];
        latestPosition.token_id = inputs.tokenId;
        emit LpEvents(
            latestPosition.txn_hash,
            latestPosition.block_number,
            latestPosition.block_timestamp,
            latestPosition.pool,
            latestPosition.event_type,
            latestPosition.owner,
            latestPosition.amount,
            latestPosition.tick_lower,
            latestPosition.tick_upper,
            latestPosition.token_id
        );
    }

    function onBlock(RawBlockContext memory ctx) external override {
        for (uint256 i = visitedPools.length; i > 0; i--) {
            address pool = visitedPools[i - 1];
            emit PoolTicksPerBlock(
                poolTicks[pool].txn_hash,
                poolTicks[pool].block_number,
                poolTicks[pool].block_timestamp,
                pool,
                poolTicks[pool].tick
            );
        }
    }

    function isOfficialPool(address pool) internal returns (bool) {
        address token0 = IUniswapV3Pool(pool).token0();
        address token1 = IUniswapV3Pool(pool).token1();
        uint24 fee = IUniswapV3Pool(pool).fee();
        return (IUniswapV3Factory(FACTORY).getPool(token0, token1, fee) == pool);
    }
}
