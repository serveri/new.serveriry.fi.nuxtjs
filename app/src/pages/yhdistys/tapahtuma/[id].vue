<template>
   <Head>
      <Title>{{ events[$i18n.locale + '_otsikko'] }} - Serveri ry</Title>
      <Meta name="og:title" :content="events[$i18n.locale + '_otsikko'] + ' - Serveri ry'" />
      <Meta
         name="description"
         :content="
            events[$i18n.locale + '_kuvaus'].match(new RegExp(`^.{1,150}\\b`))?.[0] ||
            events[$i18n.locale + '_kuvaus'].slice(0, 150)
         "
      />
      <Meta
         name="og:description"
         :content="
            events[$i18n.locale + '_kuvaus'].match(new RegExp(`^.{1,150}\\b`))?.[0] ||
            events[$i18n.locale + '_kuvaus'].slice(0, 150)
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
               {{ events[$i18n.locale + '_otsikko'] }}
            </h2>

            <img
               class="object-cover w-full aspect-video p-0 m-0"
               :src="events.image ? events.image : '/assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f'"
               alt="Photo related to the events article."
            />

            <div class="sm:inline-flex items-center py-2 gap-8">
               <p class="events-date font-normal uppercase text-xs">
                  {{ $t('news_released') }}
                  <span>
                     {{
                        released_date.toLocaleDateString($i18n.locale, {
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
                     class="bg-green-100 text-green-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-green-400 border border-green-400"
                     title="Tapahtuma on ilmainen"
                     >Ilmainen</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('mainos')"
                     class="bg-yellow-100 text-yellow-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-yellow-300 border border-yellow-300"
                     title="Tapahtuma on mainos eikä Serveri ry osallistu sen järjestämiseen."
                     >Mainos</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('alkoholiton')"
                     class="bg-indigo-100 text-indigo-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-indigo-400 border border-indigo-400"
                     title="Alkoholiton tapahtuma."
                     >Alkoholiton</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('poikkitieteellinen')"
                     class="bg-pink-100 text-pink-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-pink-400 border border-pink-400"
                     title="Kivaa yhdessä muiden alojen opiskelijoiden kanssa"
                     >Poikkitieteellinen</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('turvallinen_tila')"
                     class="bg-purple-100 text-purple-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-purple-400 border border-purple-400"
                     title="Tapahtumassa noudatetaan turvallisen tilan periaatteita."
                     >Turvallinen tila</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('excursio')"
                     class="bg-red-100 text-red-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-red-400 border border-red-400"
                     title="Excursio"
                     >Excursio</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('ulkoilma')"
                     class="bg-indigo-100 text-indigo-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-indigo-400 border border-indigo-400"
                     title="Tapahtumapaikka sijaitsee ulkotiloissa."
                     >Ulkoilma</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('collab')"
                     class="bg-green-100 text-green-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-green-400 border border-green-400"
                     title="Serveri ry osallistuu tapahtuman järjestämiseen yhteistyössä jonkun tahon kanssa."
                     >Yhteistyö</span
                  >
                  <span
                     v-if="events.tyyppi?.includes('ulkoinen')"
                     class="bg-red-100 text-red-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 dark:text-red-400 border border-red-400"
                     title="Tapahtuma on ulkopuolisen tahon järjestämä."
                     >Ulkoinen järjestäjä</span
                  >
               </div>
            </div>

            <vue-markdown class="rich-text py-2" :source="events[$i18n.locale + '_kuvaus']" />

            <p v-if="alku_aika" class="events-date font-normal uppercase py-2 text-xs">
               {{ $t('event_start') }}
               <span>
                  {{
                     alku_aika.toLocaleDateString($i18n.locale, {
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
               {{ $t('event_end') }}
               <span>
                  {{
                     loppu_aika.toLocaleDateString($i18n.locale, {
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
                           class="w-full sm:w-auto text-black dark:text-white bg-transparent hover:bg-gradient-to-r from-[#5a31af] via-purple-500 to-pink-500 outline outline-1 outline-[#5a31af] hover:outline-0 focus:ring-4 rounded-md focus:outline-none focus:ring-purple-800 font-bold px-5 py-2.5 text-center inline-flex items-center mr-2 mb-2 justify-center"
                        >
                           <img
                              src="/images/kideapp.webp"
                              alt="KideApp logo"
                              loading="lazy"
                              class="h-10 pr-4"
                              tabindex="-1"
                           />

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
                           class="w-full sm:w-auto text-black dark:text-white bg-transparent hover:bg-gradient-to-r from-[#5a31af] via-purple-500 to-pink-500 outline outline-1 outline-[#5a31af] hover:outline-0 focus:ring-4 rounded-md focus:outline-none focus:ring-purple-800 font-bold px-5 py-2.5 text-center inline-flex items-center mr-2 mb-2 justify-center"
                        >
                           <img
                              src="/images/maps.png"
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
   import { Data } from '@/app.vue';
   const config = useRuntimeConfig();

   // This hard coded data will be replaced with data from directus
   let events;
   const route = useRoute();
   let released_date = new Date();
   let alku_aika;
   let loppu_aika;
   let x;
   let y;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/tapahtuma/${route.params.id}`)) as {
         data: Data;
      };
      if (data.value.data) {
         events = data.value.data;
         released_date = new Date(events.date_created);
         alku_aika = new Date(events.alku_aika);
         loppu_aika = events.loppu_aika ? new Date(events.loppu_aika) : null;
         events.image = events.kuva
            ? `${config.public['API_URL']}assets/${events.kuva}`
            : '/assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f';
         if (events.sijainti) {
            const matches = events.sijainti.match(/-?\d+(\.\d+)?/g);
            y = parseFloat(matches[0]);
            x = parseFloat(matches[1]);
         }
      } else {
         events = {
            image: '/assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f',
            id: route.params.id,
            fi_otsikko: 'Tapahtuman nimeä ei löytynyt',
            en_otsikko: 'The events title cannot be found',
            fi_kuvaus: 'Valitettavasti rest rajapintaan ei saada yhteyttä, ovatkohan serverit liekeissä?',
            en_kuvaus: 'Unfortunately we cannot connect to the rest interface, maybe the servers are on fire?',
            alku_aika: null,
            loppu_aika: null,
            tyyppi: null,
         };
      }
   } catch (error) {
      events = {
         image: '/assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f',
         id: route.params.id,
         fi_otsikko: 'Tapahtuman nimeä ei löytynyt',
         en_otsikko: 'The events title cannot be found',
         fi_kuvaus: 'Valitettavasti rest rajapintaan ei saada yhteyttä, ovatkohan serverit liekeissä?',
         en_kuvaus: 'Unfortunately we cannot connect to the rest interface, maybe the servers are on fire?',
         alku_aika: null,
         loppu_aika: null,
         tyyppi: null,
      };
   }
</script>

<style scoped></style>
