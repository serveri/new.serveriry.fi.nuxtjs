<template>
   <section class="relative w-screen h-[340px] sm:h-auto sm:min-h-[460px] flex items-center">
      <div class="absolute inset-0 w-full h-full bg-gray-300 dark:bg-gray-600">
         <client-only>
            <iframe
               v-if="trackingAllowed"
               width="100%"
               height="100%"
               title="map"
               src="https://www.openstreetmap.org/export/embed.html?bbox=27.61370658874512%2C62.88430491020435%2C27.642030715942386%2C62.89283197511212&amp;layer=mapnik&amp;marker=62.888568752496816%2C27.62786865234375"
               style="filter: grayscale(0.5) contrast(1.2) opacity(0.4)"
               class="pointer-events-none"
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
      <div class="w-full content relative sm:py-24 pointer-events-none z-10">
         <div class="w-full sm:inline-flex sm:justify-end">
            <div
               class="absolute top-4 left-4 sm:static flex flex-col gap-1.5 sm:gap-6 py-2.5 px-3.5 sm:py-10 sm:px-16 bg-white/95 dark:bg-black/95 backdrop-blur-xs sm:bg-white sm:dark:bg-black rounded-lg shadow-md sm:shadow-sm pointer-events-auto max-w-[175px] sm:max-w-none text-left border border-gray-200/80 dark:border-gray-800 sm:border-0"
            >
               <p class="font-bold text-xs sm:text-2xl uppercase tracking-wide">{{ $t('contact-us') }}</p>
               <div class="text-[11px] sm:text-base leading-snug">
                  <p>Microkatu 1 E 24</p>
                  <p>PL 1627</p>
                  <p>70211 Kuopio</p>
               </div>
               <div class="text-[11px] sm:text-base break-all sm:break-normal">
                  <ObfuscatedEmail user="hallitus" />
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
