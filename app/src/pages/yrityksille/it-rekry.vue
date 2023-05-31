<template>
   <div>
      <Head>
         <Title>{{ $t('title_it-rekry') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text merch-content" :source="merch[$i18n.locale + '_text']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';

   let merch;
   let updated: Date;
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/it_rekry');
      merch = response.data.value.data;
      updated = new Date(merch.date_updated);
   } catch (e) {
      merch = {
         fi_text: '# IT Rekry',
         en_text: '# IT Recruitment',
      };
      updated = new Date();
   }
</script>

<style>
   p {
      @apply tracking-wide;
   }
   .merch-content img {
      @apply w-full;
   }
   .merch-content h2 {
      @apply font-bold text-3xl mt-4 text-center md:text-left;
   }
   .merch-content h3 {
      @apply text-2xl;
   }
   .merch-content h4 {
      @apply text-xl;
   }

   .merch-content h6 {
      @apply text-sm;
   }

   .merch-content table {
      @apply table-auto;
   }

   th {
      text-align: left !important;
   }
</style>
