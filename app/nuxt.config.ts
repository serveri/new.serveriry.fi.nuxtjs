export default {
   ssr: true,
   srcDir: 'src/',
   css: ['~/assets/css/main.css'],

   postcss: {
      plugins: {
         '@tailwindcss/postcss': {},
         autoprefixer: {},
      },
   },

   plugins: [{ src: '~/plugins/fontawesome.ts' }],
   modules: ['@nuxtjs/i18n'],

   i18n: {
      detectBrowserLanguage: {
         useCookie: true,
         cookieKey: 'i18n_redirected',
         redirectOn: 'root',
      },
      bundle: {
         optimizeTranslationDirective: false,
      },
      defaultLocale: 'fi',
      locales: [
         { code: 'fi', name: 'Finnish', file: 'fi.json' },
         { code: 'en', name: 'English', file: 'en.json' },
      ],
      lazy: true,
      langDir: 'lang',
      // strategy: 'no_prefix', // uncomment if you don’t want locale prefixes in routes
   },

   runtimeConfig: {
      // Config within public will be also exposed to the client
      public: {
         API_URL: process.env.NUXT_API_URL || 'https://api.serveriry.fi/',
      },
   },

   compatibilityDate: '2024-08-19',
};
