<template>
   <a :href="SoMe.link" :title="SoMe.name" class="text-gray-500 hover:text-gray-900 dark:hover:text-white">
      <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
         <ClientOnly fallback-tag="span" fallback="">
            <font-awesome-icon :icon="SoMe.icon" />
         </ClientOnly>
      </svg>
      <span class="sr-only" :aria-label="SoMe.name"></span>
   </a>
</template>

<script setup lang="ts">
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

   const SoMe = defineProps({
      name: {
         type: String,
         default: 'Default Title',
         required: true,
      },
      link: {
         type: String,
         default: 'fab instagram',
         required: true,
      },
      icon: {
         type: String,
         default: '#event',
         required: true,
      },
   });
</script>

<script lang="ts">
   export default {
      name: 'FooterSocialMedia',
   };
</script>

<style scoped></style>
