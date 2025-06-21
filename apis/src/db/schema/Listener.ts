import { pgEnum, pgTable as table } from "drizzle-orm/pg-core";
import * as t from "drizzle-orm/pg-core";
import { simDb, simTypes } from "sim-idx";

export const poolCreated = table("pool_created", {
  chainId: simDb.uint64('chain_id'),
  caller: simDb.address('caller'),
  pool: simDb.address('pool'),
  token0: simDb.address('token0'),
  token1: simDb.address('token1'),
  fee: simDb.uint24('fee'),
})
