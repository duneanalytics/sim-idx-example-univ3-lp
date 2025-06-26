
// Generated file. Do not edit manually.
import { pgEnum, pgTable as table } from "drizzle-orm/pg-core";
import * as t from "drizzle-orm/pg-core";
import { db, types } from "@duneanalytics/sim-idx";

export const lpEvents = table("lp_events", {
  txnHash: db.bytes32('txn_hash'),
  blockNumber: db.uint256('block_number'),
  blockTimestamp: db.uint256('block_timestamp'),
  pool: db.address('pool'),
  eventType: t.text('event_type'),
  owner: db.address('owner'),
  amount: db.uint256('amount'),
  tickLower: db.int64('tick_lower'),
  sqrtPriceX96Lower: db.uint256('sqrt_price_x96_lower'),
  tickUpper: db.int64('tick_upper'),
  sqrtPriceX96Upper: db.uint256('sqrt_price_x96_upper'),
  tokenId: db.uint256('token_id'),
})

export const poolTicksPerBlock = table("pool_ticks_per_block", {
  txnHash: db.bytes32('txn_hash'),
  blockNumber: db.uint256('block_number'),
  blockTimestamp: db.uint256('block_timestamp'),
  pool: db.address('pool'),
  tick: db.int64('tick'),
  sqrtPriceX96: db.uint256('sqrt_price_x96'),
  token0: db.address('token0'),
  token1: db.address('token1'),
  token0Decimals: db.uint64('token0_decimals'),
  token1Decimals: db.uint64('token1_decimals'),
})

export const positionOwnerChanges = table("position_owner_changes", {
  txnHash: db.bytes32('txn_hash'),
  blockNumber: db.uint256('block_number'),
  blockTimestamp: db.uint256('block_timestamp'),
  fromAddress: db.address('from_address'),
  toAddress: db.address('to_address'),
  tokenId: db.uint256('token_id'),
  pool: db.address('pool'),
})
