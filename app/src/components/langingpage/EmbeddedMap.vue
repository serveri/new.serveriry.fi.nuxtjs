<template>
   <section class="relative w-screen h-screen sm:h-auto">
      <div class="absolute w-screen bg-gray-300 dark:bg-gray-600 h-[85vh] mt-[15vh] sm:h-full sm:mt-0">
         <client-only>
            <iframe
               width="100%"
               height="100%"
               title="map"
               src="https://www.openstreetmap.org/export/embed.html?bbox=27.61370658874512%2C62.88430491020435%2C27.642030715942386%2C62.89283197511212&amp;layer=mapnik&amp;marker=62.888568752496816%2C27.62786865234375"
               style="filter: grayscale(0.5) contrast(1.2) opacity(0.4)"
               class="pointer-events-none"
            ></iframe>
         </client-only>
      </div>
      <div class="w-full content relative py-6 sm:py-24">
         <div class="w-full sm:inline-flex sm:justify-end">
            <div class="flex flex-col gap-6 py-10 px-8 sm:px-16 bg-white dark:bg-black rounded-lg shadow">
               <p class="font-bold text-2xl uppercase">{{ $t('contact-us') }}</p>
               <div>
                  <p>Microkatu 1</p>
                  <p>PL 1627</p>
                  <p>70211 Kuopio</p>
               </div>
               <div>
                  <p>
                     <span class="pr-2">
                        <client-only><font-awesome-icon icon="fa fa-phone" /></client-only> </span
                     >+358 45 1234567
                  </p>
               </div>
               <div>
                  <p>
                     <span class="pr-2">
                        <client-only><font-awesome-icon icon="fa fa-envelope" /></client-only> </span
                     >pj@serveriry.fi
                  </p>
               </div>
            </div>
         </div>
      </div>
   </section>
</template>

<script>
   import colors from 'tailwindcss/colors';
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

   export default {
      name: 'EmbeddedMap',
      components: { FontAwesomeIcon },
      methods: {
         colors() {
            return colors;
         },
      },
   };
</script>

<style scoped></style>
