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
   import sponsors from '@/pages/yrityksille/sponsors.json';
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
