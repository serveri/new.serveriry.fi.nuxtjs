<template>
   <div class="partners pt-8 px-4 sm:px-0">
      <!-- Main Sponsors Grid -->
      <div class="main-sponsors">
         <partner-card
            v-for="sponsor in mainSponsors"
            :key="sponsor.name"
            :url="sponsor.url"
            :img="sponsor.img"
            :img_dark="sponsor.img_dark"
            :alt="'Serverin toimintaa tukee ' + sponsor.name + ' ja tässä heidän logo'"
            :name="sponsor.name"
            :main_sponsor="sponsor.main_sponsor"
            :fi_text="sponsor.content_fi"
            :en_text="sponsor.content_en"
            class="partner-card main-partner-card"
         />
      </div>

      <!-- Regular Sponsors Grid -->
      <div class="regular-sponsors">
         <partner-card
            v-for="sponsor in regularSponsors"
            :key="sponsor.name"
            :url="sponsor.url"
            :img="sponsor.img"
            :img_dark="sponsor.img_dark"
            :alt="'Serverin toimintaa tukee ' + sponsor.name + ' ja tässä heidän logo'"
            :name="sponsor.name"
            :main_sponsor="sponsor.main_sponsor"
            :fi_text="sponsor.content_fi"
            :en_text="sponsor.content_en"
            class="partner-card"
         />
      </div>
   </div>
</template>

<script setup lang="ts">
   import PartnerCard from '@/components/partners/PartnerCard.vue';
   // Define a local Partner type to correctly type fetched data
   interface Partner {
      name: string;
      url: string;
      img: string;
      img_dark?: string; // optional string, no null
      main_sponsor: boolean;
      content_fi?: string | null;
      content_en?: string | null;
   }

   const config = useRuntimeConfig();

   // Strongly type the sponsors list
   let sponsors: Partner[]; // remove redundant initializer
   try {
      const { data } = await useFetch<{ data: Partner[] }>(
         `${config.public['API_URL']}items/partners`
      );
      const payload = data.value?.data as unknown;
      sponsors = Array.isArray(payload) ? (payload as Partner[]) : [];
   } catch (e) {
      sponsors = [
         {
            name: 'Yrityksen logo puuttuu',
            url: 'https://serveriry.fi',
            img: 'https://api.serveriry.fi/assets/9db2e4a2-e9d7-4dab-8156-8cc0f482775d',
            // set undefined instead of null to match type
            img_dark: undefined,
            main_sponsor: false,
         },
      ];
   }

   // Separate main sponsors and regular sponsors with typed callbacks
   const mainSponsors: Partner[] = sponsors.filter((sponsor: Partner) => sponsor.main_sponsor);
   const regularSponsors: Partner[] = sponsors.filter((sponsor: Partner) => !sponsor.main_sponsor);
</script>

<style scoped>
   /* remove non-standard @reference at-rule */
   .partners {
      padding-bottom: 3rem;
   }

   .main-sponsors {
      display: grid;
      gap: 2rem;
      grid-auto-rows: 10rem; /* Larger size for main sponsors */
      grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr)); /* Larger column size */
      margin-bottom: 3rem; /* Space between main and regular sponsors */
   }

   .regular-sponsors {
      display: grid;
      gap: 2rem;
      grid-auto-rows: 8rem;
      grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));
   }

   .partner-card {
      display: flex;
      align-items: center;
      justify-content: center;
   }

   .main-partner-card {
      transform: scale(1.2); /* Make main sponsor logos larger */
   }
</style>
