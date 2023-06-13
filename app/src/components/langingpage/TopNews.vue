<template>
   <div class="flex flex-col lg:ml-auto mt-8 sm:mt-0">
      <!-- Tähän apista uutiset 5kpl - Sillä välin placeholderina staattisia paragraafeja -->
      <h2 class="custom-page-title uppercase">{{ $t('coming-events') }}</h2>
      <div
         class="p-4 sm:py-6 sm:px-12 flex flex-col self-center w-full sm:w-2/3 md:w-1/2 lg:w-full border border-gray-200 rounded-lg shadow dark:border-gray-700"
      >
         <div v-for="event in events" :id="event.link" :key="event.link">
            <ComingEvent
               :en_otsikko="event.en_otsikko"
               :fi_otsikko="event.fi_otsikko"
               :alku_aika="event.alku_aika"
               :link="event.id"
            />
         </div>
         <nuxt-link :to="localePath('/yhdistys/tapahtumat')" class="flex flex-col items-center pt-3">
            <button class="btn-custom-primary" type="button">{{ $t('show-all-coming-events') }}</button>
         </nuxt-link>
      </div>
   </div>
</template>
<script setup lang="ts">
   import ComingEvent from '@/components/langingpage/ComingEvent.vue';
   const config = useRuntimeConfig();

   interface DataItem {
      alku_aika: string;
   }

   let events: DataItem[];
   try {
      const response = await useFetch(config.public['API_URL'] + 'items/tapahtuma');
      events = response.data.value.data;

      // filter
      const today = new Date();
      // const pastData = events.filter((item) => new Date(item.alku_aika) < today);
      const futureData = events.filter((item) => new Date(item.alku_aika) >= today);
      // order by first by date
      futureData.sort((a, b) => new Date(a.alku_aika).getTime() - new Date(b.alku_aika).getTime());

      events = futureData.slice(0, 5);
   } catch (error) {
      events = [
         {
            id: 1,
         },
      ];
   }
</script>
