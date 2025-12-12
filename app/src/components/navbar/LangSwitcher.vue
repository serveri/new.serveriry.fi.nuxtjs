<template>
   <div class="p-4">
      <div v-for="(loc, index) in locales" :id="'locale-' + loc.code" :key="index" @click="clicked(loc.code)">
         <nuxt-link v-if="locale === loc.code" :to="switchLocalePath(loc.code)" :title="t('change-language')">
            <img :src="loc.code === 'fi' ? flagEn : flagFi" :alt="loc.code" class="h-10 md:h-6 hidden" />
         </nuxt-link>
         <nuxt-link v-else :to="switchLocalePath(loc.code)" :title="t('change-language')">
            <img :src="loc.code === 'fi' ? flagEn : flagFi" :alt="loc.code" class="h-10 md:h-6" />
         </nuxt-link>
      </div>
   </div>
</template>

<script setup lang="ts">
   import { useI18n, useSwitchLocalePath } from '#i18n';
   const { t, locales, locale } = useI18n();
   const switchLocalePath = useSwitchLocalePath();
   const flagEn = 'https://api.serveriry.fi/assets/eff21f2c-c5da-424e-a25e-26fc4de5b3a7';
   const flagFi = 'https://api.serveriry.fi/assets/e2823a84-6cb2-48dc-aca4-a65e3282a9e6';
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
