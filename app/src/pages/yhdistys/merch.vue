<template>
   <div>
      <Head>
         <Title>{{ $t('title_merch') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text merch-content" :source="merch[$i18n.locale + '_content']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';

   let merch;
   let updated: Date;
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/merch_sivu');
      merch = response.data.value.data;
      updated = new Date(merch.date_updated);
   } catch (e) {
      merch = {
         fi_content: '# Mertsi kadoksissa',
         en_content: '# Merch missing',
      };
      updated = new Date();
   }
</script>

<style>
   p {
      @apply tracking-wide;
   }
   .merch-content img {
      @apply max-w-lg w-full;
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

   .merch-content blockquote {
      @apply text-xl italic font-semibold text-gray-900 dark:text-white;
   }
   .merch-content blockquote p::before {
      content: url('/images/blockquote.svg');
      padding-right: 1rem;
   }
</style>
