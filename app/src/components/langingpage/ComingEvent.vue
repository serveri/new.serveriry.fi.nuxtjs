<template>
   <div class="max-w-sm py-2">
      <NuxtLink :to="localePath('/yhdistys/tapahtuma/' + link)" class="hover:underline">
         <h3 class="text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
            {{ title }}
         </h3>
      </NuxtLink>
      <p class="font-light text-gray-500 dark:text-gray-400">
         {{
            alku_aika.toLocaleDateString(locale, {
               weekday: 'long',
               year: 'numeric',
               month: 'long',
               day: 'numeric',
               hour: 'numeric',
               minute: 'numeric',
            })
         }}
      </p>
   </div>
</template>

<script setup lang="ts">
   import { computed } from 'vue';
   import { useI18n } from 'vue-i18n';

   const { locale } = useI18n();
   const localePath = useLocalePath();

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
   const alku_aika = new Date(event.alku_aika);
   const title = computed(() => (locale.value === 'en' ? event.en_otsikko : event.fi_otsikko));
</script>

<script lang="ts">
   export default {
      name: 'ComingEvent',
   };
</script>

<style scoped></style>
