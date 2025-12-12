<template>
   <div class="flex flex-col">
      <a :href="partner.url" target="_blank" tabindex="-1" @mouseover="hover = true" @mouseleave="hover = false">
         <img
            :src="partner.img"
            :alt="partner.name"
            loading="lazy"
            class="transition-transform duration-200"
            :class="[hover ? 'scale-110' : 'scale-100', partner.img_dark ? 'dark:hidden' : '']"
            :title="partner.name"
            tabindex="-1"
         />

         <img
            v-if="partner.img_dark"
            :src="partner.img_dark"
            :alt="partner.name"
            loading="lazy"
            class="hidden dark:block transition-transform duration-200"
            :class="hover ? 'scale-110' : 'scale-100'"
            :title="partner.name"
            tabindex="-1"
         />
      </a>
      <p class="sr-only">
         {{ $i18n.locale === 'fi' ? partner.fi_text : partner.en_text }}
      </p>
   </div>
</template>

<script setup lang="ts">
   import { ref } from 'vue';
   // removed useDark and computed imports as we now use CSS

   const partner = defineProps<{
      url: string;
      img: string;
      img_dark?: string;
      name: string;
      fi_text?: string | null;
      en_text?: string | null;
   }>();

   const hover = ref(false);
</script>

<style scoped>
   @reference "tailwindcss";
   img {
      height: 12rem;
      width: 12rem;
      max-width: 100%;
      max-height: 100%;
      padding: 0.8rem;
      object-fit: contain;
   }

   /* This targets the img inside the component when the parent adds the class */
   .main-partner-card img {
      height: 15rem;
      width: 15rem;
   }

   .scale-110 {
      transform: scale(1.1);
   }

   .scale-100 {
      transform: scale(1);
   }
</style>
