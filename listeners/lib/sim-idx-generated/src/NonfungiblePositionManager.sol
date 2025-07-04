// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/sim-idx-sol/src/Triggers.sol";
import "lib/sim-idx-sol/src/Context.sol";

function NonfungiblePositionManager$Abi() pure returns (Abi memory) {
    return Abi("NonfungiblePositionManager");
}
struct NonfungiblePositionManager$domainSeparatorFunctionOutputs {
    bytes32 outArg0;
}

struct NonfungiblePositionManager$permitTypehashFunctionOutputs {
    bytes32 outArg0;
}

struct NonfungiblePositionManager$weth9FunctionOutputs {
    address outArg0;
}

struct NonfungiblePositionManager$approveFunctionInputs {
    address to;
    uint256 tokenId;
}

struct NonfungiblePositionManager$balanceOfFunctionInputs {
    address owner;
}

struct NonfungiblePositionManager$balanceOfFunctionOutputs {
    uint256 outArg0;
}

struct NonfungiblePositionManager$baseUriFunctionOutputs {
    string outArg0;
}

struct NonfungiblePositionManager$burnFunctionInputs {
    uint256 tokenId;
}

struct NonfungiblePositionManager$CollectParams {
    uint256 tokenId;
    address recipient;
    uint128 amount0Max;
    uint128 amount1Max;
}

struct NonfungiblePositionManager$collectFunctionInputs {
    NonfungiblePositionManager$CollectParams params;
}

struct NonfungiblePositionManager$collectFunctionOutputs {
    uint256 amount0;
    uint256 amount1;
}

struct NonfungiblePositionManager$createAndInitializePoolIfNecessaryFunctionInputs {
    address token0;
    address token1;
    uint24 fee;
    uint160 sqrtPriceX96;
}

struct NonfungiblePositionManager$createAndInitializePoolIfNecessaryFunctionOutputs {
    address pool;
}

struct NonfungiblePositionManager$DecreaseLiquidityParams {
    uint256 tokenId;
    uint128 liquidity;
    uint256 amount0Min;
    uint256 amount1Min;
    uint256 deadline;
}

struct NonfungiblePositionManager$decreaseLiquidityFunctionInputs {
    NonfungiblePositionManager$DecreaseLiquidityParams params;
}

struct NonfungiblePositionManager$decreaseLiquidityFunctionOutputs {
    uint256 amount0;
    uint256 amount1;
}

struct NonfungiblePositionManager$factoryFunctionOutputs {
    address outArg0;
}

struct NonfungiblePositionManager$getApprovedFunctionInputs {
    uint256 tokenId;
}

struct NonfungiblePositionManager$getApprovedFunctionOutputs {
    address outArg0;
}

struct NonfungiblePositionManager$IncreaseLiquidityParams {
    uint256 tokenId;
    uint256 amount0Desired;
    uint256 amount1Desired;
    uint256 amount0Min;
    uint256 amount1Min;
    uint256 deadline;
}

struct NonfungiblePositionManager$increaseLiquidityFunctionInputs {
    NonfungiblePositionManager$IncreaseLiquidityParams params;
}

struct NonfungiblePositionManager$increaseLiquidityFunctionOutputs {
    uint128 liquidity;
    uint256 amount0;
    uint256 amount1;
}

struct NonfungiblePositionManager$isApprovedForAllFunctionInputs {
    address owner;
    address operator;
}

struct NonfungiblePositionManager$isApprovedForAllFunctionOutputs {
    bool outArg0;
}

struct NonfungiblePositionManager$MintParams {
    address token0;
    address token1;
    uint24 fee;
    int24 tickLower;
    int24 tickUpper;
    uint256 amount0Desired;
    uint256 amount1Desired;
    uint256 amount0Min;
    uint256 amount1Min;
    address recipient;
    uint256 deadline;
}

struct NonfungiblePositionManager$mintFunctionInputs {
    NonfungiblePositionManager$MintParams params;
}

struct NonfungiblePositionManager$mintFunctionOutputs {
    uint256 tokenId;
    uint128 liquidity;
    uint256 amount0;
    uint256 amount1;
}

