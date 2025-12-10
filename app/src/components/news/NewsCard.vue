<template>
   <a :href="'/yhdistys/uutinen/' + content.url" class="grid-item md:max-w-lg">
      <div class="news-card">
         <div class="rounded-xs">
            <img class="w-full max-h-64 object-cover" :src="content.img" alt="Cover image for the news card" />
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
   </a>
</template>

<script setup lang="ts">
   const content = defineProps({
      url: {
         type: String,
         default: '',
         required: true,
      },
      img: {
         type: String,
         default: 'https://api.serveriry.fi/assets/9db2e4a2-e9d7-4dab-8156-8cc0f482775d',
         required: true,
      },
      fi_title: {
         type: String,
         default: 'Uutisen otsikkoa ei löytynyt',
         required: true,
      },
      en_title: {
         type: String,
         default: "News title wasn't found",
         required: true,
      },
      date: {
         type: Date,
         default: new Date('01/01/1970'),
         required: true,
      },
      fi_text: {
         type: String,
         default:
            'Miksi serverit on niin kuumia? Koska kukaan ei voi vastustaa valkoisia haalareita! API ei muuten vastaa.',
         required: true,
      },
      en_text: {
         type: String,
         default: 'Why are the servers so hot? Because no one can resist white overalls! BTW API does not respond.',
         required: true,
      },
   });
</script>

<style scoped>
   @import 'tailwindcss';
   .news-card {
      -webkit-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      -moz-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
   }
   .news-card {
      @apply dark:shadow-lg dark:shadow-zinc-600/50 dark:bg-zinc-900;
   }
   .news-card {
      @apply justify-self-center overflow-hidden rounded-2xl h-full w-full;
   }
   .grid-item {
      --aspect-ratio: 16/9;
   }
</style>
