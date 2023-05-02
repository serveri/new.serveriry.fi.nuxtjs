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
            'custom-secondary': '#00788a',
            'custom-secondary-dark': '#00c8e7',
            'custom-primary': '#009fb8',
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
