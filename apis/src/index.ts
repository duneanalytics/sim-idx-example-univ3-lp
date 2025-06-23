import { desc, eq, and, lte, sql, gt, ne } from "drizzle-orm";
import {
  lpEvents,
  poolTicksPerBlock,
  positionOwnerChanges,
} from "./db/schema/Listener"; // Adjust the import path as necessary
import {types, App, db} from "sim-idx";

const Address = types.Address;
const Uint = types.Uint;

const zeroAddress = Address.from("0000000000000000000000000000000000000000");

const app = App.create<{
    DB_CONNECTION_STRING: string; // Database connection string
    ASSETS: any; // Cloudflare Worker's asset fetcher
}>()

app.get("/", async (c) => {
  try {
    // Create a request for the static asset using the same origin
    const url = new URL("/index.html", c.req.url);
    const response = await c.env.ASSETS.fetch(url.toString());
    
    if (!response.ok) {
      return c.text("HTML template not found", 404);
    }
    
    const html = await response.text();
    return c.html(html);
  } catch (error) {
    console.error("Failed to fetch HTML template:", error);
    return c.text("Internal Server Error", 500);
  }
});

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

    const client = db.client(c)

    const poolTicks = client
      .select({
        block_number: poolTicksPerBlock.blockNumber,
        tick: poolTicksPerBlock.tick,
        sqrtPriceX96: poolTicksPerBlock.sqrtPriceX96,
        token0: poolTicksPerBlock.token0,
        token1: poolTicksPerBlock.token1,
        token0Decimals: poolTicksPerBlock.token0Decimals,
        token1Decimals: poolTicksPerBlock.token1Decimals,
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
        sqrtPriceX96Lower: lpEvents.sqrtPriceX96Lower,
        tickUpper: lpEvents.tickUpper,
        sqrtPriceX96Upper: lpEvents.sqrtPriceX96Upper,
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
          eq(positionOwnerChanges.blockNumber, latestPosChanges.latestBlock)
        )
      )
      .as("latestOwners");

    const result = client
      .select({
        liquidity: sql`sum(${lpEventsForPool.liqAmt})`
          .mapWith(lpEvents.amount)
          .as("liquidity"),
        token0Held:
          sql<number>`(sum(${lpEventsForPool.liqAmt}) * POW(2,96)) * (${lpEventsForPool.sqrtPriceX96Upper} - ${poolTicks.sqrtPriceX96}) / (${lpEventsForPool.sqrtPriceX96Upper} * ${poolTicks.sqrtPriceX96}) / POW(10,${poolTicks.token0Decimals})`.as(
            "token0Held"
          ),
        token1Held:
          sql<number>`sum(${lpEventsForPool.liqAmt}) * (${poolTicks.sqrtPriceX96} - ${lpEventsForPool.sqrtPriceX96Lower}) / POW(2,96) / POW(10,${poolTicks.token1Decimals})`.as(
            "token1Held"
          ),
        tickLower: lpEventsForPool.tickLower,
        tickUpper: lpEventsForPool.tickUpper,
        tokenId: lpEventsForPool.tokenId,
        positionOwner:
          sql`coalesce(${latestOwners.owner}, ${lpEventsForPool.owner})`
            .mapWith(latestOwners.owner)
            .as("positionOwner"),
        token0: poolTicks.token0,
        token1: poolTicks.token1,
      })
      .from(lpEventsForPool)
      .leftJoin(latestOwners, eq(lpEventsForPool.tokenId, latestOwners.tokenId))
      .rightJoin(
        poolTicks,
        eq(sql`1`.mapWith(poolTicks.tick), sql`1`.mapWith(poolTicks.tick))
      )
      .groupBy(
        sql`4,5,6,7,8,9`,
        poolTicks.tick,
        lpEventsForPool.sqrtPriceX96Lower,
        lpEventsForPool.sqrtPriceX96Upper,
        poolTicks.sqrtPriceX96,
        poolTicks.token0Decimals,
        poolTicks.token1Decimals
      )
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

export default app;
