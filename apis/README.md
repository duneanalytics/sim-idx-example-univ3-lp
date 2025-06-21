# Sim IDX APIs

This directory contains the hosted APIs for the Sim IDX sample project.
These APIs provide endpoints to access and interact with the indexed blockchain data in the database.

## Prerequisites

- Node.js (v20 or higher)

## Getting Started

1. Install dependencies:

```bash
npm install
```

2. Set up environment variables:

Create a `.dev.vars` file in the `/apis` folder with the following:

```
DB_CONNECTION_STRING=your_database_connection_string
```

This environment variable is injected by default into `src/index.ts`.
You can find your database connection string in the CLI logs after successfully running `sim deploy`.

**Important:** After running `sim deploy`, a new database is created with a new connection string. Make sure to update your `.dev.vars` file with the new connection string from the CLI logs to ensure your local development environment connects to the correct database.

3. Start the development server:

```bash
npm run dev
```

The server will start on `http://localhost:8787` by default.

## Local Development

- The API server automatically reloads when you make changes in the `src/` directory
- Source code is located in the `src/` directory
- Main entry point is `src/index.ts`
