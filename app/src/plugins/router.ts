import { defineNuxtPlugin } from 'nuxt/app';
import { RouteLocationNormalized } from 'vue-router';

export default defineNuxtPlugin(({ $router }) => {
   $router.options.scrollBehavior = (
      to: RouteLocationNormalized,
      from: RouteLocationNormalized,
      savedPosition: void | { x: number; y: number } | { selector: string }
   ) => {
      if (to.hash) {
         return {
            el: to.hash,
            top: 30,
            behavior: 'smooth',
         };
      } else if (savedPosition) {
         return savedPosition;
      } else {
         return { top: 0 };
      }
   };
});
