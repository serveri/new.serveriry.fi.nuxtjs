import { defineNuxtConfig } from 'nuxt';
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
      fallbackLocale: { default: ['fi', 'en'] },
      detectBrowserLanguage: {
         useCookie: true,
         cookieKey: 'i18n_redirected',
         redirectOn: 'root',
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
      langDir: 'lang',
      defaultLocale: 'fi',
   },
   runtimeConfig: {
      // Config within public will be also exposed to the client
      public: {
         API_URL: 'https://api.serveriry.fi/',
      },
   },
};
