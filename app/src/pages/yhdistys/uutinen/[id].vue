<template>
   <Head>
      <Title>{{ news[langKey + '_title'] || news.fi_title }} - Serveri ry</Title>
      <Meta name="og:title" :content="(news[langKey + '_title'] || news.fi_title) + ' - Serveri ry'" />
      <Meta
         name="description"
         :content="
            (news[langKey + '_text'] || news.fi_text || '')
               .replaceAll('#', '')
               .match(new RegExp(`^.{1,150}\\b`))?.[0] ||
            (news[langKey + '_text'] || news.fi_text || '').slice(0, 150).replaceAll('#', '')
         "
      />
      <Meta
         name="og:description"
         :content="
            (news[langKey + '_text'] || news.fi_text || '')
               .replaceAll('#', '')
               .match(new RegExp(`^.{1,150}\\b`))?.[0] ||
            (news[langKey + '_text'] || news.fi_text || '').slice(0, 150).replaceAll('#', '')
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
            <h2 class="card-header py-6 text-2xl font-extrabold">{{ news[langKey + '_title'] || news.fi_title }}</h2>

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

            <vue-markdown class="rich-text py-2" :source="news[langKey + '_text'] || news.fi_text || ''" />
         </article>
      </div>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   import { ref, computed } from 'vue';
   import { useI18n } from '#i18n';

   const { t, locale } = useI18n();
   const config = useRuntimeConfig();
   const route = useRoute();

   const langKey = computed(() => (locale.value || 'fi').split('-')[0]);

   const news = ref<any>({
      image: '/assets/231aba36-a03b-47c6-811a-b6dfe14ccddb',
      id: route.params.id,
      fi_title: 'Uutisen otsikon pitäisi olla tässä',
      en_title: 'The news title should be here',
      fi_text: 'Mutta valitettavasti rest rajapintaan ei saada yhteyttä, onkohan serverit liekeissä?',
      en_text: 'But unfortunately we cannot connect to the rest interface, maybe the servers are on fire?',
      date_created: new Date().toISOString(),
   });
   const released_date = ref<Date>(new Date());

   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/uutiset/${route.params.id}`)) as {
         data: Data;
      };
      if (data.value?.data) {
         const article: any = data.value.data;
         news.value = article;
         if (article.date_created) {
            released_date.value = new Date(article.date_created);
         }
      }
   } catch (error) {
      console.error('Error fetching news article:', error);
   }
</script>

<style scoped></style>
