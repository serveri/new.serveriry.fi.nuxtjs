<template>
   <div class="flex flex-col justify-center items-center">
      <Head>
         <Title>{{ $t('title_events') }} - Serveri ry</Title>
      </Head>
      <div class="relative w-screen">
         <h1 class="custom-page-title">{{ $t('h1_events') }}</h1>

         <p class="max-w-3xl px-8 mx-auto">
            {{
               $i18n.locale === 'fi'
                  ? 'Tapahtumakalenteriin voit lisätä tulevat tapahtumat omalle sähköiselle kalenterillesi tuomalla osoitteen https:///serveriry.fi/api/calendar.ics kalenteriisi.'
                  : 'Add coming events to your own electronic calendar by importing https:///serveriry.fi/api/calendar.ics url to your calendar.'
            }}
         </p>

         <h1 class="custom-page-title text-left font-bold">{{ $t('h1_events_coming') }}</h1>

         <div class="p-0 mx-8 md:mx-24 md:p-8">
            <div class="custom-grid">
               <EvetsCard
                  v-for="item in events.futureData"
                  :id="item.id"
                  :key="item.id"
                  :url="item.id"
                  :img="item.image"
                  :fi_title="item.fi_otsikko"
                  :en_title="item.en_otsikko"
                  :start_time="new Date(item.alku_aika)"
                  :fi_text="item.fi_kuvaus"
                  :en_text="item.en_kuvaus"
               />
            </div>
         </div>

         <h1 class="custom-page-title text-left font-bold">{{ $t('h1_events_past') }}</h1>

         <div class="p-0 mx-8 md:mx-24 md:p-8">
            <div class="custom-grid">
               <EvetsCard
                  v-for="item in events.pastData"
                  :id="item.id"
                  :key="item.id"
                  :url="item.id"
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
</template>

<script setup lang="ts">
   import type { Data } from '@/types';

   const config = useRuntimeConfig();

   // This hard coded data will be replaced with data from directus
   let events;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/tapahtuma`)) as { data: Data };
      events = data.value.data;

      // filter
      const today = new Date();
      events.pastData = events.filter((item) => new Date(item.alku_aika) < today);
      events.futureData = events.filter((item) => new Date(item.alku_aika) >= today);

      // order by first by date
      events.pastData.sort((a, b) => new Date(b.alku_aika).getTime() - new Date(a.alku_aika).getTime());
      events.futureData.sort((a, b) => new Date(a.alku_aika).getTime() - new Date(b.alku_aika).getTime());

      events.forEach((event) => {
         event.image = event.kuva
            ? `${config.public['API_URL']}assets/${event.kuva}`
            : config.public['API_URL'] + 'assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f';
      });
   } catch (error) {
      events = [
         {
            img: config.public['API_URL'] + 'assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f',
            id: '1',
            header: 'Serveri ry:n 35-vuotis vuosijuhlat',
            date: new Date('09/25/2022'),
            text: 'Toivotamme Teidät mitä lämpimimmin tervetulleeksi viettämään Serveri ry:n 35-vuotis vuosijuhlaa pitkän odotuksen jälkeen!',
         },
      ];
   }
</script>

<style scoped>
   .custom-grid {
      @apply grid grid-cols-1 gap-4;
   }
   @media (min-width: 600px) {
      .custom-grid {
         grid-template-columns: repeat(auto-fit, minmax(21rem, 1fr));
      }
   }
</style>
