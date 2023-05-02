<template>
   <Html :lang="$i18n.locale" />
   <Head>
      <Meta
         name="description"
         content="Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö."
      />
      <Title>Serveri ry</Title>
   </Head>
   <div id="app" class="bg-white dark:bg-zinc-800 min-h-screen overflow-hidden">
      <NavBar />
      <page-content />
      <CustomFooter />
   </div>
</template>

<script setup lang="ts">
   import NavBar from '@/components/navbar/NavBar.vue';
   import CustomFooter from '@/components/footer/CustomFooter.vue';
</script>
