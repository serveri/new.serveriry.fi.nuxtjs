<template>
   <div class="lg:pr-10 md:pr-5 sm:pr-0 md:flex-1 flex items-center max-w-full">
      <div>
         <div class="rounded-sm">
            <img class="w-full max-h-64 object-cover" :src="content.img" alt="Cover image for the news card" />
         </div>

         <div>
            <h2 class="card-header pt-3 text-2xl font-extrabold">{{ content[$i18n.locale + '_title'] }}</h2>

            <p class="news-date font-normal uppercase mt-1 py-1 text-xs">
               {{ $t('news_released') }}
               <span>{{
                  releaseDate.toLocaleDateString($i18n.locale, {
                     weekday: 'long',
                     year: 'numeric',
                     month: 'long',
                     day: 'numeric',
                  })
               }}</span>
            </p>

            <p class="card-content mt-1 mb-3 line-clamp-6">{{ content[$i18n.locale + '_text'].replaceAll('#', '') }}</p>

            <a :href="'/yhdistys/uutinen/' + content.url" class="pt-3">
               <button class="btn-custom-primary" type="button">{{ 'Lue lisää' }}</button>
            </a>
         </div>
      </div>
   </div>
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
         default: 'https://api.serveriry.fi/uploads/large_computerstuffwithlogo_da6b992e47.jpg',
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
            'Miksi serverit on niin kuumia? Koska kukaan ei voi vastustaa valkoisia haalareita! API ei muuten vastaa.',
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
