<template>
   <div
      v-for="(locale, index) in $i18n.locales"
      :id="'locale-' + locale.code"
      :key="index"
      @click="clicked(locale.code)"
   >
      <!-- Fix this weird bug: parent element must be hidden too: causes padding in nav flex-->
      <nuxt-link
         class="text-black dark:text-white uppercase px-6"
         :to="switchLocalePath(locale.code)"
         :title="$t('change-language')"
      >
         <img
            :src="'https://flagicons.lipis.dev/flags/4x3/' + (locale.code === 'fi' ? 'fi' : 'us') + '.svg'"
            :alt="locale.code"
            class="h-6"
         />
      </nuxt-link>
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
