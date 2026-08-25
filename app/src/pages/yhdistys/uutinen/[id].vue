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
      <Meta name="og:image" :content="displayImg" />
   </Head>
   <div>
      <!--  news article with image header and content   -->
      <div class="NewsCard">
         <article class="py-8">
            <h2 class="card-header py-6 text-2xl font-extrabold">{{ news[langKey + '_title'] || news.fi_title }}</h2>

            <img
               :class="[
                  'w-full p-0 m-0',
                  isFullsize ? 'h-auto max-h-[85vh] object-contain' : 'aspect-video object-cover',
               ]"
               :src="displayImg"
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

            <MarkdownView class="rich-text py-2" :source="news[langKey + '_text'] || news.fi_text" />
         </article>
      </div>
   </div>
</template>

<script setup lang="ts">
   import type { Data } from '@/types';
   import { ref, computed } from 'vue';
   import { useI18n } from '#i18n';
   import { useDirectusAsset } from '@/composables/useDirectusAsset';

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

   const { getAssetUrl } = useDirectusAsset();

   const isFullsize = computed(() =>
      Boolean(news.value?.taysikokoinen_kuva || news.value?.fullsize_image || news.value?.taysikokoinen),
   );

   const displayImg = computed(() => {
      const kuvaId =
         typeof news.value?.kuva === 'object' && news.value?.kuva !== null
            ? (news.value.kuva as any).id
            : news.value?.kuva;

      const transformOpts = isFullsize.value
         ? { width: 1600, quality: 85, fit: 'inside' as const }
         : { width: 1280, height: 720, quality: 85, fit: 'cover' as const };

      if (kuvaId) {
         return getAssetUrl(kuvaId, transformOpts);
      }
      if (news.value?.image) {
         return getAssetUrl(news.value.image, transformOpts);
      }
      return getAssetUrl('231aba36-a03b-47c6-811a-b6dfe14ccddb', transformOpts);
   });

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
