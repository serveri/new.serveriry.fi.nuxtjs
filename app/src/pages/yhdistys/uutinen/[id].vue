<template>
   <Head>
      <Title>{{ news[locale + '_title'] }} - Serveri ry</Title>
      <Meta name="og:title" :content="news[locale + '_title'] + ' - Serveri ry'" />
      <Meta
         name="description"
         :content="
            news[locale + '_text'].replaceAll('#', '').match(new RegExp(`^.{1,150}\\b`))?.[0] ||
            news[locale + '_text'].slice(0, 150).replaceAll('#', '')
         "
      />
      <Meta
         name="og:description"
         :content="
            news[locale + '_text'].replaceAll('#', '').match(new RegExp(`^.{1,150}\\b`))?.[0] ||
            news[locale + '_text'].slice(0, 150).replaceAll('#', '')
         "
      />
      <Meta
         name="og:image"
         :content="
            news.image?.startsWith('http')
               ? news.image
               : config.public['API_URL'] + 'assets/231aba36-a03b-47c6-811a-b6dfe14ccddb'
         "
      />
   </Head>
   <div>
      <!--  news article with image header and content   -->
      <div class="NewsCard">
         <article class="py-8">
            <h2 class="card-header py-6 text-2xl font-extrabold">{{ news[locale + '_title'] }}</h2>

            <img
               class="object-cover aspect-video w-full p-0 m-0"
               :src="news.image"
               alt="Photo related to the news article."
            />

            <p class="news-date font-normal uppercase py-2 text-xs">
               {{ t('news_released') }}
               <span>
                  {{
                     released_date.toLocaleDateString(locale, {
                        weekday: 'long',
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        hour: 'numeric',
                        minute: 'numeric',
                     })
                  }}
               </span>
            </p>

            <vue-markdown class="rich-text py-2" :source="news[locale + '_text']" />
         </article>
      </div>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   import { useI18n, useLocalePath } from '#i18n';

   const { t, locale } = useI18n();
   const localePath = useLocalePath();
   const config = useRuntimeConfig();

   // This hard coded data will be replaced with data from directus
   let news;
   const route = useRoute();
   let released_date = new Date();
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/uutiset/${route.params.id}`)) as {
         data: Data;
      };
      news = data.value.data;
      released_date = new Date(news.date_created);
   } catch (error) {
      news = {
         image: '/assets/231aba36-a03b-47c6-811a-b6dfe14ccddb',
         id: route.params.id,
         fi_title: 'Uutisen otsikon pitäisi olla tässä',
         en_title: 'The news title should be here',
         fi_text: 'Mutta valitettavasti rest rajapintaan ei saada yhteyttä, onkohan serverit liekeissä?',
         en_text: 'But unfortunately we cannot connect to the rest interface, maybe the servers are on fire?',
         date: new Date(),
      };
   }
</script>

<style scoped></style>
