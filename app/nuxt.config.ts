export default defineNuxtConfig({
   ssr: false,
   srcDir: 'src/',
   css: [
      // '@fortawesome/fontawesome-svg-core/styles.css', // NOT NEEDED THO
      '~/assets/css/main.css',
   ],
   postcss: {
      plugins: {
         tailwindcss: {},
         autoprefixer: {},
      },
   },
   plugins: [{ src: '~/plugins/fontawesome.ts' }],
});
