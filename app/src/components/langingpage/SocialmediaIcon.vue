<template>
   <div
      class="some-container flex justify-center items-center rounded-2xl py-5 px-6 w-full min-h-[180px] cursor-pointer overflow-hidden"
   >
      <a
         :href="url"
         target="_blank"
         rel="noopener noreferrer"
         class="relative w-full h-full flex flex-col items-center justify-center group"
      >
         <img
            :src="logoUrl"
            :alt="name"
            loading="lazy"
            :class="[
               'h-28 w-full object-contain transition-transform duration-300 scale-100 group-hover:scale-110',
               custom_style || '',
            ]"
         />
         <p
            class="info absolute -bottom-2 left-1/2 -translate-x-1/2 opacity-0 group-hover:opacity-100 transition-all duration-300 text-xs font-semibold text-center whitespace-nowrap text-gray-800 dark:text-gray-200 pointer-events-none"
         >
            {{ name }}
         </p>
      </a>
   </div>
</template>

<script setup lang="ts">
   import { computed } from 'vue';
   import { useDirectusAsset } from '@/composables/useDirectusAsset';

   const props = withDefaults(
      defineProps<{
         url: string;
         img: string;
         name?: string;
         fi_desc?: string;
         en_desc?: string;
         custom_style?: string;
      }>(),
      {
         name: 'Social Media',
         fi_desc: '',
         en_desc: '',
         custom_style: '',
      },
   );

   const { getAssetUrl } = useDirectusAsset();
   const logoUrl = computed(() => getAssetUrl(props.img));
</script>

<style scoped>
   @reference "@/assets/css/main.css";

   .some-container {
      min-height: 180px;
   }
</style>
