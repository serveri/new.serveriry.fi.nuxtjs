<template>
   <NuxtLink :to="localePath('/yhdistys/tapahtuma/' + content.url)" class="grid-item w-full">
      <div
         class="event-card bg-white dark:bg-zinc-900 justify-self-center overflow-hidden rounded-2xl h-full w-full dark:shadow-lg dark:shadow-zinc-600/50"
      >
         <div class="rounded-sm">
            <img class="w-full aspect-video object-cover" :src="displayImg" :alt="title || 'Tapahtuman kansikuva'" />
         </div>

         <div class="px-4">
            <h2 class="card-header pt-3 text-2xl font-extrabold">{{ title }}</h2>

            <p class="news-date font-normal uppercase mt-1 text-xs">
               {{
                  content.start_time.toLocaleDateString(locale, {
                     weekday: 'long',
                     month: 'long',
                     day: 'numeric',
                     hour: '2-digit',
                     minute: '2-digit',
                  })
               }}
            </p>

            <p class="card-content mt-1 mb-3 line-clamp-3">{{ previewText }}</p>
         </div>
      </div>
   </NuxtLink>
</template>

<script setup lang="ts">
   import { computed } from 'vue';
   import { useI18n } from 'vue-i18n';
   import { useDirectusAsset } from '@/composables/useDirectusAsset';

   const { locale } = useI18n();
   const localePath = useLocalePath();

   const content = defineProps<{
      url: number | string;
      img?: string;
      kuva?: string | object | null;
      fi_title?: string;
      en_title?: string;
      start_time: Date;
      fi_text?: string;
      en_text?: string;
   }>();

   const stripMarkdown = (md: string) => {
      if (!md) return '';
      return md
         .replace(/!\[.*?\]\(.*?\)/g, '')
         .replace(/\[(.*?)\]\(.*?\)/g, '$1')
         .replace(/#{1,6}\s*/g, '')
         .replace(/(\*\*|__)(.*?)\1/g, '$2')
         .replace(/(\*|_)(.*?)\1/g, '$2')
         .replace(/`{1,3}(.*?)[`\n]/g, '$1')
         .replace(/>\s+/g, '')
         .replace(/[-*+]\s+/g, '')
         .replace(/\n+/g, ' ')
         .trim();
   };

   const { getAssetUrl } = useDirectusAsset();

   const title = computed(() => (locale.value === 'en' ? content.en_title : content.fi_title) || '');
   const previewText = computed(() => {
      const raw = (locale.value === 'en' ? content.en_text : content.fi_text) || '';
      return stripMarkdown(raw);
   });

   const displayImg = computed(() => {
      const kuvaId =
         typeof content.kuva === 'object' && content.kuva !== null ? (content.kuva as any).id : content.kuva;
      if (kuvaId) {
         return getAssetUrl(kuvaId, { width: 960, height: 540, quality: 80, fit: 'cover' });
      }
      if (content.img) {
         return getAssetUrl(content.img, { width: 960, height: 540, quality: 80, fit: 'cover' });
      }
      return getAssetUrl('b3ed6d7f-c124-4136-9234-cbd91fccff0f', {
         width: 960,
         height: 540,
         quality: 80,
         fit: 'cover',
      });
   });
</script>

<style scoped>
   .event-card {
      box-shadow: 0 0 26px -5px rgb(0 0 0 / 27%);
   }

   .grid-item {
      --aspect-ratio: 16/9;
   }
</style>
