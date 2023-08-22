<template>
   <a :href="'/yhdistys/tapahtuma/' + content.url" class="grid-item md:max-w-lg">
      <div class="event-card">
         <div class="rounded-sm">
            <img
               class="w-full max-h-64 object-cover"
               :src="content.img?.startsWith('http') ? content.img : '/images/tapahtumat-placeholder.png'"
               alt="Cover image for the event card"
            />
         </div>

         <div class="px-4">
            <h2 class="card-header pt-3 text-2xl font-extrabold">{{ content[$i18n.locale + '_title'] }}</h2>

            <p class="news-date font-normal uppercase mt-1 text-xs">
               {{
                  content.start_time.toLocaleDateString($i18n.locale, {
                     weekday: 'long',
                     month: 'long',
                     day: 'numeric',
                     hour: '2-digit',
                     minute: '2-digit',
                  })
               }}
            </p>

            <p class="card-content mt-1 mb-3 line-clamp-3">{{ content[$i18n.locale + '_text'] }}</p>
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
         default: 'https://cloud.serveriry.fi/s/rRJL8CTTSg9KDYK/download/Tapahtumat-placeholder.png',
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
      start_time: {
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
   .event-card {
      -webkit-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      -moz-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
   }
   .event-card {
      @apply dark:shadow-lg dark:shadow-zinc-600/50 dark:bg-zinc-900;
   }
   .event-card {
      @apply justify-self-center overflow-hidden rounded-2xl h-full w-full;
   }
   .grid-item {
      --aspect-ratio: 16/9;
   }
</style>
