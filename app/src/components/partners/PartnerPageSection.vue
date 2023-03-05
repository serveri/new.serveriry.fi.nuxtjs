<template>
   <div class="partners pt-8 px-4 sm:px-0">
      <partner-card
         v-for="sponsor in sponsors"
         :key="sponsor.name"
         :url="sponsor.url"
         :img="sponsor.img"
         :alt="'Serverin toimintaa tukee ' + sponsor.name + ' ja tässä heidän logo'"
         :name="sponsor.name"
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
         name: 'Olvi',
         url: 'https://www.olvi.fi/',
         img: 'https://upload.wikimedia.org/wikipedia/fi/thumb/f/f9/Olvin_logo.svg/1200px-Olvin_logo.svg.png',
      },
      {
         name: 'Hurja',
         url: 'https://www.hurja.fi/',
         img: 'https://api.serveriry.fi/uploads/g9_1f987a430f.png',
      },
      {
         name: 'Etteplan',
         url: 'https://www.etteplan.com/',
         img: 'https://cdn.discordapp.com/attachments/492188265487532032/1082006440102871131/logo.svg',
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
