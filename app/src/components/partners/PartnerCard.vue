<template>
   <div class="flex flex-col items-center justify-center w-full h-full">
      <a
         :href="partner.url"
         target="_blank"
         tabindex="-1"
         class="flex items-center justify-center w-full h-full"
         @mouseover="hover = true"
         @mouseleave="hover = false"
      >
         <img
            :src="partner.img"
            :alt="partner.name"
            loading="lazy"
            class="transition-transform duration-200"
            :class="[
               hover ? 'scale-110' : 'scale-100',
               partner.img_dark ? 'dark:hidden' : '',
               partner.main_sponsor ? 'main-sponsor-img' : 'regular-sponsor-img',
            ]"
            :title="partner.name"
            tabindex="-1"
         />

         <img
            v-if="partner.img_dark"
            :src="partner.img_dark"
            :alt="partner.name"
            loading="lazy"
            class="hidden dark:block transition-transform duration-200"
            :class="[
               hover ? 'scale-110' : 'scale-100',
               partner.main_sponsor ? 'main-sponsor-img' : 'regular-sponsor-img',
            ]"
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

   const partner = defineProps<{
      url: string;
      img: string;
      img_dark?: string;
      name: string;
      main_sponsor?: boolean;
      fi_text?: string | null;
      en_text?: string | null;
   }>();

   const hover = ref(false);
</script>

<style scoped>
   img {
      height: 12rem;
      width: 12rem;
      max-width: 100%;
      max-height: 100%;
      padding: 0.8rem;
      object-fit: contain;
   }

   /* This targets the img inside the component when the parent adds the class */
   .main-partner-card img,
   .main-sponsor-img {
      height: 15rem;
      width: 15rem;
   }

   .scale-110 {
      transform: scale(1.1);
   }

   .scale-100 {
      transform: scale(1);
   }

   @media (width <= 767px) {
      img {
         width: auto;
         height: 8.5rem;
         max-width: 95%;
         max-height: 8.5rem;
         object-fit: contain;
         padding: 0.2rem;
      }

      .main-partner-card img,
      .main-sponsor-img {
         width: auto;
         height: 11.5rem;
         max-width: 98%;
         max-height: 11rem;
         object-fit: contain;
         padding: 0.1rem;
      }
   }
</style>
