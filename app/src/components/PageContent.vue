<template>
   <div
      :class="{
         content: !($route.path.endsWith('zyn') || $route.path.endsWith('viinapiru')),
         'min-h-[62.5vh]': true,
         'mt-20': true
      }"
   >
      <router-view />
   </div>
</template>

<script setup lang="ts">
import { useRoute } from 'vue-router';

const $route = useRoute();
</script>