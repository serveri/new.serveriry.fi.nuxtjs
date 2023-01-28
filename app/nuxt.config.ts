export default defineNuxtConfig({
   ssr: false,
   srcDir: 'src/',
   css: ['~/assets/css/main.css', '@fortawesome/fontawesome-svg-core/styles.css'],
   postcss: {
      plugins: {
         tailwindcss: {},
         autoprefixer: {},
      },
   },
   plugins: [{ src: '~/plugins/fontawesome.ts' }],
});
