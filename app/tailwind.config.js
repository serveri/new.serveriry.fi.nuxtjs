/** @type {import('tailwindcss').Config} */
module.exports = {
   darkMode: 'class',
   content: [
      './src/components/**/*.{js,vue,ts}',
      './src/layouts/**/*.vue',
      './src/pages/**/*.vue',
      './src/plugins/**/*.{js,ts}',
      './src/nuxt.config.{js,ts}',
      './src/app.vue',
   ],
   theme: {
      extend: {
         colors: {
            'server-blue': '#06919f',
            'uef-blue': '#00778a',
         },
         backgroundImage: {
            'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
         },
      },
   },
   plugins: [],
   variants: {
      extend: {
         backgroundColor: ['even', 'odd'],
      },
   },
};
