# new.serveriry.fi.nextjs

[![Vue v3](https://img.shields.io/badge/Vue-v3.3-blue)](https://vuejs.org/)
[![Nuxt](https://img.shields.io/badge/Nuxt-v3.4-blue)](https://nuxt.com/)
[![TypeScript](https://img.shields.io/badge/TypeScript-v4.9-blue)](https://www.typescriptlang.org/)
[![Node v18](https://img.shields.io/badge/NodeJS-v18-blue)](https://nodejs.org/en/)
[![Tailwind](https://img.shields.io/badge/TailwindCSS-v3-blue)](https://tailwindcss.com/)
[![code style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square)](https://github.com/prettier/prettier)

### Table of Contents

- [Frontend](#frontend)
- [Backend](#backend)
- [Docker Commands](#docker-commands)
  - [Development](#development-1)
  - [Production](#production)
- [Development](#development)
  - [Docker services](#services)

This project is [Vue] app that uses [Nuxt] to provide SSR and SEO for web application. Directus is used as a headless
CMS.

## Frontend

See [frontend README](./app/README.md) for more information.

## Backend

See [backend README](./backend/README.md) for more information.

## Development

### How to contribute

See [CONTRIBUTING.md](.github/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull
requests to us.

## Docker Commands

[Vue] app and [Directus] api are hosted in [Docker] containers.

### Development

#### Command Line

1. `pnpm install`
2. `pnpm run dev`

#### Docker

- start - `docker compose up -d --build`
- stop - `docker compose down -v`
- logs - `docker compose logs -f`

### Production

1. Clone git repository.
2. Copy `.env.prod` and `.env.prod.db` files to parent folder using `cp <filename> <../filename>`
3. Edit `CHANGE_ME` values to safe passwords etc. in those `.env` files
4. Start container (you may have to install `docker compose` command)

- start - `docker compose -f docker-compose.prod.yml up -d --build`
- stop - `docker compose -f docker-compose.prod.yml down`
- logs - `docker compose -f docker-compose.prod.yml logs`

### Updating production

1. Navigate to build repositary and run `git pull`
2. Reload docker with `docker compose -f docker-compose.prod.yml up -d --build`

## Testing GitHub Actions locally (act)

This repository includes `.actrc` to hard-code the local runner mapping so `act` does not ask interactive image-size questions.

### Prerequisites

1. Docker Desktop running
2. `act` installed, for example:
   - Windows: `winget install nektos.act`
   - macOS: `brew install act`
   - Linux: `brew install act` (via Homebrew on Linux) or see https://github.com/nektos/act#installation

### Run the Playwright workflow locally

From repository root:

1. `act -l`
2. `act workflow_dispatch -j test -v`


### Other

- Go inside container - `docker exec -it {{name}} bash`

See docker compose [docs](./app/DOCKER-COMPOSE.md)

### Services

| Name     | Image       | IP:Port        | Explanation              |
| -------- | ----------- | -------------- | ------------------------ |
| app      | http-server | 10.10.0.2:8000 | HTTP server for frontend |
| db       | postgresql  | 10.10.0.3:5432 | Database for Directus    |
| cache    | redis       | 10.10.0.4      | Cache for Directus       |
| directus | directus    | 10.10.0.4:8001 | CMS                      |

[Docker]: https://www.docker.com/
[Vue]: https://vuejs.org/
[serveri ry]: https://serveriry.fi
[Directus]: https://directus.io/
[prettify]: https://www.js.com/package/prettify
[Nuxt 3]: https://nuxt.com/
