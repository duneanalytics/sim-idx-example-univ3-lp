// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-sol/Simidx.sol";
import "sim-idx-generated/Generated.sol";
import {UniswapV3PositionsListener} from "./UniswapV3PositionsListener.sol";
import {FACTORY, POSITION_MANAGER} from "./Constants.sol";

contract Triggers is BaseTriggers {
    function triggers() external virtual override {
        UniswapV3PositionsListener listener = new UniswapV3PositionsListener();
        addTrigger(chainAbi(Chains.Ethereum, UniswapV3Pool$Abi()), listener.triggerOnBurnEvent());
        addTrigger(chainAbi(Chains.Ethereum, UniswapV3Pool$Abi()), listener.triggerOnMintEvent());
        addTrigger(chainAbi(Chains.Ethereum, UniswapV3Pool$Abi()), listener.triggerOnSwapEvent());
        addTrigger(chainContract(Chains.Ethereum, POSITION_MANAGER), listener.triggerOnTransferEvent());
        addTrigger(chainContract(Chains.Ethereum, POSITION_MANAGER), listener.triggerOnIncreaseLiquidityEvent());
        addTrigger(chainContract(Chains.Ethereum, POSITION_MANAGER), listener.triggerOnDecreaseLiquidityEvent());
        addTrigger(chainGlobal(Chains.Ethereum), listener.triggerOnBlock());
    }
}
