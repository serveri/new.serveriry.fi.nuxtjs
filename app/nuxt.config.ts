export default defineNuxtConfig({
  srcDir: "src/",
  css: [
    "~/assets/css/main.css",
    "@fortawesome/fontawesome-svg-core/styles.css"
  ],
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {}
    }
  }
});
