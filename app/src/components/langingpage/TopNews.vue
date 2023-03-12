<template>
   <div class="flex flex-col lg:ml-auto mt-8 sm:mt-0">
      <!-- Tähän apista uutiset 5kpl - Sillä välin placeholderina staattisia paragraafeja -->
      <h2 class="custom-page-title uppercase">{{ $t('coming-events') }}</h2>
      <div
         class="flex flex-col self-center md:w-1/2 lg:w-full border border-gray-200 rounded-lg shadow dark:border-gray-700"
      >
         <div v-for="event in events" :id="event.link" :key="event.link">
            <ComingEvent :title="event.title" :time="event.time" :link="event.link" />
         </div>
         <nuxt-link :to="localePath('/yhdistys/tapahtumat')" class="flex flex-col items-center py-1">
            <button class="btn-custom-blue" type="button">Näytä kaikki tapahtumat</button>
         </nuxt-link>
      </div>
   </div>
</template>
<script setup lang="ts">
   import ComingEvent from '@/components/langingpage/ComingEvent.vue';

   const events = [
      {
         title: 'Serverin lajikokeilu: Padel',
         time: new Date(),
         link: '#eventID',
      },
      {
         title: 'Disney Sitsit 2',
         time: new Date(),
         link: '#eventID',
      },
      {
         title: 'Laitossaunat',
         time: new Date(),
         link: '#eventID',
      },
      {
         title: '24. gradet',
         time: new Date(),
         link: '#eventID',
      },
      {
         title: 'Grillikauden avajaiset',
         time: new Date(),
         link: '#eventID',
      },
   ];
</script>
