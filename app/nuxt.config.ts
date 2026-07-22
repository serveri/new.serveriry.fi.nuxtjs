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
               manualChunks(id) {
                  if (id.includes('node_modules/vue/') || id.includes('node_modules/vue-router/') || id.includes('node_modules/@vueuse/core/')) {
                     return 'vue-vendor';
                  }
                  if (id.includes('node_modules/@fortawesome/vue-fontawesome/') || id.includes('node_modules/@fortawesome/free-solid-svg-icons/') || id.includes('node_modules/@fortawesome/free-regular-svg-icons/') || id.includes('node_modules/@fortawesome/free-brands-svg-icons/')) {
                     return 'fontawesome';
                  }
               },
            },
         },
      },
   },

   compatibilityDate: '2024-08-19',
};
