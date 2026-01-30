<template>
   <section class="relative w-screen h-[90vh] sm:h-auto">
      <div class="absolute w-screen bg-gray-300 dark:bg-gray-600 h-[75vh] mt-[15vh] sm:h-full sm:mt-0">
         <client-only>
            <iframe
               v-if="trackingAllowed"
               width="100%"
               height="100%"
               title="map"
               src="https://www.openstreetmap.org/export/embed.html?bbox=27.61370658874512%2C62.88430491020435%2C27.642030715942386%2C62.89283197511212&amp;layer=mapnik&amp;marker=62.888568752496816%2C27.62786865234375"
               style="filter: grayscale(0.5) contrast(1.2) opacity(0.4)"
               class="pointer-events-none"
               sandbox="allow-scripts"
            ></iframe>
            <div
               v-else
               class="flex h-full min-h-[200px] flex-col items-center justify-center gap-2 bg-gray-400 dark:bg-gray-500 px-4"
            >
               <p class="text-center text-sm">{{ $t('embed_cookies_required') }}</p>
               <a
                  href="https://www.openstreetmap.org/?mlat=62.88857&amp;mlon=27.62787#map=15/62.88857/27.62787"
                  target="_blank"
                  rel="noopener noreferrer"
                  class="text-custom-primary underline"
               >
                  {{ $t('tracking_disabled_embed') }}
               </a>
            </div>
         </client-only>
      </div>
      <div class="w-full content relative py-6 sm:py-24 pointer-events-none">
         <div class="w-full sm:inline-flex sm:justify-end">
            <div
               class="flex flex-col gap-6 py-10 px-8 sm:px-16 bg-white dark:bg-black rounded-lg shadow-sm pointer-events-auto"
            >
               <p class="font-bold text-2xl uppercase">{{ $t('contact-us') }}</p>
               <div>
                  <p>Microkatu 1 E 24</p>
                  <p>PL 1627</p>
                  <p>70211 Kuopio</p>
               </div>
               <div>
                  <p>
                     <span class="pr-2">
                        <client-only><font-awesome-icon icon="fa fa-envelope" /></client-only> </span
                     >hallitus@serveriry.fi
                  </p>
               </div>
            </div>
         </div>
      </div>
   </section>
</template>

<script setup lang="ts">
   import { useTrackingConsent } from '@/composables/useTrackingConsent';

   defineOptions({ name: 'EmbeddedMap' });
   const { trackingAllowed } = useTrackingConsent();
</script>

<style scoped></style>
