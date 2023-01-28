import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { fas } from '@fortawesome/free-solid-svg-icons';
import { fab } from '@fortawesome/free-brands-svg-icons';

library.add(fas, fab);

export default defineNuxtPlugin((nuxtApp) => {
   nuxtApp.vueApp.component('font-awesome-icon', FontAwesomeIcon);
});
