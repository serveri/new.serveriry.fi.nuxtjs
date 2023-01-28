<template>
   <div id="app" class="bg-white dark:bg-zinc-900" style="min-height: 100vh">
      <NavBar />
      <page-content />
      <CustomFooter />
   </div>
</template>

<script setup lang="ts">
   import NavBar from '@/components/navbar/NavBar.vue';
   import CustomFooter from '@/components/footer/CustomFooter.vue';
</script>
