export default {
   ssr: true,
   srcDir: 'src/',
   css: ['~/assets/css/main.css'],
   postcss: {
      plugins: {
         tailwindcss: {},
         autoprefixer: {},
      },
   },
   plugins: [{ src: '~/plugins/fontawesome.ts' }],
   modules: ['@nuxtjs/i18n', 'nuxt-delay-hydration'],
   i18n: {
      vueI18n: {
         fallbackLocale: ['fi', 'en'],
      },
      locales: [
         {
            code: 'fi',
            iso: 'fi-FI',
            file: 'fi.json',
         },
         {
            code: 'en',
            iso: 'en-US',
            file: 'en.json',
         },
      ],
      lazy: false,
      langDir: 'lang/',
      defaultLocale: 'fi',
   },
   delayHydration: {
      mode: 'init',
      // enables nuxt-delay-hydration in dev mode for testing
      debug: process.env.NODE_ENV === 'development',
   },
};
