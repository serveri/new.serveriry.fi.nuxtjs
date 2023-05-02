<template>
   <div>
      <!--  events article with image header and content   -->
      <div class="NewsCard">
         <article class="py-8">
            <h2 class="card-header py-6 text-2xl font-extrabold">{{ events[$i18n.locale + '_otsikko'] }}</h2>

            <img class="object-cover md:h-[35rem] w-full p-0 m-0" :src="events.image" alt="Photo related to the events article." />

            <p class="events-date font-normal uppercase py-2 text-xs">
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

            <vue-markdown class="rich-text py-2" :source="events[$i18n.locale + '_kuvaus']" />

            <p class="events-date font-normal uppercase py-2 text-xs">
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
            <p class="events-date font-normal uppercase py-2 text-xs">
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
         </article>
      </div>
   </div>
</template>

<script>
   export default {
      name: '[id].vue',
   };
</script>

<script setup>
   import VueMarkdown from 'vue-markdown-render';
   // This hard coded data will be replaced with data from directus
   let events;
   const route = useRoute();
   let released_date = new Date();
   let alku_aika = new Date();
   let loppu_aika = new Date();
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/tapahtuma/' + route.params.id);
      if (response?.data?.value?.data) {
         events = response.data.value.data;
         released_date = new Date(events.date_created);
         alku_aika = new Date(events.alku_aika);
         loppu_aika = new Date(events.loppu_aika);
      } else {
         events = {
            image: 'https://api.serveriry.fi/uploads/large_computerstuffwithlogo_da6b992e47.jpg',
            id: route.params.id,
            fi_otsikko: 'Tapahtuman nimeä ei löytynyt',
            en_otsikko: 'The events title cannot be found',
            fi_kuvaus: 'Valitettavasti rest rajapintaan ei saada yhteyttä, ovatkohan serverit liekeissä?',
            en_kuvaus: 'Unfortunately we cannot connect to the rest interface, maybe the servers are on fire?',
            alku_aika: new Date(),
            loppu_aika: new Date(),
         };
      }
   } catch (error) {
      events = {
         image: 'https://api.serveriry.fi/uploads/large_computerstuffwithlogo_da6b992e47.jpg',
         id: route.params.id,
         fi_otsikko: 'Tapahtuman nimeä ei löytynyt',
         en_otsikko: 'The events title cannot be found',
         fi_kuvaus: 'Valitettavasti rest rajapintaan ei saada yhteyttä, ovatkohan serverit liekeissä?',
         en_kuvaus: 'Unfortunately we cannot connect to the rest interface, maybe the servers are on fire?',
         alku_aika: new Date(),
         loppu_aika: new Date(),
      };
   }
</script>

<style scoped></style>
