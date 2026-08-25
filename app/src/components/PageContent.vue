<template>
   <div
      :class="{
         content: !isSpecialRoute,
         'min-h-[62.5vh]': true,
         'mt-20': true,
      }"
   >
      <NuxtPage />
   </div>
</template>

<script setup lang="ts">
   import { useRoute } from 'vue-router';
   import { computed } from 'vue';

   const $route = useRoute();

   const isSpecialRoute = computed(() => {
      const path = $route.path || '';
      return path.endsWith('zyn') || path.endsWith('viinapiru');
   });
</script>
