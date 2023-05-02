<template>
   <div class="p-4">
      <div
         v-for="(locale, index) in $i18n.locales"
         :id="'locale-' + locale.code"
         :key="index"
         @click="clicked(locale.code)"
      >
         <!-- Fix this weird bug: parent element must be hidden too: causes padding in nav flex-->
         <nuxt-link
            v-if="$i18n.locale === locale.code"
            :to="switchLocalePath(locale.code)"
            :title="$t('change-language')"
         >
            <img
               :src="'/images/' + (locale.code === 'fi' ? 'gb' : 'fi') + '.svg'"
               :alt="locale.code"
               class="h-10 md:h-6 hidden"
            />
         </nuxt-link>
         <nuxt-link v-else :to="switchLocalePath(locale.code)" :title="$t('change-language')">
            <img
               :src="'/images/' + (locale.code === 'fi' ? 'gb' : 'fi') + '.svg'"
               :alt="locale.code"
               class="h-10 md:h-6"
            />
         </nuxt-link>
      </div>
   </div>
</template>

<script setup lang="ts">
   function clicked(code: string) {
      const en: HTMLElement | null = document.getElementById(`locale-en`);
      const fi: HTMLElement | null = document.getElementById(`locale-fi`);
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
