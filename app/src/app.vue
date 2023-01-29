<template>
   <div id="app" class="bg-white dark:bg-zinc-800 min-h-screen">
      <NavBar />
      <page-content />
      <CustomFooter />
   </div>
</template>

<script setup lang="ts">
   import NavBar from '@/components/navbar/NavBar.vue';
   import CustomFooter from '@/components/footer/CustomFooter.vue';
</script>
