import type { RouterConfig } from '@nuxt/schema';
import type { RouteLocationNormalized } from 'vue-router';

// https://nuxt.com/docs/guide/directory-structure/app#routeroptions
export default <RouterConfig>{
   scrollBehavior(
      to: RouteLocationNormalized,
      _from: RouteLocationNormalized,
      savedPosition?: { left: number; top: number } | null,
   ) {
      if (to.hash) {
         return {
            // Vue Router supports scrolling to an element selector
            el: to.hash,
            top: 30,
            behavior: 'smooth',
         } as any;
      }
      if (savedPosition) return savedPosition as any;
      return { left: 0, top: 0 };
   },
};
