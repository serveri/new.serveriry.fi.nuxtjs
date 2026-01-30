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
      public: {
         API_URL: process.env.NUXT_API_URL || 'https://api.serveriry.fi/',
         cookieBannerDev: process.env.NODE_ENV === 'development',
      },
   },

   // Reduce build-time noise by relaxing Vite's chunk size warning threshold
   vite: {
      build: {
         chunkSizeWarningLimit: 2048, // 2 MB
         rollupOptions: {
            output: {
               manualChunks: {
                  'vue-vendor': ['vue', 'vue-router', '@vueuse/core'],
                  fontawesome: [
                     '@fortawesome/vue-fontawesome',
                     '@fortawesome/free-solid-svg-icons',
                     '@fortawesome/free-regular-svg-icons',
                     '@fortawesome/free-brands-svg-icons',
                  ],
               },
            },
         },
      },
   },

   compatibilityDate: '2024-08-19',
};
