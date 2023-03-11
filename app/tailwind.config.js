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
            'uef-blue': '#00778a',
            'server-blue': '#06919f',
            'custom-blue': '#009fb8',
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