struct NonfungiblePositionManager$multicallFunctionInputs {
    bytes[] data;
}

struct NonfungiblePositionManager$multicallFunctionOutputs {
    bytes[] results;
}

struct NonfungiblePositionManager$nameFunctionOutputs {
    string outArg0;
}

struct NonfungiblePositionManager$ownerOfFunctionInputs {
    uint256 tokenId;
}

struct NonfungiblePositionManager$ownerOfFunctionOutputs {
    address outArg0;
}

struct NonfungiblePositionManager$permitFunctionInputs {
    address spender;
    uint256 tokenId;
    uint256 deadline;
    uint8 v;
    bytes32 r;
    bytes32 s;
}

struct NonfungiblePositionManager$positionsFunctionInputs {
    uint256 tokenId;
}

struct NonfungiblePositionManager$positionsFunctionOutputs {
    uint96 nonce;
    address operator;
    address token0;
    address token1;
    uint24 fee;
    int24 tickLower;
    int24 tickUpper;
    uint128 liquidity;
    uint256 feeGrowthInside0LastX128;
    uint256 feeGrowthInside1LastX128;
    uint128 tokensOwed0;
    uint128 tokensOwed1;
}

struct NonfungiblePositionManager$safeTransferFromFunctionInputs {
    address from;
    address to;
    uint256 tokenId;
}

struct NonfungiblePositionManager$selfPermitFunctionInputs {
    address token;
    uint256 value;
    uint256 deadline;
    uint8 v;
    bytes32 r;
    bytes32 s;
}

struct NonfungiblePositionManager$selfPermitAllowedFunctionInputs {
    address token;
    uint256 nonce;
    uint256 expiry;
    uint8 v;
    bytes32 r;
    bytes32 s;
}

struct NonfungiblePositionManager$selfPermitAllowedIfNecessaryFunctionInputs {
    address token;
    uint256 nonce;
    uint256 expiry;
    uint8 v;
    bytes32 r;
    bytes32 s;
}

struct NonfungiblePositionManager$selfPermitIfNecessaryFunctionInputs {
    address token;
    uint256 value;
    uint256 deadline;
    uint8 v;
    bytes32 r;
    bytes32 s;
}

struct NonfungiblePositionManager$setApprovalForAllFunctionInputs {
    address operator;
    bool approved;
}

struct NonfungiblePositionManager$supportsInterfaceFunctionInputs {
    bytes4 interfaceId;
}

struct NonfungiblePositionManager$supportsInterfaceFunctionOutputs {
    bool outArg0;
}

struct NonfungiblePositionManager$sweepTokenFunctionInputs {
    address token;
    uint256 amountMinimum;
    address recipient;
}

struct NonfungiblePositionManager$symbolFunctionOutputs {
    string outArg0;
}

struct NonfungiblePositionManager$tokenByIndexFunctionInputs {
    uint256 index;
}

struct NonfungiblePositionManager$tokenByIndexFunctionOutputs {
    uint256 outArg0;
}

struct NonfungiblePositionManager$tokenOfOwnerByIndexFunctionInputs {
    address owner;
    uint256 index;
}

struct NonfungiblePositionManager$tokenOfOwnerByIndexFunctionOutputs {
    uint256 outArg0;
}

struct NonfungiblePositionManager$tokenUriFunctionInputs {
    uint256 tokenId;
}

struct NonfungiblePositionManager$tokenUriFunctionOutputs {
    string outArg0;
}

struct NonfungiblePositionManager$totalSupplyFunctionOutputs {
    uint256 outArg0;
}

struct NonfungiblePositionManager$transferFromFunctionInputs {
    address from;
    address to;
    uint256 tokenId;
}

struct NonfungiblePositionManager$uniswapV3MintCallbackFunctionInputs {
    uint256 amount0Owed;
    uint256 amount1Owed;
    bytes data;
}

struct NonfungiblePositionManager$unwrapWeth9FunctionInputs {
    uint256 amountMinimum;
    address recipient;
}

struct NonfungiblePositionManager$ApprovalEventParams {
    address owner;
    address approved;
    uint256 tokenId;
}

struct NonfungiblePositionManager$ApprovalForAllEventParams {
    address owner;
    address operator;
    bool approved;
}

