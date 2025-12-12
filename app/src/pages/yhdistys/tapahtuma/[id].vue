<template>
   <Head>
      <Title>{{ events[langKey + '_otsikko'] }} - Serveri ry</Title>
      <Meta name="og:title" :content="events[langKey + '_otsikko'] + ' - Serveri ry'" />
      <Meta
         name="description"
         :content="
            events[langKey + '_kuvaus'].match(new RegExp(`^.{1,150}\\b`))?.[0] ||
            events[langKey + '_kuvaus'].slice(0, 150)
         "
      />
      <Meta
         name="og:description"
         :content="
            events[langKey + '_kuvaus'].match(new RegExp(`^.{1,150}\\b`))?.[0] ||
            events[langKey + '_kuvaus'].slice(0, 150)
         "
      />
      <Meta
         name="og:image"
         :content="
            events.image?.startsWith('http')
               ? events.image
               : config.public['API_URL'] + 'assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f'
         "
      />
   </Head>
   <div>
      <!--  events article with image header and content   -->
      <div class="NewsCard">
         <article class="py-8">
            <h2 class="card-header py-6 text-3xl sm:text-6xl font-bold text-center">
               {{ events[langKey + '_otsikko'] }}
            </h2>

            <img
               class="object-cover w-full aspect-video p-0 m-0"
               :src="
                  events.image ? events.image : config.public['API_URL'] + 'assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f'
               "
               alt="Photo related to the events article."
            />

            <div class="sm:inline-flex items-center py-2 gap-8">
               <p class="events-date font-normal uppercase text-xs">
                  {{ t('news_released') }}
                  <span>
                     {{
                        released_date.toLocaleDateString(locale, {
                           weekday: 'long',
                           year: 'numeric',
                           month: 'long',
                           day: 'numeric',
                           hour: 'numeric',
                           minute: 'numeric',
                        })
                     }}
                  </span>
               </p>
               <div>
                  <span
                     v-if="events.tyyppi?.includes('ilmainen')"
                     class="bg-green-100 text-green-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-sm dark:bg-gray-700 dark:text-green-400 border border-green-400"
                     title="Tapahtuma on ilmainen"
                     >Ilmainen</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('mainos')"
                     class="bg-yellow-100 text-yellow-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-sm dark:bg-gray-700 dark:text-yellow-300 border border-yellow-300"
                     title="Tapahtuma on mainos eikä Serveri ry osallistu sen järjestämiseen."
                     >Mainos</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('alkoholiton')"
                     class="bg-indigo-100 text-indigo-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-sm dark:bg-gray-700 dark:text-indigo-400 border border-indigo-400"
                     title="Alkoholiton tapahtuma."
                     >Alkoholiton</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('poikkitieteellinen')"
                     class="bg-pink-100 text-pink-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-sm dark:bg-gray-700 dark:text-pink-400 border border-pink-400"
                     title="Kivaa yhdessä muiden alojen opiskelijoiden kanssa"
                     >Poikkitieteellinen</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('turvallinen_tila')"
                     class="bg-purple-100 text-purple-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-sm dark:bg-gray-700 dark:text-purple-400 border border-purple-400"
                     title="Tapahtumassa noudatetaan turvallisen tilan periaatteita."
                     >Turvallinen tila</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('excursio')"
                     class="bg-red-100 text-red-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-sm dark:bg-gray-700 dark:text-red-400 border border-red-400"
                     title="Excursio"
                     >Excursio</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('ulkoilma')"
                     class="bg-indigo-100 text-indigo-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-sm dark:bg-gray-700 dark:text-indigo-400 border border-indigo-400"
                     title="Tapahtumapaikka sijaitsee ulkotiloissa."
                     >Ulkoilma</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('collab')"
                     class="bg-green-100 text-green-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-sm dark:bg-gray-700 dark:text-green-400 border border-green-400"
                     title="Serveri ry osallistuu tapahtuman järjestämiseen yhteistyössä jonkun tahon kanssa."
                     >Yhteistyö</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('ulkoinen')"
                     class="bg-red-100 text-red-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-sm dark:bg-gray-700 dark:text-red-400 border border-red-400"
                     title="Tapahtuma on ulkopuolisen tahon järjestämä."
                     >Ulkoinen järjestäjä</span
                  >
               </div>
            </div>

            <vue-markdown class="rich-text py-2" :source="events[langKey + '_kuvaus']" />

            <p v-if="alku_aika" class="events-date font-normal uppercase py-2 text-xs">
               {{ t('event_start') }}
               <span>
                  {{
                     alku_aika.toLocaleDateString(locale, {
                        weekday: 'long',
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        hour: 'numeric',
                        minute: 'numeric',
                     })
                  }}
               </span>
            </p>
            <p v-if="loppu_aika" class="events-date font-normal uppercase py-2 text-xs">
               {{ t('event_end') }}
               <span>
                  {{
                     loppu_aika.toLocaleDateString(locale, {
                        weekday: 'long',
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        hour: 'numeric',
                        minute: 'numeric',
                     })
                  }}
               </span>
            </p>
            <div class="pt-8">
               <div
                  v-if="events.tyyppi?.includes('turvallinen_tila')"
                  class="flex p-4 mb-4 text-sm text-blue-800 border border-blue-300 rounded-lg bg-blue-50 dark:bg-gray-800 dark:text-blue-400 dark:border-blue-800"
               >
                  <info-svg />
                  <span class="sr-only">Info</span>
                  <div>
                     Tapahtumassa noudatetaan
                     <nuxt-link :to="localePath('/yhdistys/turvallinen-tila')" class="text-blue-600 hover:underline"
                        >turvallisemman tilan</nuxt-link
                     >
                     periaatteita. Osallistumalla tapahtumaan sitoudut noudattamaan näitä periaatteita.
                  </div>
               </div>

               <div
                  v-if="events.tyyppi?.includes('mainos')"
                  class="flex p-4 mb-4 text-sm text-blue-800 border border-blue-300 rounded-lg bg-blue-50 dark:bg-gray-800 dark:text-blue-400 dark:border-blue-800"
               >
                  <info-svg />
                  <span class="sr-only">Info</span>
                  <div>
                     Tapahtuma on <i class="cursor-pointer" title="Mainos voi olla maksettu tai ilmainen.">mainos</i>,
                     eikä Serveri ry osallistu sen järjestämiseen. Haluaisitko sinä tai yrityksesi mainostaa tapahtumaa
                     Serverin somessa ja verkkosivuilla?
                     <nuxt-link :to="localePath('/yrityksille/yhteistyo')" class="hover:underline">
                        Ota yhteyttä
                     </nuxt-link>
                  </div>
               </div>

               <div class="sm:inline-flex">
                  <div v-if="events.kideapp_linkki">
                     <a :href="events.kideapp_linkki" target="_blank" tabindex="-1">
                        <button
                           type="button"
                           role="link"
                           class="w-full sm:w-auto text-black dark:text-white bg-transparent hover:bg-gradient-to-r from-[#5a31af] via-purple-500 to-pink-500 outline-solid outline-1 outline-[#5a31af] hover:outline-0 focus:ring-4 rounded-md focus:outline-hidden focus:ring-purple-800 font-bold px-5 py-2.5 text-center inline-flex items-center mr-2 mb-2 justify-center"
                        >
                           <img :src="kideappImg" alt="KideApp logo" loading="lazy" class="h-10 pr-4" tabindex="-1" />

                           Osta liput KideAppista
                        </button>
                     </a>
                  </div>
                  <div v-if="events.sijainti">
                     <a :href="`https://www.google.com/maps/place/${x},${y}`" target="_blank">
                        <button
                           type="button"
                           role="link"
                           title="Reittiohjeet - Google Maps"
                           class="w-full sm:w-auto text-black dark:text-white bg-transparent hover:bg-gradient-to-r from-[#5a31af] via-purple-500 to-pink-500 outline-solid outline-1 outline-[#5a31af] hover:outline-0 focus:ring-4 rounded-md focus:outline-hidden focus:ring-purple-800 font-bold px-5 py-2.5 text-center inline-flex items-center mr-2 mb-2 justify-center"
                        >
                           <img
                              :src="mapsImg"
                              alt="KideApp logo"
                              loading="lazy"
                              class="h-10 pr-4 dark:invert"
                              tabindex="-1"
                           />
                           Reittiohjeet
                        </button>
                     </a>
                  </div>
               </div>
            </div>
         </article>
      </div>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   import { ref, computed } from 'vue';
   const { t, locale } = useI18n();
   const localePath = useLocalePath();
   const config = useRuntimeConfig();
   const kideappImg = 'https://api.serveriry.fi/assets/879a7a96-2e84-45be-b828-5d0fcd605f69';
   const mapsImg = 'https://api.serveriry.fi/assets/0d3c7ebd-048f-4dd3-9811-1f7fa5993016';

   // Pick base language code to match API fields (fi/en)
   const langKey = computed(() => (locale.value || 'fi').split('-')[0]);

   // Reactive state for event and derived values
   const events = ref<any>({
      image: config.public['API_URL'] + 'assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f',
      fi_otsikko: 'Tapahtuman nimeä ei löytynyt',
      en_otsikko: 'The events title cannot be found',
      fi_kuvaus: 'Valitettavasti rest rajapintaan ei saada yhteyttä, ovatkohan serverit liekeissä?',
      en_kuvaus: 'Unfortunately we cannot connect to the rest interface, maybe the servers are on fire?',
      alku_aika: null,
      loppu_aika: null,
      tyyppi: null,
   });
   const route = useRoute();
   const released_date = ref<Date>(new Date());
   const alku_aika = ref<Date | null>(null);
   const loppu_aika = ref<Date | null>(null);
   const x = ref<number | null>(null);
   const y = ref<number | null>(null);

   const { data } = (await useFetch(`${config.public['API_URL']}items/tapahtuma/${route.params.id}`)) as {
      data: Data;
   };
   if (data.value?.data) {
      const e: any = data.value.data;
      events.value = e;
      released_date.value = new Date(e.date_created);
      alku_aika.value = e.alku_aika ? new Date(e.alku_aika) : null;
      loppu_aika.value = e.loppu_aika ? new Date(e.loppu_aika) : null;
      events.value.image = e.kuva
         ? `${config.public['API_URL']}assets/${e.kuva}`
         : config.public['API_URL'] + 'assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f';
      // Handle GeoJSON { type: 'Point', coordinates: [lon, lat] }
      if (e.sijainti?.coordinates && Array.isArray(e.sijainti.coordinates)) {
         x.value = e.sijainti.coordinates[0];
         y.value = e.sijainti.coordinates[1];
      } else if (typeof e.sijainti === 'string') {
         // Fallback: parse "lat, lon" string
         const matches = e.sijainti.match(/-?\d+(\.\d+)?/g);
         if (matches?.length >= 2) {
            y.value = parseFloat(matches[0]);
            x.value = parseFloat(matches[1]);
         }
      }
   }
</script>
