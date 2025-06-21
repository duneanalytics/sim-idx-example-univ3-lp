
import { pgEnum, pgTable as table } from "drizzle-orm/pg-core";
import * as t from "drizzle-orm/pg-core";
import { simDb, simTypes } from "sim-idx";

export const lpEvents = table("lp_events", {
  txnHash: simDb.bytes32('txn_hash'),
  blockNumber: simDb.uint256('block_number'),
  blockTimestamp: simDb.uint256('block_timestamp'),
  pool: simDb.address('pool'),
  eventType: t.text('event_type'),
  owner: simDb.address('owner'),
  amount: simDb.uint256('amount'),
  tickLower: simDb.int64('tick_lower'),
  tickUpper: simDb.int64('tick_upper'),
  tokenId: simDb.uint256('token_id'),
})

export const poolTicksPerBlock = table("pool_ticks_per_block", {
  txnHash: simDb.bytes32('txn_hash'),
  blockNumber: simDb.uint256('block_number'),
  blockTimestamp: simDb.uint256('block_timestamp'),
  pool: simDb.address('pool'),
  tick: simDb.int64('tick'),
})

export const positionOwnerChanges = table("position_owner_changes", {
  txnHash: simDb.bytes32('txn_hash'),
  blockNumber: simDb.uint256('block_number'),
  blockTimestamp: simDb.uint256('block_timestamp'),
  fromAddress: simDb.address('from_address'),
  toAddress: simDb.address('to_address'),
  tokenId: simDb.uint256('token_id'),
  pool: simDb.address('pool'),
})
