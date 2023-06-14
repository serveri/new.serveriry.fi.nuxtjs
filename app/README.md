# Frontend

## Development

### How to contribute

Contributions are welcome! Please read [CONTRIBUTING.md](../.github/CONTRIBUTING.md) for details on our code of conduct, and the
process for submitting pull requests to us.

### How to run

1. `npm install`
2. Set environment variables in `.env` file (you can use `https://api.serveriry.fi/` or your own [Directus] instance ip)
3. `npm run dev`
4. Open browser at `http://localhost:3000`

See [Directus instructions](../backend/development/README.md) for information about hosting your own Directus instance.

### How to build

1. `npm run build`
2. `npm run start`
3. Open browser at `http://localhost:3000`
4. To stop, press `Ctrl + C` in terminal

## Tech

This project uses following technologies:

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

Translations are located at [/src/lang](src/lang) folder. Add labels and translations to all JSON files.

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

To import more icons, edit [/src/plugins/fontawesome.ts](src/plugins/fontawesome.ts)

See official [documentation](https://fontawesome.com/docs/web/use-with/vue/use-with).

### Tailwind CSS

How to use tailwind?

#### Dark mode

Example of how to define separate dark style:

```vue
<p class="text-white dark:text-black"></p>
```

See official [documentation](https://tailwindcss.com/).

