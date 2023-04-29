<template>
   <div class="flex flex-col lg:ml-auto mt-8 sm:mt-0">
      <!-- Tähän apista uutiset 5kpl - Sillä välin placeholderina staattisia paragraafeja -->
      <h2 class="custom-page-title uppercase">{{ $t('coming-events') }}</h2>
      <div
         class="p-4 sm:py-6 sm:px-12 flex flex-col self-center w-full sm:w-2/3 md:w-1/2 lg:w-full border border-gray-200 rounded-lg shadow dark:border-gray-700"
      >
         <div v-for="event in events" :id="event.link" :key="event.link">
            <ComingEvent :title="event.title" :time="event.time" :link="event.link" />
         </div>
         <nuxt-link :to="localePath('/yhdistys/tapahtumat')" class="flex flex-col items-center pt-3">
            <button class="btn-custom-blue" type="button">Näytä kaikki tapahtumat</button>
         </nuxt-link>
      </div>
   </div>
</template>
<script setup lang="ts">
   import ComingEvent from '@/components/langingpage/ComingEvent.vue';

   const events = [
      {
         title: '24. gradet',
         time: new Date('03/28/2023'),
         link: '#eventID',
      },
      {
         title: 'Laitossaunat',
         time: new Date('03/30/2023'),
         link: '#eventID',
      },
      {
         title: 'Haluatko IT-Miljonääriksi',
         time: new Date('04/04/2023'),
         link: '#eventID',
      },
      {
         title: 'Skripti x Serveri Joensuussa',
         time: new Date('04/14/2023'),
         link: '#eventID',
      },
      {
         title: 'VappuViinat "Virosta" 2023',
         time: new Date('04/16/2023'),
         link: '#eventID',
      },
   ];
</script>
