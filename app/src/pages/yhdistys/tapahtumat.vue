<template>
   <div class="events-wide-container pb-16">
      <Head>
         <Title>{{ $t('title_events') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_events') }}</h1>

      <p class="max-w-3xl px-4 mx-auto text-center text-gray-600 dark:text-gray-300">
         {{
            $i18n.locale === 'fi'
               ? 'Tapahtumakalenteriin voit lisätä tulevat tapahtumat omalle sähköiselle kalenterillesi tuomalla osoitteen https://serveriry.fi/api/calendar.ics kalenteriisi.'
               : 'Add coming events to your own electronic calendar by importing https://serveriry.fi/api/calendar.ics url to your calendar.'
         }}
      </p>

      <!-- Coming Events Section -->
      <section class="mt-12">
         <h2 class="custom-page-title text-left font-bold mb-6">{{ $t('h1_events_coming') }}</h2>

         <div class="w-full flex flex-col md:flex-row items-start">
            <!-- Left spacer to align horizontally with past events -->
            <div class="md:w-20 lg:w-24 flex-shrink-0 pr-4 hidden md:block"></div>

            <!-- Upcoming Events Grid -->
            <div class="flex-1 w-full pl-0 md:pl-6 md:border-l-2 md:border-transparent">
               <div v-if="futureEvents.length > 0" class="custom-grid">
                  <EvetsCard
                     v-for="item in futureEvents"
                     :id="item.id"
                     :key="item.id"
                     :url="item.id"
                     :kuva="item.kuva"
                     :img="item.image"
                     :fi_title="item.fi_otsikko"
                     :en_title="item.en_otsikko"
                     :start_time="new Date(item.alku_aika)"
                     :fi_text="item.fi_kuvaus"
                     :en_text="item.en_kuvaus"
                  />
               </div>
               <p v-else class="text-gray-500 italic py-4">
                  {{
                     $i18n.locale === 'fi'
                        ? 'Ei tulevia tapahtumia tällä hetkellä.'
                        : 'No upcoming events at the moment.'
                  }}
               </p>
            </div>
         </div>
      </section>

      <!-- Past Events Section with Left-Side Year Indicator -->
      <section class="mt-16 pb-8">
         <h2 class="custom-page-title text-left font-bold mb-6">{{ $t('h1_events_past') }}</h2>

         <div v-if="yearGroups.length > 0" class="space-y-12">
            <div
               v-for="group in yearGroups"
               :key="group.year"
               class="w-full flex flex-col md:flex-row items-start relative"
            >
               <!-- Mobile Year Indicator (Header with divider line between year and count) -->
               <div class="flex md:hidden items-center gap-3 w-full mb-4 mt-2">
                  <span
                     class="text-2xl sm:text-3xl font-black tracking-tight text-[#5a31af] dark:text-purple-400 leading-none"
                  >
                     {{ group.year }}
                  </span>
                  <div class="flex-1 h-px bg-purple-200 dark:bg-purple-900/60"></div>
                  <span
                     class="text-xs uppercase tracking-wider font-semibold text-gray-500 dark:text-gray-400 whitespace-nowrap"
                  >
                     {{ getYearCount(group.year) }} {{ $i18n.locale === 'fi' ? 'tapahtumaa' : 'events' }}
                  </span>
               </div>

               <!-- Desktop Year Indicator (Sticky sidebar on left, >= md) -->
               <div
                  class="hidden md:block md:w-20 lg:w-24 flex-shrink-0 md:sticky md:top-28 z-10 select-none self-start pr-4 md:text-right"
               >
                  <div class="flex flex-col items-end bg-transparent">
                     <span
                        class="text-3xl lg:text-4xl font-black tracking-tight text-[#5a31af] dark:text-purple-400 leading-none"
                     >
                        {{ group.year }}
                     </span>
                     <span
                        class="text-xs uppercase tracking-wider font-semibold text-gray-500 dark:text-gray-400 mt-1.5"
                     >
                        {{ getYearCount(group.year) }} {{ $i18n.locale === 'fi' ? 'tapahtumaa' : 'events' }}
                     </span>
                  </div>
               </div>

               <!-- Events Grid for this Year -->
               <div class="flex-1 w-full pl-0 md:pl-6 md:border-l-2 md:border-purple-200 md:dark:border-purple-900/60">
                  <div class="custom-grid">
                     <EvetsCard
                        v-for="item in group.events"
                        :id="item.id"
                        :key="item.id"
                        :url="item.id"
                        :kuva="item.kuva"
                        :img="item.image"
                        :fi_title="item.fi_otsikko"
                        :en_title="item.en_otsikko"
                        :start_time="new Date(item.alku_aika)"
                        :fi_text="item.fi_kuvaus"
                        :en_text="item.en_kuvaus"
                     />
                  </div>
               </div>
            </div>
         </div>

         <!-- Loading & Infinite Scroll Sentinel -->
         <div ref="sentinel" class="h-10 w-full flex items-center justify-center my-6">
            <div
               v-if="isLoadingMore"
               class="flex items-center gap-2 text-[#5a31af] dark:text-purple-400 font-medium text-sm"
            >
               <svg class="animate-spin h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                  <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                  <path
                     class="opacity-75"
                     fill="currentColor"
                     d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                  ></path>
               </svg>
               <span>{{ $i18n.locale === 'fi' ? 'Ladataan lisää tapahtumia...' : 'Loading more events...' }}</span>
            </div>
         </div>

         <!-- Manual Load More button fallback -->
         <div v-if="hasMore && !isLoadingMore" class="flex justify-center my-8">
            <button type="button" class="btn-custom-primary" @click="loadMore">
               {{ $i18n.locale === 'fi' ? 'Lataa lisää tapahtumia' : 'Load more events' }}
            </button>
         </div>
      </section>
   </div>
</template>

<script setup lang="ts">
   import { ref, computed, onMounted, onUnmounted } from 'vue';
   import { useState } from '#app';

   interface EventItem {
      id: number | string;
      fi_otsikko?: string;
      en_otsikko?: string;
      alku_aika: string;
      loppu_aika?: string;
      fi_kuvaus?: string;
      en_kuvaus?: string;
      image?: string;
      kuva?: string;
      tyyppi?: string[];
      [key: string]: any;
   }

   const PAGE_SIZE = 28;
   const config = useRuntimeConfig();
   const directusUrl = config.public.DIRECTUS_URL || 'https://api.serveriry.fi/';

   const formatEventImage = (event: EventItem): EventItem => {
      const img = event.kuva
         ? `${directusUrl}assets/${event.kuva}`
         : event.image?.startsWith('http')
           ? event.image
           : `${directusUrl}assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f`;
      return { ...event, image: img };
   };

   const today = new Date();
   today.setHours(0, 0, 0, 0);
   const todayStr = today.toISOString().split('T')[0];

   const futureEvents = useState<EventItem[]>('events_future', () => []);
   const pastEvents = useState<EventItem[]>('events_past', () => []);
   const totalPastCount = useState<number>('events_total_past_count', () => 0);
   const yearTotalCounts = useState<Record<string, number>>('events_year_total_counts', () => ({}));
   const isLoadingMore = ref<boolean>(false);
   const sentinel = ref<HTMLElement | null>(null);
   let observer: IntersectionObserver | null = null;

   // 1. Initial SSR fetch: Future events (if not already in client state)
   if (futureEvents.value.length === 0) {
      try {
         const { data: futureData } = await useFetch<{ data: EventItem[] }>(
            `${config.public['API_URL']}items/tapahtuma?filter[alku_aika][_gte]=${todayStr}&sort=alku_aika&limit=100`,
         );
         if (futureData.value?.data) {
            futureEvents.value = futureData.value.data.map(formatEventImage);
         }
      } catch (e) {
         console.error('Error fetching future events:', e);
      }
   }

   // 2. Fetch total event counts per year upfront (if not already in client state)
   if (Object.keys(yearTotalCounts.value).length === 0) {
      try {
         const { data: allDatesData } = await useFetch<{ data: { alku_aika: string }[] }>(
            `${config.public['API_URL']}items/tapahtuma?fields=alku_aika&filter[alku_aika][_lt]=${todayStr}&limit=-1`,
         );
         if (allDatesData.value?.data) {
            const counts: Record<string, number> = {};
            for (const item of allDatesData.value.data) {
               const y = new Date(item.alku_aika).getFullYear();
               if (!isNaN(y)) {
                  counts[String(y)] = (counts[String(y)] || 0) + 1;
               }
            }
            yearTotalCounts.value = counts;
         }
      } catch (e) {
         console.error('Error fetching year counts:', e);
      }
   }

   // 3. Initial SSR fetch: First batch (28) of Past events + meta count (if not already in client state)
   if (pastEvents.value.length === 0) {
      try {
         const { data: pastData } = await useFetch<{ data: EventItem[]; meta?: { filter_count?: number } }>(
            `${config.public['API_URL']}items/tapahtuma?filter[alku_aika][_lt]=${todayStr}&sort=-alku_aika&limit=${PAGE_SIZE}&offset=0&meta=filter_count`,
         );
         if (pastData.value?.data) {
            pastEvents.value = pastData.value.data.map(formatEventImage);
            totalPastCount.value = pastData.value.meta?.filter_count ?? pastEvents.value.length;
         }
      } catch (e) {
         console.error('Error fetching initial past events:', e);
      }
   }

   const hasMore = computed(() => pastEvents.value.length < totalPastCount.value);

   const getYearCount = (year: string): number => {
      return yearTotalCounts.value[year] ?? yearGroups.value.find((g) => g.year === year)?.events.length ?? 0;
   };

   // Group past events by Year in chronological descending order
   const yearGroups = computed(() => {
      const groups: { year: string; events: EventItem[] }[] = [];
      const map = new Map<string, EventItem[]>();

      for (const event of pastEvents.value) {
         const d = new Date(event.alku_aika);
         const year = !isNaN(d.getTime()) ? String(d.getFullYear()) : 'Muu';
         if (!map.has(year)) {
            const list: EventItem[] = [];
            map.set(year, list);
            groups.push({ year, events: list });
         }
         map.get(year)!.push(event);
      }

      return groups;
   });

   const loadMore = async () => {
      if (isLoadingMore.value || !hasMore.value) return;

      isLoadingMore.value = true;
      try {
         const currentOffset = pastEvents.value.length;
         const response = await $fetch<{ data: EventItem[]; meta?: { filter_count?: number } }>(
            `${config.public['API_URL']}items/tapahtuma?filter[alku_aika][_lt]=${todayStr}&sort=-alku_aika&limit=${PAGE_SIZE}&offset=${currentOffset}&meta=filter_count`,
         );

         if (response?.data && response.data.length > 0) {
            const formatted = response.data.map(formatEventImage);
            pastEvents.value = [...pastEvents.value, ...formatted];
            if (response.meta?.filter_count !== undefined) {
               totalPastCount.value = response.meta.filter_count;
            }
         } else {
            totalPastCount.value = pastEvents.value.length;
         }
      } catch (err) {
         console.error('Failed to load more past events:', err);
      } finally {
         isLoadingMore.value = false;
      }
   };

   onMounted(() => {
      if (typeof window !== 'undefined' && 'IntersectionObserver' in window && sentinel.value) {
         observer = new IntersectionObserver(
            (entries) => {
               if (entries[0]?.isIntersecting && hasMore.value && !isLoadingMore.value) {
                  loadMore();
               }
            },
            { rootMargin: '400px' },
         );
         observer.observe(sentinel.value);
      }
   });

   onUnmounted(() => {
      if (observer) {
         observer.disconnect();
         observer = null;
      }
   });
</script>

<style scoped>
   @reference "tailwindcss";

   .events-wide-container {
      width: 100%;
   }

   @media (width >= 1280px) {
      .events-wide-container {
         width: min(1580px, calc(100vw - 3rem));
         max-width: min(1580px, calc(100vw - 3rem));
         margin-left: calc(50% - min(1580px, calc(100vw - 3rem)) / 2);
      }
   }

   .custom-grid {
      @apply grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6;
   }
</style>
