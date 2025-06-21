# Uniswap V3 In-Range LPs

This app will index liquidity provision events on Uniswap V3 pools and expose an endpoint which can be used in order to query the in-range positions on a specific pools at every given block.

## Indexing Methodology

We use a `Listener.sol` file that does the following:
- Triggers on every `Burn`, `Mint` or `Swap` event on all Uniswap V3 pools using a set of ABI Triggers.
- Triggers on the `Transfer`, `IncreaseLiquidity` and `DecreaseLiquidity` events on the `NFTPositionManager` contract.
- Has a block trigger.

We define the following events in our `Listener.sol`:
```solidity
    /// Event to index the ownership changes of a positions in the NFTPositionManager.
    event PositionOwnerChanges(
        bytes32 txn_hash,
        uint256 block_number,
        uint256 block_timestamp,
        address from_address,
        address to_address,
        uint256 token_id,
        address pool
    );
    /// Event to index the changes in pool ticks
    event PoolTicksPerBlock(
        bytes32 txn_hash, 
        uint256 block_number, 
        uint256 block_timestamp, 
        address pool, 
        int64 tick
    );
    /// Event to track changes in liquidity of positions
    event LpEvents(
        bytes32 txn_hash,
        uint256 block_number,
        uint256 block_timestamp,
        address pool,
        string event_type,
        address owner,
        uint256 amount,
        int64 tick_lower,
        int64 tick_upper,
        uint256 token_id
    );
```

On each of the triggers we've defined for the `UniswapV3Pool` ABI, we will check if the pool is an official Uniswap V3 pool by querying its `factory()` method.
If so, we check if the owner of the position is the `NFTPositionManager` and if that's the case, we keep the details of the LP event in our ephemeral state in order to emit it later.
If the owner is not the `NFTPositionManager`, we emit the LP event message as is.
We use the triggers we have on `IncreaseLiquidity` and `DecreaseLiquidity` in order to augment the LP events we've saved with the `token_id` that is associated with the position we've saved in our ephemeral state. This will be later used in order to recover the owner of the position.
We use the `Transfer` trigger in order to keep track of the ownership of positions.
In addition, `Swap` events are used in order to keep track of the latest ticks for pools. We save those in the ephemeral state too as we need them to be emitted with a block-level granularity.
Finally, inside our block trigger, we emit all saved LP events and the pool ticks we've collected.

## Querying Methodology

The `/lp-snapshot` endpoint queries the 3 tables in our DB to determine in-range liquidity positions at a specific block number. The query executes in four main steps:

### 1. Pool Tick Discovery
First, we retrieve the latest tick for the specified pool at or before the target block number:
```sql
SELECT block_number, tick 
FROM pool_ticks_per_block 
WHERE pool = $pool AND block_number <= $block_number 
ORDER BY block_number DESC 
LIMIT 1
```

### 2. In-Range LP Events Filtering
We then identify all liquidity provision events (Mint/Burn) for positions that were in-range at the target block:
- Filter LP events by pool and block number (≤ target block)
- Only include positions where `tick_lower ≤ current_tick < tick_upper`
- Convert Burn events to negative liquidity amounts for proper aggregation

### 3. Position Ownership Tracking
To determine the current owner of each position, we track ownership changes through NFT transfers:
- Find the latest ownership change for each token_id at or before the target block
- Exclude transfers to the zero address (burned positions)
- This gives us the most recent owner of each position

### 4. Liquidity Aggregation and Filtering
Finally, we aggregate liquidity by position and apply filters:
- Sum liquidity amounts per position (token_id, tick_lower, tick_upper)
- Use the latest owner from step 3, falling back to the original LP event owner
- Filter out positions with zero or negative liquidity
- Exclude positions owned by the zero address
- Order results by liquidity amount (descending)

### Key Features
- **Historical Accuracy**: Queries reflect the exact state at any given block number
- **Ownership Tracking**: Properly handles NFT position transfers between addresses  
- **In-Range Filtering**: Only returns positions that were actively providing liquidity at the target block
- **Burn Event Handling**: Correctly processes liquidity removal events as negative amounts

This methodology ensures accurate snapshots of active liquidity provision at any point in time, accounting for the dynamic nature of Uniswap V3 positions.

## Exposed API

We expose the following API:
`/lp-snapshot?pool=88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640&block_number=22724487`

This will then output a list of the in-range LPs:
```json
{
  "result": {
    "command": "SELECT",
    "rowCount": 3,
    "rows": [
      {
        "liquidity": "12244203218792096471",
        "tick_lower": "197870",
        "tick_upper": "197880",
        "token_id": "101296",
        "positionOwner": "fa73235bcd46121711930be3be734b5e41cbcce1"
      },
      {
        "liquidity": "10827420034540291866",
        "tick_lower": "196860",
        "tick_upper": "199870",
        "token_id": "196903",
        "positionOwner": "ecaa8f3636270ee917c5b08d6324722c2c4951c7"
      },
      {
        "liquidity": "2474274880955151222",
        "tick_lower": "197870",
        "tick_upper": "198070",
        "token_id": "0",
        "positionOwner": "8aff5ca996f77487a4f04f1ce905bf3d27455580"
      }
    ]
  }
}
```

Where `token_id = 0` indicates a position that was not created via the `NFTPositionManager` contract, but directly via interacting with the pool.

