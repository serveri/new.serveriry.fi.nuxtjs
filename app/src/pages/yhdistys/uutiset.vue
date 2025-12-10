<template>
   <div class="flex flex-col justify-center items-center">
      <Head>
         <Title>{{ $t('title_news') }} - Serveri ry</Title>
      </Head>
      <div class="relative w-screen">
         <h1 class="custom-page-title">{{ $t('h1_news') }}</h1>

         <div class="news p-8 sm:px-0 md:mx-24">
            <div class="custom-gridi">
               <NewsCard
                  v-for="item in news"
                  :id="item.id"
                  :key="item.id"
                  :url="item.id"
                  :img="item.image"
                  :fi_title="item.fi_title"
                  :en_title="item.en_title"
                  :date="new Date(item.date_created)"
                  :fi_text="item.fi_text"
                  :en_text="item.en_text"
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
   let news;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/uutiset`)) as { data: Data };
      news = data.value.data;

      // order by first by date
      news.sort((a, b) => new Date(b.date_created).getTime() - new Date(a.date_created).getTime());
   } catch (error) {
      news = [
         {
            img: '/assets/231aba36-a03b-47c6-811a-b6dfe14ccddb',
            id: '1',
            header: 'Serveri ry:n 35-vuotis vuosijuhlat',
            date: new Date('09/25/2022'),
            text: 'Toivotamme Teidät mitä lämpimimmin tervetulleeksi viettämään Serveri ry:n 35-vuotis vuosijuhlaa pitkän odotuksen jälkeen!',
         },
      ];
   }
</script>

<style scoped>
   @import 'tailwindcss';
   .custom-gridi {
      @apply grid grid-cols-1 gap-4;
   }
   @media (min-width: 600px) {
      .custom-gridi {
         grid-template-columns: repeat(3, minmax(21rem, 1fr));
      }
   }
</style>
