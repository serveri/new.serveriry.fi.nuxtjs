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
      vueI18n: './i18n.config.ts',
   },
};
