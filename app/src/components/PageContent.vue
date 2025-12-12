<template>
   <div
      :class="{
         content: !isSpecialRoute,
         'min-h-[62.5vh]': true,
         'mt-20': true,
      }"
   >
      <router-view />
   </div>
</template>

<script setup lang="ts">
   import { useRoute } from 'vue-router';
   import { computed } from 'vue';
   import { isClient } from '@vueuse/core';

   const $route = useRoute();

   const isSpecialRoute = computed(() => {
      if (!isClient) return false;
      const path = $route.path || '';
      return path.endsWith('zyn') || path.endsWith('viinapiru');
   });
</script>
