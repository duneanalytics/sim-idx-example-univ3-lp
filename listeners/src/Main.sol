// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-sol/Simidx.sol";
import "sim-idx-generated/Generated.sol";
import {UniswapV3PositionsListener} from "./UniswapV3PositionsListener.sol";
import {FACTORY, POSITION_MANAGER} from "./Constants.sol";

contract Triggers is BaseTriggers {
    function triggers() external virtual override {
        UniswapV3PositionsListener listener = new UniswapV3PositionsListener();
        addTrigger(ChainIdAbi(1, UniswapV3Pool$Abi()), listener.triggerOnBurnEvent());
        addTrigger(ChainIdAbi(1, UniswapV3Pool$Abi()), listener.triggerOnMintEvent());
        addTrigger(ChainIdAbi(1, UniswapV3Pool$Abi()), listener.triggerOnSwapEvent());
        addTrigger(ChainIdContract(1, POSITION_MANAGER), listener.triggerOnTransferEvent());
        addTrigger(ChainIdContract(1, POSITION_MANAGER), listener.triggerOnIncreaseLiquidityEvent());
        addTrigger(ChainIdContract(1, POSITION_MANAGER), listener.triggerOnDecreaseLiquidityEvent());
        addTrigger(ChainIdGlobal(1), listener.triggerOnBlock());
    }
}
