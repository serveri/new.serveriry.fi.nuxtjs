<template>
   <div class="partners pt-8 px-4 sm:px-0">
      <partner-card
         v-for="sponsor in sponsors"
         :key="sponsor.name"
         :url="sponsor.url"
         :img="sponsor.img"
         :img_dark="sponsor.img_dark"
         :alt="'Serverin toimintaa tukee ' + sponsor.name + ' ja tässä heidän logo'"
         :name="sponsor.name"
         :fi_text="sponsor.fi_text"
         :en_text="sponsor.en_text"
      />
   </div>
</template>

<script setup lang="ts">
   import PartnerCard from '@/components/partners/PartnerCard.vue';
   import { Data } from '@/types';
   const config = useRuntimeConfig();

   let sponsors;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/partners`)) as { data: Data };
      sponsors = data.value.data;
   } catch (e) {
      sponsors = [
         {
            name: 'Yrityksen logo puuttuu',
            url: 'https://serveriry.fi',
            img: 'https://cloud.serveriry.fi/s/rRJL8CTTSg9KDYK/download/Tapahtumat-placeholder.png',
         },
      ];
   }
</script>

<style>
   .partners {
      padding-bottom: 3rem;
      display: grid;
      gap: 2rem;
      grid-auto-rows: 8rem;
      grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));
   }
</style>
