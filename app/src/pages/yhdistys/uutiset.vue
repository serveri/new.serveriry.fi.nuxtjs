<template>
   <div class="w-full">
      <Head>
         <Title>{{ $t('title_news') }} - Serveri ry</Title>
      </Head>
      <div class="relative w-full">
         <h1 class="custom-page-title">{{ $t('h1_news') }}</h1>

         <div class="news">
            <div class="custom-gridi">
               <NewsCard
                  v-for="item in news"
                  :id="item.id"
                  :key="item.id"
                  :url="item.id"
                  :kuva="item.kuva"
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

   interface NewsItem {
      id: string | number;
      image?: string;
      kuva?: string | object;
      fi_title?: string;
      en_title?: string;
      date_created: string;
      fi_text?: string;
      en_text?: string;
      [key: string]: any;
   }

   const config = useRuntimeConfig();
   const directusUrl = (config.public.DIRECTUS_URL || 'https://api.serveriry.fi/').replace(/\/$/, '') + '/';

   const formatNewsImage = (item: NewsItem): NewsItem => {
      const kuvaId = typeof item.kuva === 'object' && item.kuva !== null ? (item.kuva as any).id : item.kuva;
      const img = kuvaId
         ? `${directusUrl}assets/${kuvaId}`
         : item.image || `${directusUrl}assets/231aba36-a03b-47c6-811a-b6dfe14ccddb`;
      return { ...item, image: img, kuva: kuvaId };
   };

   let news: NewsItem[] = [];
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/uutiset`)) as { data: Data };
      const rawNews = Array.isArray(data.value?.data) ? (data.value.data as NewsItem[]) : [];
      news = rawNews.map(formatNewsImage);

      // order by date descending
      news.sort((a, b) => new Date(b.date_created).getTime() - new Date(a.date_created).getTime());
   } catch (error) {
      console.error('Error fetching news:', error);
      news = [
         {
            image: '/assets/231aba36-a03b-47c6-811a-b6dfe14ccddb',
            id: '1',
            fi_title: 'Serveri ry:n 35-vuotis vuosijuhlat',
            date_created: new Date('09/25/2022').toISOString(),
            fi_text:
               'Toivotamme Teidät mitä lämpimimmin tervetulleeksi viettämään Serveri ry:n 35-vuotis vuosijuhlaa pitkän odotuksen jälkeen!',
         },
      ];
   }
</script>

<style scoped>
   @reference "tailwindcss";

   .custom-gridi {
      @apply grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6;
   }
</style>
