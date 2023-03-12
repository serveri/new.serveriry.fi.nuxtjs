<template>
   <a :href="'/news/' + content.url">
      <div class="NewsCard">
         <div class="rounded-sm">
            <img class="news-image object-contain w-full" :src="content.img" alt="Cover image for the news card" />
         </div>

         <div class="px-4">
            <h2 class="card-header pt-3 text-2xl font-extrabold">{{ content.header }}</h2>

            <p class="news-date font-normal uppercase mt-1 text-xs">
               {{ $t('news_released') }} <span>{{ content.date.toLocaleDateString($i18n.locale, options) }}</span>
            </p>

            <p class="card-content mt-1 mb-3">{{ content.text }}</p>
         </div>
      </div>
   </a>
</template>

<script setup lang="ts">
   const content = defineProps({
      url: {
         type: Number,
         default: 1,
         required: true,
      },
      img: {
         type: String,
         default: '/_nuxt/assets/images/placeholder.jpg',
         required: true,
      },
      header: {
         type: String,
         default: 'News Header Missing',
         required: false,
      },
      date: {
         type: Date,
         default: new Date('01/01/1970'),
         required: false,
      },
      text: {
         type: String,
         default: 'News Description missing',
         required: false,
      },
   });
   const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
</script>

<style scoped>
   .NewsCard {
      -webkit-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      -moz-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
   }
   .NewsCard {
      @apply dark:shadow-lg dark:shadow-zinc-600/50;
   }
   .NewsCard {
      @apply justify-self-center overflow-hidden rounded-2xl h-full w-full;
   }
</style>
