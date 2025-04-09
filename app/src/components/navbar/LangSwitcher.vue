<template>
   <div class="p-4">
      <div v-for="(loc, index) in locales" :id="'locale-' + loc.code" :key="index" @click="clicked(loc.code)">
         <nuxt-link v-if="locale === loc.code" :to="switchLocalePath(loc.code)" :title="t('change-language')">
            <img
               :src="'/images/' + (loc.code === 'fi' ? 'en' : 'fi') + '.svg'"
               :alt="loc.code"
               class="h-10 md:h-6 hidden"
            />
         </nuxt-link>
         <nuxt-link v-else :to="switchLocalePath(loc.code)" :title="t('change-language')">
            <img :src="'/images/' + (loc.code === 'fi' ? 'en' : 'fi') + '.svg'" :alt="loc.code" class="h-10 md:h-6" />
         </nuxt-link>
      </div>
   </div>
</template>

<script setup lang="ts">
   import { useI18n, useSwitchLocalePath } from '#i18n';
   const { t, locales, locale } = useI18n();

   const switchLocalePath = useSwitchLocalePath();

   function clicked(code: string) {
      const en = document.getElementById(`locale-en`);
      const fi = document.getElementById(`locale-fi`);
      if (code === 'en') {
         en?.classList.add('hidden');
         fi?.classList.remove('hidden');
      } else {
         fi?.classList.add('hidden');
         en?.classList.remove('hidden');
      }
   }
</script>

<script lang="ts">
   export default {
      data() {
         return {
            selectedValue: '',
         };
      },
   };
</script>
