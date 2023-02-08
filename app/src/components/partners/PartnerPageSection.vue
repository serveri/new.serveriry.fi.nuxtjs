<template>
   <div class="partners pt-8">
      <partner-card
         v-for="sponsor in sponsors"
         :key="sponsor.name"
         :url="sponsor.url"
         :img="sponsor.img"
         :alt="'Serverin toimintaa tukee ' + sponsor.name + ' ja tässä heidän logo'"
      />
   </div>
</template>

<script setup lang="ts">
   import PartnerCard from '@/components/partners/PartnerCard.vue';

   const sponsors = [
      {
         name: 'Efecte',
         url: 'https://www.efecte.com/',
         img: 'https://api.serveriry.fi/uploads/efecte_logo_eaa50a1bf4.png',
      },
      {
         name: 'Innofactor',
         url: 'https://www.innofactor.com/',
         img: 'https://api.serveriry.fi/uploads/innofactor_365559a4a1.png',
      },
      {
         name: 'TEK',
         url: 'https://www.tek.fi/',
         img: 'https://api.serveriry.fi/uploads/TEK_logo_slogan_CMYK_musta_3431_d41fe002b6.png',
      },
      {
         name: 'Hurja',
         url: 'https://www.hurja.fi/',
         img: 'https://api.serveriry.fi/uploads/g9_1f987a430f.png',
      },
   ];
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