struct NonfungiblePositionManager$CollectEventParams {
    uint256 tokenId;
    address recipient;
    uint256 amount0;
    uint256 amount1;
}

struct NonfungiblePositionManager$DecreaseLiquidityEventParams {
    uint256 tokenId;
    uint128 liquidity;
    uint256 amount0;
    uint256 amount1;
}

struct NonfungiblePositionManager$IncreaseLiquidityEventParams {
    uint256 tokenId;
    uint128 liquidity;
    uint256 amount0;
    uint256 amount1;
}

struct NonfungiblePositionManager$TransferEventParams {
    address from;
    address to;
    uint256 tokenId;
}

abstract contract NonfungiblePositionManager$OnApprovalEvent {
    function onApprovalEvent(EventContext memory ctx, NonfungiblePositionManager$ApprovalEventParams memory inputs) virtual external;

    function triggerOnApprovalEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes32(0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onApprovalEvent.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnApprovalForAllEvent {
    function onApprovalForAllEvent(EventContext memory ctx, NonfungiblePositionManager$ApprovalForAllEventParams memory inputs) virtual external;

    function triggerOnApprovalForAllEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes32(0x17307eab39ab6107e8899845ad3d59bd9653f200f220920489ca2b5937696c31),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onApprovalForAllEvent.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnCollectEvent {
    function onCollectEvent(EventContext memory ctx, NonfungiblePositionManager$CollectEventParams memory inputs) virtual external;

    function triggerOnCollectEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes32(0x40d0efd1a53d60ecbf40971b9daf7dc90178c3aadc7aab1765632738fa8b8f01),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onCollectEvent.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnDecreaseLiquidityEvent {
    function onDecreaseLiquidityEvent(EventContext memory ctx, NonfungiblePositionManager$DecreaseLiquidityEventParams memory inputs) virtual external;

    function triggerOnDecreaseLiquidityEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes32(0x26f6a048ee9138f2c0ce266f322cb99228e8d619ae2bff30c67f8dcf9d2377b4),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onDecreaseLiquidityEvent.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnIncreaseLiquidityEvent {
    function onIncreaseLiquidityEvent(EventContext memory ctx, NonfungiblePositionManager$IncreaseLiquidityEventParams memory inputs) virtual external;

    function triggerOnIncreaseLiquidityEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes32(0x3067048beee31b25b2f1681f88dac838c8bba36af25bfb2b7cf7473a5847e35f),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onIncreaseLiquidityEvent.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnTransferEvent {
    function onTransferEvent(EventContext memory ctx, NonfungiblePositionManager$TransferEventParams memory inputs) virtual external;

    function triggerOnTransferEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes32(0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferEvent.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnDomainSeparatorFunction {
    function onDomainSeparatorFunction(FunctionContext memory ctx, NonfungiblePositionManager$domainSeparatorFunctionOutputs memory outputs) virtual external;

    function triggerOnDomainSeparatorFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x3644e515),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onDomainSeparatorFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreDomainSeparatorFunction {
    function preDomainSeparatorFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreDomainSeparatorFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x3644e515),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preDomainSeparatorFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnPermitTypehashFunction {
    function onPermitTypehashFunction(FunctionContext memory ctx, NonfungiblePositionManager$permitTypehashFunctionOutputs memory outputs) virtual external;

    function triggerOnPermitTypehashFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x30adf81f),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPermitTypehashFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PrePermitTypehashFunction {
    function prePermitTypehashFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPrePermitTypehashFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x30adf81f),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePermitTypehashFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnWeth9Function {
    function onWeth9Function(FunctionContext memory ctx, NonfungiblePositionManager$weth9FunctionOutputs memory outputs) virtual external;

    function triggerOnWeth9Function() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x4aa4a4fc),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onWeth9Function.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreWeth9Function {
    function preWeth9Function(PreFunctionContext memory ctx) virtual external;

    function triggerPreWeth9Function() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x4aa4a4fc),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preWeth9Function.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnApproveFunction {
    function onApproveFunction(FunctionContext memory ctx, NonfungiblePositionManager$approveFunctionInputs memory inputs) virtual external;

    function triggerOnApproveFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x095ea7b3),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onApproveFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreApproveFunction {
    function preApproveFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$approveFunctionInputs memory inputs) virtual external;

    function triggerPreApproveFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x095ea7b3),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preApproveFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnBalanceOfFunction {
    function onBalanceOfFunction(FunctionContext memory ctx, NonfungiblePositionManager$balanceOfFunctionInputs memory inputs, NonfungiblePositionManager$balanceOfFunctionOutputs memory outputs) virtual external;

    function triggerOnBalanceOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x70a08231),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onBalanceOfFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreBalanceOfFunction {
    function preBalanceOfFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$balanceOfFunctionInputs memory inputs) virtual external;

    function triggerPreBalanceOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x70a08231),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preBalanceOfFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnBaseUriFunction {
    function onBaseUriFunction(FunctionContext memory ctx, NonfungiblePositionManager$baseUriFunctionOutputs memory outputs) virtual external;

    function triggerOnBaseUriFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x6c0360eb),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onBaseUriFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreBaseUriFunction {
    function preBaseUriFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreBaseUriFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x6c0360eb),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preBaseUriFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnBurnFunction {
    function onBurnFunction(FunctionContext memory ctx, NonfungiblePositionManager$burnFunctionInputs memory inputs) virtual external;

    function triggerOnBurnFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x42966c68),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onBurnFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreBurnFunction {
    function preBurnFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$burnFunctionInputs memory inputs) virtual external;

    function triggerPreBurnFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x42966c68),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preBurnFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnCollectFunction {
    function onCollectFunction(FunctionContext memory ctx, NonfungiblePositionManager$collectFunctionInputs memory inputs, NonfungiblePositionManager$collectFunctionOutputs memory outputs) virtual external;

    function triggerOnCollectFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xfc6f7865),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onCollectFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreCollectFunction {
    function preCollectFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$collectFunctionInputs memory inputs) virtual external;

    function triggerPreCollectFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xfc6f7865),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preCollectFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnCreateAndInitializePoolIfNecessaryFunction {
    function onCreateAndInitializePoolIfNecessaryFunction(FunctionContext memory ctx, NonfungiblePositionManager$createAndInitializePoolIfNecessaryFunctionInputs memory inputs, NonfungiblePositionManager$createAndInitializePoolIfNecessaryFunctionOutputs memory outputs) virtual external;

    function triggerOnCreateAndInitializePoolIfNecessaryFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x13ead562),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onCreateAndInitializePoolIfNecessaryFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreCreateAndInitializePoolIfNecessaryFunction {
    function preCreateAndInitializePoolIfNecessaryFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$createAndInitializePoolIfNecessaryFunctionInputs memory inputs) virtual external;

    function triggerPreCreateAndInitializePoolIfNecessaryFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x13ead562),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preCreateAndInitializePoolIfNecessaryFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnDecreaseLiquidityFunction {
    function onDecreaseLiquidityFunction(FunctionContext memory ctx, NonfungiblePositionManager$decreaseLiquidityFunctionInputs memory inputs, NonfungiblePositionManager$decreaseLiquidityFunctionOutputs memory outputs) virtual external;

    function triggerOnDecreaseLiquidityFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x0c49ccbe),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onDecreaseLiquidityFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreDecreaseLiquidityFunction {
    function preDecreaseLiquidityFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$decreaseLiquidityFunctionInputs memory inputs) virtual external;

    function triggerPreDecreaseLiquidityFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x0c49ccbe),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preDecreaseLiquidityFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnFactoryFunction {
    function onFactoryFunction(FunctionContext memory ctx, NonfungiblePositionManager$factoryFunctionOutputs memory outputs) virtual external;

    function triggerOnFactoryFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xc45a0155),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onFactoryFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreFactoryFunction {
    function preFactoryFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreFactoryFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xc45a0155),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preFactoryFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnGetApprovedFunction {
    function onGetApprovedFunction(FunctionContext memory ctx, NonfungiblePositionManager$getApprovedFunctionInputs memory inputs, NonfungiblePositionManager$getApprovedFunctionOutputs memory outputs) virtual external;

    function triggerOnGetApprovedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x081812fc),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onGetApprovedFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreGetApprovedFunction {
    function preGetApprovedFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$getApprovedFunctionInputs memory inputs) virtual external;

    function triggerPreGetApprovedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x081812fc),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preGetApprovedFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnIncreaseLiquidityFunction {
    function onIncreaseLiquidityFunction(FunctionContext memory ctx, NonfungiblePositionManager$increaseLiquidityFunctionInputs memory inputs, NonfungiblePositionManager$increaseLiquidityFunctionOutputs memory outputs) virtual external;

    function triggerOnIncreaseLiquidityFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x219f5d17),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onIncreaseLiquidityFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreIncreaseLiquidityFunction {
    function preIncreaseLiquidityFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$increaseLiquidityFunctionInputs memory inputs) virtual external;

    function triggerPreIncreaseLiquidityFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x219f5d17),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preIncreaseLiquidityFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnIsApprovedForAllFunction {
    function onIsApprovedForAllFunction(FunctionContext memory ctx, NonfungiblePositionManager$isApprovedForAllFunctionInputs memory inputs, NonfungiblePositionManager$isApprovedForAllFunctionOutputs memory outputs) virtual external;

    function triggerOnIsApprovedForAllFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xe985e9c5),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onIsApprovedForAllFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreIsApprovedForAllFunction {
    function preIsApprovedForAllFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$isApprovedForAllFunctionInputs memory inputs) virtual external;

    function triggerPreIsApprovedForAllFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xe985e9c5),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preIsApprovedForAllFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnMintFunction {
    function onMintFunction(FunctionContext memory ctx, NonfungiblePositionManager$mintFunctionInputs memory inputs, NonfungiblePositionManager$mintFunctionOutputs memory outputs) virtual external;

    function triggerOnMintFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x88316456),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onMintFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreMintFunction {
    function preMintFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$mintFunctionInputs memory inputs) virtual external;

    function triggerPreMintFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x88316456),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preMintFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnMulticallFunction {
    function onMulticallFunction(FunctionContext memory ctx, NonfungiblePositionManager$multicallFunctionInputs memory inputs, NonfungiblePositionManager$multicallFunctionOutputs memory outputs) virtual external;

    function triggerOnMulticallFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xac9650d8),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onMulticallFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreMulticallFunction {
    function preMulticallFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$multicallFunctionInputs memory inputs) virtual external;

    function triggerPreMulticallFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xac9650d8),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preMulticallFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnNameFunction {
    function onNameFunction(FunctionContext memory ctx, NonfungiblePositionManager$nameFunctionOutputs memory outputs) virtual external;

    function triggerOnNameFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x06fdde03),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onNameFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreNameFunction {
    function preNameFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreNameFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x06fdde03),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preNameFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnOwnerOfFunction {
    function onOwnerOfFunction(FunctionContext memory ctx, NonfungiblePositionManager$ownerOfFunctionInputs memory inputs, NonfungiblePositionManager$ownerOfFunctionOutputs memory outputs) virtual external;

    function triggerOnOwnerOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x6352211e),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onOwnerOfFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreOwnerOfFunction {
    function preOwnerOfFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$ownerOfFunctionInputs memory inputs) virtual external;

    function triggerPreOwnerOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x6352211e),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preOwnerOfFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnPermitFunction {
    function onPermitFunction(FunctionContext memory ctx, NonfungiblePositionManager$permitFunctionInputs memory inputs) virtual external;

    function triggerOnPermitFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x7ac2ff7b),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPermitFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PrePermitFunction {
    function prePermitFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$permitFunctionInputs memory inputs) virtual external;

    function triggerPrePermitFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x7ac2ff7b),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePermitFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnPositionsFunction {
    function onPositionsFunction(FunctionContext memory ctx, NonfungiblePositionManager$positionsFunctionInputs memory inputs, NonfungiblePositionManager$positionsFunctionOutputs memory outputs) virtual external;

    function triggerOnPositionsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x99fbab88),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPositionsFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PrePositionsFunction {
    function prePositionsFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$positionsFunctionInputs memory inputs) virtual external;

    function triggerPrePositionsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x99fbab88),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePositionsFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnRefundEthFunction {
    function onRefundEthFunction(FunctionContext memory ctx) virtual external;

    function triggerOnRefundEthFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x12210e8a),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onRefundEthFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreRefundEthFunction {
    function preRefundEthFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreRefundEthFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x12210e8a),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preRefundEthFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnSafeTransferFromFunction {
    function onSafeTransferFromFunction(FunctionContext memory ctx, NonfungiblePositionManager$safeTransferFromFunctionInputs memory inputs) virtual external;

    function triggerOnSafeTransferFromFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x42842e0e),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSafeTransferFromFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreSafeTransferFromFunction {
    function preSafeTransferFromFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$safeTransferFromFunctionInputs memory inputs) virtual external;

    function triggerPreSafeTransferFromFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x42842e0e),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSafeTransferFromFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnSelfPermitFunction {
    function onSelfPermitFunction(FunctionContext memory ctx, NonfungiblePositionManager$selfPermitFunctionInputs memory inputs) virtual external;

    function triggerOnSelfPermitFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xf3995c67),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSelfPermitFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreSelfPermitFunction {
    function preSelfPermitFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$selfPermitFunctionInputs memory inputs) virtual external;

    function triggerPreSelfPermitFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xf3995c67),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSelfPermitFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnSelfPermitAllowedFunction {
    function onSelfPermitAllowedFunction(FunctionContext memory ctx, NonfungiblePositionManager$selfPermitAllowedFunctionInputs memory inputs) virtual external;

    function triggerOnSelfPermitAllowedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x4659a494),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSelfPermitAllowedFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreSelfPermitAllowedFunction {
    function preSelfPermitAllowedFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$selfPermitAllowedFunctionInputs memory inputs) virtual external;

    function triggerPreSelfPermitAllowedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x4659a494),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSelfPermitAllowedFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnSelfPermitAllowedIfNecessaryFunction {
    function onSelfPermitAllowedIfNecessaryFunction(FunctionContext memory ctx, NonfungiblePositionManager$selfPermitAllowedIfNecessaryFunctionInputs memory inputs) virtual external;

    function triggerOnSelfPermitAllowedIfNecessaryFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xa4a78f0c),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSelfPermitAllowedIfNecessaryFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreSelfPermitAllowedIfNecessaryFunction {
    function preSelfPermitAllowedIfNecessaryFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$selfPermitAllowedIfNecessaryFunctionInputs memory inputs) virtual external;

    function triggerPreSelfPermitAllowedIfNecessaryFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xa4a78f0c),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSelfPermitAllowedIfNecessaryFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnSelfPermitIfNecessaryFunction {
    function onSelfPermitIfNecessaryFunction(FunctionContext memory ctx, NonfungiblePositionManager$selfPermitIfNecessaryFunctionInputs memory inputs) virtual external;

    function triggerOnSelfPermitIfNecessaryFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xc2e3140a),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSelfPermitIfNecessaryFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreSelfPermitIfNecessaryFunction {
    function preSelfPermitIfNecessaryFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$selfPermitIfNecessaryFunctionInputs memory inputs) virtual external;

    function triggerPreSelfPermitIfNecessaryFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xc2e3140a),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSelfPermitIfNecessaryFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnSetApprovalForAllFunction {
    function onSetApprovalForAllFunction(FunctionContext memory ctx, NonfungiblePositionManager$setApprovalForAllFunctionInputs memory inputs) virtual external;

    function triggerOnSetApprovalForAllFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xa22cb465),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetApprovalForAllFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreSetApprovalForAllFunction {
    function preSetApprovalForAllFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$setApprovalForAllFunctionInputs memory inputs) virtual external;

    function triggerPreSetApprovalForAllFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xa22cb465),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetApprovalForAllFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnSupportsInterfaceFunction {
    function onSupportsInterfaceFunction(FunctionContext memory ctx, NonfungiblePositionManager$supportsInterfaceFunctionInputs memory inputs, NonfungiblePositionManager$supportsInterfaceFunctionOutputs memory outputs) virtual external;

    function triggerOnSupportsInterfaceFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x01ffc9a7),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSupportsInterfaceFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreSupportsInterfaceFunction {
    function preSupportsInterfaceFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$supportsInterfaceFunctionInputs memory inputs) virtual external;

    function triggerPreSupportsInterfaceFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x01ffc9a7),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSupportsInterfaceFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnSweepTokenFunction {
    function onSweepTokenFunction(FunctionContext memory ctx, NonfungiblePositionManager$sweepTokenFunctionInputs memory inputs) virtual external;

    function triggerOnSweepTokenFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xdf2ab5bb),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSweepTokenFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreSweepTokenFunction {
    function preSweepTokenFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$sweepTokenFunctionInputs memory inputs) virtual external;

    function triggerPreSweepTokenFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xdf2ab5bb),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSweepTokenFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnSymbolFunction {
    function onSymbolFunction(FunctionContext memory ctx, NonfungiblePositionManager$symbolFunctionOutputs memory outputs) virtual external;

    function triggerOnSymbolFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x95d89b41),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSymbolFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreSymbolFunction {
    function preSymbolFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreSymbolFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x95d89b41),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSymbolFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnTokenByIndexFunction {
    function onTokenByIndexFunction(FunctionContext memory ctx, NonfungiblePositionManager$tokenByIndexFunctionInputs memory inputs, NonfungiblePositionManager$tokenByIndexFunctionOutputs memory outputs) virtual external;

    function triggerOnTokenByIndexFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x4f6ccce7),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTokenByIndexFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreTokenByIndexFunction {
    function preTokenByIndexFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$tokenByIndexFunctionInputs memory inputs) virtual external;

    function triggerPreTokenByIndexFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x4f6ccce7),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTokenByIndexFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnTokenOfOwnerByIndexFunction {
    function onTokenOfOwnerByIndexFunction(FunctionContext memory ctx, NonfungiblePositionManager$tokenOfOwnerByIndexFunctionInputs memory inputs, NonfungiblePositionManager$tokenOfOwnerByIndexFunctionOutputs memory outputs) virtual external;

    function triggerOnTokenOfOwnerByIndexFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x2f745c59),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTokenOfOwnerByIndexFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreTokenOfOwnerByIndexFunction {
    function preTokenOfOwnerByIndexFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$tokenOfOwnerByIndexFunctionInputs memory inputs) virtual external;

    function triggerPreTokenOfOwnerByIndexFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x2f745c59),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTokenOfOwnerByIndexFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnTokenUriFunction {
    function onTokenUriFunction(FunctionContext memory ctx, NonfungiblePositionManager$tokenUriFunctionInputs memory inputs, NonfungiblePositionManager$tokenUriFunctionOutputs memory outputs) virtual external;

    function triggerOnTokenUriFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xc87b56dd),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTokenUriFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreTokenUriFunction {
    function preTokenUriFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$tokenUriFunctionInputs memory inputs) virtual external;

    function triggerPreTokenUriFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xc87b56dd),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTokenUriFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnTotalSupplyFunction {
    function onTotalSupplyFunction(FunctionContext memory ctx, NonfungiblePositionManager$totalSupplyFunctionOutputs memory outputs) virtual external;

    function triggerOnTotalSupplyFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x18160ddd),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTotalSupplyFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreTotalSupplyFunction {
    function preTotalSupplyFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreTotalSupplyFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x18160ddd),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTotalSupplyFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnTransferFromFunction {
    function onTransferFromFunction(FunctionContext memory ctx, NonfungiblePositionManager$transferFromFunctionInputs memory inputs) virtual external;

    function triggerOnTransferFromFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x23b872dd),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferFromFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreTransferFromFunction {
    function preTransferFromFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$transferFromFunctionInputs memory inputs) virtual external;

    function triggerPreTransferFromFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x23b872dd),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTransferFromFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnUniswapV3MintCallbackFunction {
    function onUniswapV3MintCallbackFunction(FunctionContext memory ctx, NonfungiblePositionManager$uniswapV3MintCallbackFunctionInputs memory inputs) virtual external;

    function triggerOnUniswapV3MintCallbackFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xd3487997),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onUniswapV3MintCallbackFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreUniswapV3MintCallbackFunction {
    function preUniswapV3MintCallbackFunction(PreFunctionContext memory ctx, NonfungiblePositionManager$uniswapV3MintCallbackFunctionInputs memory inputs) virtual external;

    function triggerPreUniswapV3MintCallbackFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0xd3487997),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preUniswapV3MintCallbackFunction.selector
        });
    }
}

