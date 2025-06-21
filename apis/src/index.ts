import { Hono } from "hono";
import { drizzle } from "drizzle-orm/neon-http";
import { desc, eq, and, lte, sql, gt, ne } from "drizzle-orm";
import { PgDialect } from "drizzle-orm/pg-core";
import { lpEvents, poolTicksPerBlock, positionOwnerChanges } from "./db/schema/Listener"; // Adjust the import path as necessary
import { simDb, simTypes } from "sim-idx";
const Address = simTypes.Address;
const Uint = simTypes.Uint;

type Bindings = {
  DB_CONNECTION_STRING: string;
};

let dbClient: ReturnType<typeof drizzle>;

const zeroAddress = Address.from("0000000000000000000000000000000000000000");

const app = new Hono<{ Bindings: Bindings }>();

app.get("/lp-snapshot", async (c) => {
  try {
    // read the pool address from the query params
    const poolParam = c.req.query("pool");
    const blockNumberParam = c.req.query("block_number");

    // Validate pool address parameter
    if (!poolParam) {
      return Response.json(
        { error: "Missing 'pool' query parameter" },
        { status: 400 }
      );
    }

    // Check if it's a valid hex string (only contains 0-9, a-f, A-F)
    if (!/^[0-9a-fA-F]+$/.test(poolParam)) {
      return Response.json(
        { error: "Pool address must be a valid hex string" },
        { status: 400 }
      );
    }

    // Check if it's exactly 40 characters (20 bytes when converted)
    if (poolParam.length !== 40) {
      return Response.json(
        { error: "Pool address must be exactly 20 bytes (40 hex characters)" },
        { status: 400 }
      );
    }

    // Convert to buffer after validation
    const pool = Address.from(poolParam);
    const blockNumber = parseInt(blockNumberParam, 10);

    const client = await getDBClient(c.env);

    const poolTicks = client
      .select({
        block_number: poolTicksPerBlock.blockNumber,
        tick: poolTicksPerBlock.tick,
      })
      .from(poolTicksPerBlock)
      .where(
        and(
          eq(poolTicksPerBlock.pool, pool),
          lte(poolTicksPerBlock.blockNumber, new Uint(BigInt(blockNumber)))
        )
      )
      .orderBy(desc(poolTicksPerBlock.blockNumber))
      .limit(1)
      .as("poolTicks");

    const lpEventsForPool = client
      .select({
        liqAmt:
          sql`case when ${lpEvents.eventType} = 'burn' then (-1 * ${lpEvents.amount}) else ${lpEvents.amount} end`
            .mapWith(lpEvents.amount)
            .as("liqAmt"),
        owner: lpEvents.owner,
        tickLower: lpEvents.tickLower,
        tickUpper: lpEvents.tickUpper,
        tokenId: lpEvents.tokenId,
      })
      .from(lpEvents)
      .innerJoin(
        poolTicks,
        and(
          lte(lpEvents.tickLower, poolTicks.tick),
          gt(lpEvents.tickUpper, poolTicks.tick)
        )
      )
      .where(
        and(
          eq(lpEvents.pool, pool),
          lte(lpEvents.blockNumber, new Uint(BigInt(blockNumber)))
        )
      )
      .as("lpEventsForPool");

    const latestPosChanges = client
      .select({
        tokenId: positionOwnerChanges.tokenId,
        latestBlock: sql`max(${positionOwnerChanges.blockNumber})`
          .mapWith(positionOwnerChanges.blockNumber)
          .as("latestBlock"),
      })
      .from(positionOwnerChanges)
      .where(
        and(
          eq(positionOwnerChanges.pool, pool),
          lte(positionOwnerChanges.blockNumber, new Uint(BigInt(blockNumber))),
          ne(positionOwnerChanges.toAddress, zeroAddress)
        )
      )
      .groupBy(positionOwnerChanges.tokenId)
      .as("latestPosChanges");

    const latestOwners = client
      .select({
        owner: positionOwnerChanges.toAddress,
        tokenId: positionOwnerChanges.tokenId,
      })
      .from(positionOwnerChanges)
      .innerJoin(
        latestPosChanges,
        and(
          eq(positionOwnerChanges.tokenId, latestPosChanges.tokenId),
          eq(
            positionOwnerChanges.blockNumber,
            latestPosChanges.latestBlock
          )
        )
      )
      .as("latestOwners");

    const result = client
      .select({
        liquidity: sql`sum(${lpEventsForPool.liqAmt})`
          .mapWith(lpEvents.amount)
          .as("liquidity"),
        tickLower: lpEventsForPool.tickLower,
        tickUpper: lpEventsForPool.tickUpper,
        tokenId: lpEventsForPool.tokenId,
        positionOwner:
          sql`coalesce(${latestOwners.owner}, ${lpEventsForPool.owner})`
            .mapWith(latestOwners.owner)
            .as("positionOwner"),
      })
      .from(lpEventsForPool)
      .leftJoin(latestOwners, eq(lpEventsForPool.tokenId, latestOwners.tokenId))
      .groupBy(sql`2,3,4,5`)
      .having(
        sql<boolean>`sum(${lpEventsForPool.liqAmt}) > 0 and coalesce(${latestOwners.owner}, ${lpEventsForPool.owner}) != ${zeroAddress}`
      )
      .orderBy(
        sql`sum(${lpEventsForPool.liqAmt}) desc`.mapWith(lpEvents.amount)
      );
    
    const res = await result;

    return Response.json({
      result: res,
    });
  } catch (e) {
    console.error("Database operation failed:", e);
    console.error("Cause:", (e as Error).cause);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

// Lazily initializes and returns a shared, connected dbClient instance.
async function getDBClient(env: Bindings) {
  if (!env.DB_CONNECTION_STRING) {
    throw new Error(
      "Missing required environment variable: DB_CONNECTION_STRING"
    );
  }

  if (!dbClient) {
    dbClient = drizzle(env.DB_CONNECTION_STRING);
  }

  return dbClient;
}

export default app;
