<template>
   <div class="max-w-sm py-2">
      <a :href="'/yhdistys/tapahtuma/' + link" class="hover:underline">
         <h3 class="text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
            {{ event[$i18n.locale + '_otsikko'] }}
         </h3>
      </a>
      <p class="font-light text-gray-500 dark:text-gray-400">
         {{ alku_aika.toLocaleDateString($i18n.locale, DateOptions) }}
      </p>
   </div>
</template>

<script setup lang="ts">
   let alku_aika = new Date();
   const event = defineProps({
      en_otsikko: {
         type: String,
         default: 'API Error: Title comes here maybee??',
         required: true,
      },
      fi_otsikko: {
         type: String,
         default: 'API Error: Title comes here maybee??',
         required: true,
      },
      alku_aika: {
         type: String,
         required: true,
      },
      link: {
         type: Number,
         default: 1,
         required: true,
      },
   });
   alku_aika = new Date(event.alku_aika);
   const DateOptions = {
      weekday: 'long',
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      hour: 'numeric',
      minute: 'numeric',
   };
</script>

<script lang="ts">
   export default {
      name: 'ComingEvent',
   };
</script>

<style scoped></style>
