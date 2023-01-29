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
      vueI18n: {
         fallbackLocale: ['fi', 'en'],
      },
      locales: [
         {
            code: 'fi',
            file: 'fi.json',
         },
         {
            code: 'en',
            file: 'en.json',
         },
      ],
      lazy: true,
      langDir: 'lang/',
      defaultLocale: 'fi',
   },
});
