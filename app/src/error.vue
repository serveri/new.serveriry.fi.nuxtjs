<template>
   <div id="app" class="bg-white dark:bg-zinc-800 min-h-screen overflow-hidden">
      <NavBar />
      <NotFound :error="error" :handle-error="handleError" />
      <CustomFooter />
   </div>
</template>

<script setup lang="ts">
   import { clearError } from 'nuxt/app';
   import NavBar from '@/components/navbar/NavBar.vue';
   import CustomFooter from '@/components/footer/CustomFooter.vue';
   import NotFound from '@/components/error.vue';

   // default props available on error.vue
   const props = defineProps({
      error: Object,
   });

   // clear error and redirect to home page
   const handleError = () => clearError({ redirect: '/' });
</script>
