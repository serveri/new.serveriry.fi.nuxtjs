<template>
   <a :href="partner.url" target="_blank" tabindex="-1" @mouseover="hover = true" @mouseleave="hover = false">
      <img
         v-if="hover"
         :src="useDark().value && partner.img_dark?.startsWith('http') ? partner.img_dark : partner.img"
         :alt="partner.name"
         loading="lazy"
         class="scale-110"
         :title="partner.name"
         tabindex="-1"
      />
      <img
         v-else
         :src="useDark().value && partner.img_dark?.startsWith('http') ? partner.img_dark : partner.img"
         :alt="partner.name"
         loading="lazy"
         class="scale-100"
         tabindex="-1"
      />
   </a>
</template>

<script setup lang="ts">
   import { useDark } from '@vueuse/core';

   const partner = defineProps({
      url: {
         type: String,
         default: 'Default',
         required: true,
      },
      img: {
         type: String,
         default: 'Default',
         required: true,
      },
      img_dark: {
         type: String,
         default: '',
         required: false,
      },
      name: {
         type: String,
         default: 'Default',
         required: true,
      },
   });
</script>

<script lang="ts">
   export default {
      name: 'PartnerCard',
      data() {
         return {
            hover: false,
         };
      },
   };
</script>

<style scoped>
   /**
   a {
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      display: flex;
      justify-content: center;
      align-items: center;
   }

   a {
      @apply rounded-lg w-full h-full cursor-pointer dark:shadow-none dark:bg-zinc-900;
   }
   */

   img {
      height: 7rem;
      width: 90%;
      padding: 0.8rem;
      object-fit: contain;
      -o-object-fit: contain;
   }
</style>
