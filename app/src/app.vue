<template>
   <Html :lang="$i18n.locale" />
   <Head>
      <Meta
         name="description"
         content="Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö."
      />
      <Meta name="og:title" content="Serveri ry" />
      <Meta
         name="og:description"
         content="Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö."
      />
      <Meta
         name="og:image"
         content="https://cloud.serveriry.fi/apps/files_sharing/publicpreview/MjiD9378faa3RA6?x=1920&y=577&a=true&file=serverihiiri.png"
      />
      <Meta name="og:url" content="https://serveriry.fi/" />
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
