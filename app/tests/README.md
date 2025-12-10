# E2E Smoke Tests

This directory contains Playwright-based smoke tests for key routes.

## Setup

1. Install dependencies and browsers:

```
pnpm add -D playwright
npx playwright install
```

Or with npm:

```
npm install -D playwright
npx playwright install
```

## Running tests

First start the app (dev or preview):

```
npm run dev
# or
npm run build
npm run preview
```

Then run tests:

```
npm run test:e2e
```

