<template>
   <div class="flex flex-col">
      <a :href="partner.url" target="_blank" tabindex="-1" @mouseover="hover = true" @mouseleave="hover = false">
         <img
            :src="computedImgSrc"
            :alt="partner.name"
            loading="lazy"
            :class="{ 'scale-110': hover, 'scale-100': !hover }"
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
   import { ref, computed } from 'vue';
   import { useDark } from '@vueuse/core';

   // Props definition using defineProps
   const partner = defineProps<{
      url: string;
      img: string;
      img_dark?: string;
      name: string;
      fi_text?: string | null;
      en_text?: string | null;
   }>();

   // Hover state
   const hover = ref(false);

   // Dark mode state
   const isDark = useDark();

   // Computed property for image source
   const computedImgSrc = computed(() => {
      return isDark.value && partner.img_dark?.startsWith('http') ? partner.img_dark : partner.img;
   });
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
