# new.serveriry.fi

[![Vue v3](https://img.shields.io/badge/Vue-v3-blue)](https://vuejs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-v4.9-blue)](https://www.typescriptlang.org/)
[![Node v19](https://img.shields.io/badge/NodeJS-v19-green)](https://nodejs.org/en/)
[![code style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square)](https://github.com/prettier/prettier)

New webpages for [serveri ry]. 
Built using Vue and TypeScript.
Using Directus for Content Management.

## Docker Commands

[Vue] app and [Directus] api are hosted in [Docker] containers.

### Development

Please, commit only small pieces of new code at each time. Commit message should tell
what changes were made. Before pushing changes please make sure that your code follows
[prettify] syntax and has not warning or errors.

Work on your own branch and once ready with one set of changes, make pull request to 
development branch. It would be good practice that at least one other developer looks
through your commits before merging changes.

#### Command Line

1. ``nmp install``
2. ``npm run dev``

#### Docker

- start - ``docker-compose up -d --build``
- stop - ``docker-compose down -v``
- logs - ``docker-compose logs -f``

### Production

1. Clone git repository.
2. Copy `.env.prod` and `.env.prod.db` files to parent folder using `cp <filename> <../filename>`
3. Edit `CHANGE_ME` values to safe passwords etc. in those ``.env`` files
4. Start container (you may have to install docker-compose command)

- start - ``docker-compose -f docker-compose.prod.yml up -d --build``
- stop - ``docker-compose -f docker-compose.prod.yml down``
- logs - ``docker-compose -f docker-compose.prod.yml logs``

### Other

- Go inside container - ``docker exec -it {{name}} bash``

See docker-compose [docs](./app/DOCKER-COMPOSE.md)

## Tech

| Service  | Tech       | Version | Explanation                         |
|----------|------------|---------|-------------------------------------|
| frontend | Vue        | v3.2.45 | Vue is used to build frontend :)    |
| frontend | TypeScript |         | JavaScript like language with types |
| backend  | Directus   | v9.22.4 | Content Management Service (CMS)    |

### Docker-Compose Services

| Name     | Image       | IP:Port        | Explanation              |
|----------|-------------|----------------|--------------------------|
| app      | http-server | 10.10.0.2:8000 | HTTP server for frontend |
| db       | postgresql  | 10.10.0.3:5432 | Database for Directus    |
| cache    | redis       | 10.10.0.4      | Cache for Directus       |
| directus | directus    | 10.10.0.4:8001 | CMS                      |

[Docker]: <https://www.docker.com/>
[Vue]: <https://vuejs.org/>
[serveri ry]: <https://serveriry.fi>
[Directus]: <https://directus.io/>
[prettify]: <https://www.npmjs.com/package/prettify>