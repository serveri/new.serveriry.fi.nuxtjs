<template>
   <NuxtLink :to="localePath('/yhdistys/uutinen/' + content.url)" class="grid-item md:max-w-lg">
      <div
         class="news-card bg-white dark:bg-zinc-900 justify-self-center overflow-hidden rounded-2xl h-full w-full dark:shadow-lg dark:shadow-zinc-600/50"
      >
         <div class="rounded-sm">
            <img
               class="w-full max-h-64 object-cover"
               :src="displayImg"
               :alt="content[$i18n.locale + '_title'] || 'Uutisen kansikuva'"
            />
         </div>

         <div class="px-4">
            <h2 class="card-header pt-3 text-2xl font-extrabold">{{ content[$i18n.locale + '_title'] }}</h2>

            <p class="news-date font-normal uppercase mt-1 py-1 text-xs">
               {{ $t('news_released') }}
               <span>{{
                  content.date.toLocaleDateString($i18n.locale, {
                     weekday: 'long',
                     year: 'numeric',
                     month: 'long',
                     day: 'numeric',
                  })
               }}</span>
            </p>

            <p class="card-content mt-1 mb-3 line-clamp-3">{{ content[$i18n.locale + '_text'].replaceAll('#', '') }}</p>
         </div>
      </div>
   </NuxtLink>
</template>

<script setup lang="ts">
   import { computed } from 'vue';
   import { useLocalePath } from '#i18n';

   const localePath = useLocalePath();
   const config = useRuntimeConfig();
   const directusUrl = (config.public.DIRECTUS_URL || 'https://api.serveriry.fi/').replace(/\/$/, '') + '/';

   const content = defineProps<{
      url: string;
      img?: string;
      kuva?: string | object | null;
      fi_title?: string;
      en_title?: string;
      date: Date;
      fi_text?: string;
      en_text?: string;
   }>();

   const displayImg = computed(() => {
      const kuvaId =
         typeof content.kuva === 'object' && content.kuva !== null ? (content.kuva as any).id : content.kuva;
      if (kuvaId) {
         return `${directusUrl}assets/${kuvaId}`;
      }
      if (content.img) {
         return content.img;
      }
      return `${directusUrl}assets/231aba36-a03b-47c6-811a-b6dfe14ccddb`;
   });
</script>

<style scoped>
   .news-card {
      box-shadow: 0 0 26px -5px rgb(0 0 0 / 27%);
   }

   .grid-item {
      --aspect-ratio: 16/9;
   }
</style>