abstract contract NonfungiblePositionManager$OnUnwrapWeth9Function {
    function onUnwrapWeth9Function(FunctionContext memory ctx, NonfungiblePositionManager$unwrapWeth9FunctionInputs memory inputs) virtual external;

    function triggerOnUnwrapWeth9Function() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x49404b7c),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onUnwrapWeth9Function.selector
        });
    }
}

abstract contract NonfungiblePositionManager$PreUnwrapWeth9Function {
    function preUnwrapWeth9Function(PreFunctionContext memory ctx, NonfungiblePositionManager$unwrapWeth9FunctionInputs memory inputs) virtual external;

    function triggerPreUnwrapWeth9Function() view external returns (Trigger memory) {
        return Trigger({
            abiName: "NonfungiblePositionManager",
            selector: bytes4(0x49404b7c),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preUnwrapWeth9Function.selector
        });
    }
}

contract NonfungiblePositionManager$EmitAllEvents is
  NonfungiblePositionManager$OnApprovalEvent,
NonfungiblePositionManager$OnApprovalForAllEvent,
NonfungiblePositionManager$OnCollectEvent,
NonfungiblePositionManager$OnDecreaseLiquidityEvent,
NonfungiblePositionManager$OnIncreaseLiquidityEvent,
NonfungiblePositionManager$OnTransferEvent
{
  event Approval(address owner, address approved, uint256 tokenId);
event ApprovalForAll(address owner, address operator, bool approved);
event Collect(uint256 tokenId, address recipient, uint256 amount0, uint256 amount1);
event DecreaseLiquidity(uint256 tokenId, uint128 liquidity, uint256 amount0, uint256 amount1);
event IncreaseLiquidity(uint256 tokenId, uint128 liquidity, uint256 amount0, uint256 amount1);
event Transfer(address from, address to, uint256 tokenId);

  function onApprovalEvent(EventContext memory ctx, NonfungiblePositionManager$ApprovalEventParams memory inputs) virtual external override {
    emit Approval(inputs.owner, inputs.approved, inputs.tokenId);
  }
function onApprovalForAllEvent(EventContext memory ctx, NonfungiblePositionManager$ApprovalForAllEventParams memory inputs) virtual external override {
    emit ApprovalForAll(inputs.owner, inputs.operator, inputs.approved);
  }
function onCollectEvent(EventContext memory ctx, NonfungiblePositionManager$CollectEventParams memory inputs) virtual external override {
    emit Collect(inputs.tokenId, inputs.recipient, inputs.amount0, inputs.amount1);
  }
function onDecreaseLiquidityEvent(EventContext memory ctx, NonfungiblePositionManager$DecreaseLiquidityEventParams memory inputs) virtual external override {
    emit DecreaseLiquidity(inputs.tokenId, inputs.liquidity, inputs.amount0, inputs.amount1);
  }
function onIncreaseLiquidityEvent(EventContext memory ctx, NonfungiblePositionManager$IncreaseLiquidityEventParams memory inputs) virtual external override {
    emit IncreaseLiquidity(inputs.tokenId, inputs.liquidity, inputs.amount0, inputs.amount1);
  }
function onTransferEvent(EventContext memory ctx, NonfungiblePositionManager$TransferEventParams memory inputs) virtual external override {
    emit Transfer(inputs.from, inputs.to, inputs.tokenId);
  }

  function allTriggers() view external returns (Trigger[] memory) {
    Trigger[] memory triggers = new Trigger[](6);
    triggers[0] = this.triggerOnApprovalEvent();
    triggers[1] = this.triggerOnApprovalForAllEvent();
    triggers[2] = this.triggerOnCollectEvent();
    triggers[3] = this.triggerOnDecreaseLiquidityEvent();
    triggers[4] = this.triggerOnIncreaseLiquidityEvent();
    triggers[5] = this.triggerOnTransferEvent();
    return triggers;
  }
}