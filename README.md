# Uniswap V3 In-Range LPs

This app will index liquidity provision events on Uniswap V3 pools and expose an endpoint which can be used in order to query the in-range positions of a specific pool at every given block.

To use this template you need to follow the steps in the Sim IDX [quickstart](https://docs.sim.dune.com/idx) but initialize with : 
`sim init --template=univ3-lp`


## Indexing Methodology

We use a `Main.sol` file that does the following:
- Triggers on every `Burn`, `Mint` or `Swap` event on all Uniswap V3 pools using a set of ABI Triggers.
- Triggers on the `Transfer`, `IncreaseLiquidity` and `DecreaseLiquidity` events on the `NFTPositionManager` contract.
- Has a block trigger.

We define the following events in our `Main.sol`:
```solidity
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
        int64 tick,
        uint256 sqrt_price_x96,
        address token0,
        address token1,
        uint64 token0_decimals,
        uint64 token1_decimals
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
        uint256 sqrt_price_x96_lower,
        int64 tick_upper,
        uint256 sqrt_price_x96_upper,
        uint256 token_id
    );
```

On each of the triggers we've defined for the `UniswapV3Pool` ABI, we will check if the pool is an official Uniswap V3 pool by querying its `factory()` method.
If so, we check if the owner of the position is the `NFTPositionManager` and if that's the case, we keep the details of the LP event in our ephemeral state in order to emit it later.
If the owner is not the `NFTPositionManager`, we emit the LP event message as is.
We use the triggers we have on `IncreaseLiquidity` and `DecreaseLiquidity` in order to augment the LP events we've saved with the `token_id` that is associated with the position we've saved in our ephemeral state. This will be later used in order to recover the owner of the position.
We use the `Transfer` trigger in order to keep track of the ownership of positions.
In addition, `Swap` events are used in order to keep track of the latest ticks for pools. We save those in the ephemeral state too as we need them to be emitted with a block-level granularity.
Finally, inside our block trigger, we emit all saved LP events and the pool ticks we've collected.

We make use of two unique features of Sim IDX in our listener:
 - `TickMath.getSqrtPriceAtTick` - we've imported the full `TickMath.sol` library off of the Uniswap V4. This allows us to calculate the `sqrtPriceRatioX96_lower` and `sqrtPriceRatioX96_upper` that corresponds to any position's lower and upper ticks. We then augment our LP events with that information to avoid doing the calculations in SQL or TypeScript.
 - `(uint160 sqrtPriceX96, , , , , , ) = IUniswapV3Pool(ctx.txn.call.callee).slot0();` - We use our listener's ability to access state at the time of handling triggers, this allows us to augment our `PoolTicksPerBlock` with the `sqrtPriceX96` which isn't available in the pools' `Swap` event.

## Querying Methodology

The `/lp-snapshot` endpoint queries the 3 tables in our DB to determine in-range liquidity positions at a specific block number. The query executes in four main steps:

### 1. Pool Tick Discovery
First, we retrieve the latest tick for the specified pool at or before the target block number:
```sql
SELECT block_number, tick, sqrtPriceX96, token0, token1, token0Decimals, token1Decimals
FROM pool_ticks_per_block 
WHERE pool = $pool AND block_number <= $block_number 
ORDER BY block_number DESC 
LIMIT 1
```

### 2. In-Range LP Events Filtering
We then identify all liquidity provision events (Mint/Burn) for positions that were in-range at the target block:
- Filter LP events by pool and block number (≤ target block)
- Only include positions where `tick_lower ≤ current_tick < tick_upper`
- Convert Burn events to negative liquidity amounts for proper aggregation

### 3. Position Ownership Tracking
To determine the current owner of each position, we track ownership changes through NFT transfers:
- Find the latest ownership change for each token_id at or before the target block
- Exclude transfers to the zero address (burned positions)
- This gives us the most recent owner of each position

### 4. Liquidity Aggregation and Filtering
Finally, we aggregate liquidity by position and apply filters:
- Sum liquidity amounts per position (token_id, tick_lower, tick_upper)
- Calculate the token0 and token1 holdings by $`x = L\frac{\sqrt{P}-\sqrt{P_b}}{\sqrt{P}*\sqrt{P_b}}`$ and $`y = L(\sqrt{P}-\sqrt{P_a})`$ where $`x`$ is the `token0` holding of the position and $`y`$ is the `token1` holding of the positions (excluding any accrued fees).
- Use the latest owner from step 3, falling back to the original LP event owner
- Filter out positions with zero or negative liquidity
- Exclude positions owned by the zero address
- Order results by liquidity amount (descending)


This methodology ensures accurate snapshots of active liquidity provision at any point in time, accounting for the dynamic nature of Uniswap V3 positions.

## Exposed API

We expose the following API:
`/lp-snapshot?pool=5777d92f208679DB4b9778590Fa3CAB3aC9e2168&block_number=23753712`

This will then output a list of the in-range LPs:
```json
{
  "result": [    
      {
        "liquidity": "285882538055745050066296",
        "token0Held": 26845832.2898499,
        "token1Held": 30324973.4259972,
        "tickLower": "-276326",
        "tickUpper": "-276322",
        "tokenId": "0",
        "positionOwner": "0x50379f632ca68d36e50cfbc8f78fe16bd1499d1e",
        "token0": "0x6b175474e89094c44da98b954eedeac495271d0f",
        "token1": "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48"
      },
      {
        "liquidity": "180912980957391541890",
        "token0Held": 16988.6540775426,
        "token1Held": 19190.3338247301,
        "tickLower": "-276326",
        "tickUpper": "-276322",
        "tokenId": "160967",
        "positionOwner": "0x96bcc2eb087633a7d434ac332ae436335f32989e",
        "token0": "0x6b175474e89094c44da98b954eedeac495271d0f",
        "token1": "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48"
      }
    ]
}
```

Where `token_id = 0` indicates a position that was not created via the `NFTPositionManager` contract, but directly via interacting with the pool.

