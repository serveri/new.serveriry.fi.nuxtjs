<template>
   <div class="w-full bg-white dark:bg-zinc-900 shadow-lg rounded-xl overflow-hidden md:flex border border-gray-100">
      <div class="w-full md:w-1/2 lg:w-5/12 flex-shrink-0 relative">
         <img class="w-full h-64 md:h-full object-cover" :src="displayImg" :alt="title || 'Uutisen kansikuva'" />
      </div>

      <div class="p-6 md:p-8 md:w-1/2 lg:w-7/12 flex flex-col justify-center text-left">
         <h2 class="card-header text-2xl font-extrabold text-gray-900">{{ title }}</h2>

         <p class="news-date font-medium uppercase mt-2 text-sm text-primary-600">
            {{ $t('news_released') }}
            <span>{{
               releaseDate.toLocaleDateString(locale, {
                  weekday: 'long',
                  year: 'numeric',
                  month: 'long',
                  day: 'numeric',
               })
            }}</span>
         </p>

         <p class="mt-4 mb-6 line-clamp-4 text-gray-600 leading-relaxed">{{ text }}</p>

         <div>
            <NuxtLink :to="localePath('/yhdistys/uutinen/' + content.url)" class="inline-block">
               <button class="btn-custom-primary" type="button">
                  {{ locale === 'en' ? 'Read more' : 'Lue lisää' }}
               </button>
            </NuxtLink>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
   import { useI18n } from 'vue-i18n';
   import { computed } from 'vue';
   import { useDirectusAsset } from '@/composables/useDirectusAsset';

   const { locale } = useI18n();
   const localePath = useLocalePath();

   // Strongly-typed props to avoid dynamic string indexing errors
   const content = defineProps<{
      url: string;
      img?: string;
      kuva?: string | object | null;
      fi_title: string;
      en_title: string;
      date: string;
      fi_text: string;
      en_text: string;
   }>();

   const releaseDate = new Date(content.date);

   const { getAssetUrl } = useDirectusAsset();

   const displayImg = computed(() => {
      const kuvaId =
         typeof content.kuva === 'object' && content.kuva !== null ? (content.kuva as any).id : content.kuva;
      if (kuvaId) {
         return getAssetUrl(kuvaId, { width: 960, height: 540, quality: 80, fit: 'cover' });
      }
      if (content.img) {
         return getAssetUrl(content.img, { width: 960, height: 540, quality: 80, fit: 'cover' });
      }
      return getAssetUrl('231aba36-a03b-47c6-811a-b6dfe14ccddb', {
         width: 960,
         height: 540,
         quality: 80,
         fit: 'cover',
      });
   });

   // Select localized title/text explicitly using locale.value
   const title = computed(() => (locale.value === 'fi' ? content.fi_title : content.en_title));
   const text = computed(() => (locale.value === 'fi' ? content.fi_text : content.en_text).replaceAll('#', ''));
</script>

<style scoped></style>
