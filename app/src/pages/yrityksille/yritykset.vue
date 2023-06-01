<template>
   <div>
      <Head>
         <Title>{{ $t('title_companies') }} - Serveri ry</Title>
      </Head>

      <h1 class="custom-page-title">{{ $t('h1_companies') }}</h1>
      <p class="text-center paragraph pb-6">
         <!--         if language fin "" else ""-->
         {{
            $i18n.locale === 'fi'
               ? 'Tervetuloa sivustollemme, jossa on listattu kaikki Suomen IT-yritykset. Tämän sivun tarkoituksena on auttaaopiskelijoita löytämään työpaikkoja alan yrityksistä. Selaa listaa ja löydä unelmiesi työpaikka IT-alalta!'
               : 'Welcome to our website, which lists all Finnish IT companies. The help of this page helps students get jobs from companies in the field. Browse the list for a suitable job and dream position in the IT sector!'
         }}
      </p>
      <div class="pb-8">
         <div>
            <h2 class="text-center">Yhteistyökumppanit</h2>
            <partner-page-section />
         </div>
         <div>
            <div class="py-4">
               <h2 class="text-center">Kuopiossa:</h2>
               <ul class="grid grid-cols-4 text-center pt-8">
                  <li v-for="company in kuopio" :key="company">{{ company }}</li>
               </ul>
            </div>
            <div class="py-4">
               <h2 class="text-center">Koko Suomi:</h2>
               <ul class="grid grid-cols-4 text-center pt-8">
                  <li v-for="company in finland" :key="company">{{ company }}</li>
               </ul>
            </div>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
   import PartnerPageSection from '@/components/partners/PartnerPageSection.vue';

   let data;
   let kuopio: string[];
   let finland: string[];
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/it_comppanies');
      data = response.data.value.data;
      // format data to array and remove dashes
      kuopio = data.kuopio.split('\n').map((item: string) => item.replace('- ', ''));
      finland = data.finland.split('\n').map((item: string) => item.replace('- ', ''));
   } catch (e) {
      data = {
         kuopio: 'loading companies failed',
         finland: 'loading companies failed',
      };
   }
</script>

<style scoped>
   h2 {
      font-size: x-large;
      padding: 1rem 0;
   }

   li {
      flex: 1 0 20%;
      margin: 5px 30px;
      @apply dark:text-white;
   }
</style>
