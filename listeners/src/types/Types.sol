// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

struct LpEvent {
    bytes32 txn_hash;
    uint256 block_number;
    uint256 block_timestamp;
    address pool;
    string event_type;
    address owner;
    uint256 amount;
    int64 tick_lower;
    uint256 sqrt_price_x96_lower;
    int64 tick_upper;
    uint256 sqrt_price_x96_upper;
    uint256 token_id;
}

struct PoolTick {
    bytes32 txn_hash;
    uint256 block_number;
    uint256 block_timestamp;
    address pool;
    int64 tick;
    uint256 sqrt_price_x96;
    address token0;
    address token1;
    uint64 token0_decimals;
    uint64 token1_decimals;
}
