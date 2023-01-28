<template>
   <div id="app">
      <NavBar />
      <page-content />
      <CustomFooter />
   </div>
</template>

<script setup lang="ts">
   import NavBar from '@/components/navbar/NavBar.vue';
   import CustomFooter from "@/components/footer/CustomFooter.vue";
</script>
