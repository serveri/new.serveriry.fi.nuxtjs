<template>
   <div class="md:flex md:items-center">
      <div class="w-full">
         <div class="rounded-xs w-full">
            <img class="w-full h-64 object-cover" :src="content.img" alt="Cover image for the news card" />
         </div>

         <div>
            <h2 class="card-header pt-3 text-2xl font-extrabold">{{ content[locale + '_title'] }}</h2>

            <p class="news-date font-normal uppercase mt-1 py-1 text-xs">
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

            <p class="mt-1 mb-3 line-clamp-6">{{ content[locale + '_text'].replaceAll('#', '') }}</p>

            <a :href="'/yhdistys/uutinen/' + content.url" class="pt-3">
               <button class="btn-custom-primary" type="button">{{ locale === 'en' ? 'Read more' : 'Lue lisää' }}</button>
            </a>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
  import { useI18n } from '#i18n';
   const { locale } = useI18n();
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
         type: String,
         default: new Date('01/01/1970'),
         required: true,
      },
      fi_text: {
         type: String,
         default:
            'Miksi serverit on niin kuumia? Koska kukaan ei voi vastustaa valkoisia haalareita! Sivut ei muuten nyt toimi koska sisällönhallinta rajapintaan ei saada yhteyttä, jos ongelma toistuu ota yhteyttä ylläpitovastaavaan. Jos olet ylläpitovastaava niin aamuja ;)',
         required: true,
      },
      en_text: {
         type: String,
         default: 'Why are the servers so hot? Because no one can resist white overalls! BTW API does not respond.',
         required: true,
      },
   });
   const releaseDate = new Date(content.date);
</script>

<style scoped></style>
