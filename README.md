# new.serveriry.fi.nextjs

[![Vue v3](https://img.shields.io/badge/Vue-v3-blue)](https://vuejs.org/)
[![Nuxt](https://img.shields.io/badge/Nuxt-v3.1-blue)](https://nuxt.com/)
[![TypeScript](https://img.shields.io/badge/TypeScript-v4.9-blue)](https://www.typescriptlang.org/)
[![Node v19](https://img.shields.io/badge/NodeJS-v19-blue)](https://nodejs.org/en/)
[![code style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square)](https://github.com/prettier/prettier)

New webpages for [serveri ry].

Built with [Nuxt 3].

Using [Directus] for Content Management.

<br>

### Table of Contents

- [Documentation](#Documentation)
  - [Links](#links)
  - [Localization](#localization--i18n)
  - [Icons](#icons--font-awesome)
  - [Tailwind](#tailwind-css)
    - [Dark mode](#dark-mode)
- [Docker Commands](#docker-commands)
  - [Development](#development-1)
  - [Production](#production)
- [Development](#development)
- [Tech stack](#tech)
  - [Docker services](#docker-compose-services)

---

## Documentation

### Links | Vue router

We use vue router for generating localized client side links:

Instead of regular `<a />` tags use `<nuxt-link :to="localePath(href)" />` when linking.

For **external links** still use `<a>` tags.

See official [documentation](https://nuxt.com/docs/api/components/nuxt-link).

### Localization | i18n

App supports both finnish and english, where finnish is default.

#### Links

When linking to internal resource use:

```vue
<nuxt-link :to="localePath(href)"> {{ $t('label') }}</nuxt-link>
```

#### Text

To localize text use:

```vue
<p> {{ $t('label') }} </p>
```

#### Adding translations

Translations are located at [/src/lang](app/src/lang) folder. Add labels and translations to all JSON files.

See official [documentation](https://i18n.nuxtjs.org/).

### Icons | Font Awesome

Icons are provided by [Font Awesome](https://fontawesome.com/).

To draw icons use:

```vue
<font-awesome-icon :icon="['fas', 'moon']" />
<!-- fa-solid fa-moon -->
<font-awesome-icon :icon="['fab', 'docker']" />
<!-- fa-brands fa-docker -->
```

To import more icons, edit [/src/plugins/fontawesome.ts](app/src/plugins/fontawesome.ts)

See official [documentation](https://fontawesome.com/docs/web/use-with/vue/use-with).

### Tailwind CSS

How to use tailwind?

#### Dark mode

Example of how to define separate dark style:

```vue
<p class="text-white dark:text-black"></p>
```

See official [documentation](https://tailwindcss.com/).

---

## Development

### How to contribute (ideally)

Please, commit only small pieces of new code at each time. Commit message should tell
what changes were made. Before pushing changes please make sure that your code follows
[prettify] syntax and has not warning or errors.

Work on your own branch and once ready with one set of changes, make pull request to
development branch. It would be good practice that at least one other developer looks
through your commits before merging changes.

---

## Docker Commands

[Vue] app and [Directus] api are hosted in [Docker] containers.

### Development

#### Command Line

1. `nmp install`
2. `npm run dev`

#### Docker

- start - `docker-compose up -d --build`
- stop - `docker-compose down -v`
- logs - `docker-compose logs -f`

### Production

1. Clone git repository.
2. Copy `.env.prod` and `.env.prod.db` files to parent folder using `cp <filename> <../filename>`
3. Edit `CHANGE_ME` values to safe passwords etc. in those `.env` files
4. Start container (you may have to install docker-compose command)

- start - `docker-compose -f docker-compose.prod.yml up -d --build`
- stop - `docker-compose -f docker-compose.prod.yml down`
- logs - `docker-compose -f docker-compose.prod.yml logs`

### Other

- Go inside container - `docker exec -it {{name}} bash`

See docker-compose [docs](./app/DOCKER-COMPOSE.md)

---

## Tech

| Service  | Tech        | Version     | Explanation                                   |
|----------|-------------|-------------|-----------------------------------------------|
| frontend | Vue         | v3.2.45     | Vue is used to build frontend :)              |
| frontend | Nuxt        | v3.1.0      | Nuxt provides SSR and SEO for web application |
| frontend | Vue router  | v4.1.6      | client-side navigation                        |
| frontend | i18n        | v8.0.0 beta | translate site to multiple languages          |
| frontend | fortawesome | v6.2.1      | Fontawesome icons for vue                     |
| frontend | tailwindcss | v3.2.4      | CSS framework with pre-defined CSS classes    |
| frontend | TypeScript  |             | JavaScript like language with types           |
| backend  | Directus    | v9.22.4     | Content Management Service (CMS)              |

### Docker-Compose Services

| Name     | Image       | IP:Port        | Explanation              |
|----------|-------------|----------------|--------------------------|
| app      | http-server | 10.10.0.2:8000 | HTTP server for frontend |
| db       | postgresql  | 10.10.0.3:5432 | Database for Directus    |
| cache    | redis       | 10.10.0.4      | Cache for Directus       |
| directus | directus    | 10.10.0.4:8001 | CMS                      |

test...

[Docker]: https://www.docker.com/
[Vue]: https://vuejs.org/
[serveri ry]: https://serveriry.fi
[Directus]: https://directus.io/
[prettify]: https://www.npmjs.com/package/prettify
[Nuxt 3]: https://nuxt.com/
