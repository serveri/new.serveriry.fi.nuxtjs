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
pnpm dev
# or
pnpm build
pnpm preview
```

Then run tests:

```
pnpm test:e2e
```

## Live Directus CMS tests (opt-in)

CMS integration tests are tagged with `@cms` and excluded from normal runs, including CI default runs.

Run them explicitly:

```
pnpm test:e2e:cms
```

Defaults used by the CMS test command:

- `NUXT_API_URL` defaults to `https://api.serveriry.fi/` (from Nuxt runtime config)
- `CMS_BASE_URL` defaults to `NUXT_API_URL` or `https://api.serveriry.fi/`

Override these env vars if your local Directus is on a different URL/port.

PowerShell example for local Directus:

```
$env:NUXT_API_URL='http://127.0.0.1:30001/'
$env:CMS_BASE_URL='http://127.0.0.1:30001'
pnpm test:e2e:cms
```

