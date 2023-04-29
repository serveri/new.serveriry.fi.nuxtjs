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
            'uef-blue': '#700742',
            'custom-blue': '#982365',
         },
         backgroundImage: {
            'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
         },
      },
   },
   plugins: [require('@tailwindcss/line-clamp')],
   variants: {
      extend: {
         backgroundColor: ['even', 'odd'],
      },
   },
};
