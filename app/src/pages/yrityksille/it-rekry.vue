<template>
   <div>
      <Head>
         <Title>{{ $t('title_it-rekry') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text rekry-content" :source="rekry[$i18n.locale + '_text']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let rekry;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/it_rekry`)) as { data: Data };
      rekry = data.value.data;
   } catch (e) {
      rekry = {
         fi_text: '# IT Rekry',
         en_text: '# IT Recruitment',
      };
   }
</script>

<style>
   @reference "tailwindcss";

   p {
      @apply tracking-wide;
   }
   .rekry-content img {
      @apply w-full;
   }
   .rekry-content h2 {
      @apply font-bold text-3xl mt-4 text-center md:text-left;
   }
   .rekry-content h3 {
      @apply text-2xl;
   }
   .rekry-content h4 {
      @apply text-xl;
   }

   .rekry-content h6 {
      @apply text-sm;
   }

   .rekry-content table {
      @apply table-auto;
   }

   th {
      text-align: left !important;
   }
</style>
