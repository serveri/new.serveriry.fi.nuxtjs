export default defineNuxtConfig({
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
   modules: ['@nuxtjs/i18n'],
   i18n: {
      locales: ['en', 'fi'],
      defaultLocale: 'fi',
      vueI18n: {
         fallbackLocale: 'fi',
         messages: {
            fi: {
               welcome: 'Tervetuloa',
            },
            en: {
               welcome: 'Welcome',
            },
         },
      },
   },
});
