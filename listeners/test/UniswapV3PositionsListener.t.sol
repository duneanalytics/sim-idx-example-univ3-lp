// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {UniswapV3PositionsListener} from "../src/UniswapV3PositionsListener.sol";
import "sim-idx-sol/Simidx.sol";
import {MockContexts} from "sim-idx-sol/test/MockContexts.sol";

contract UniswapV3PositionsListenerTest is Test {
    UniswapV3PositionsListener public listener;

    function setUp() public {
        listener = new UniswapV3PositionsListener();
        vm.recordLogs();
    }
}
