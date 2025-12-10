<template>
   <div>
      <Head>
         <Title>{{ $t('title_merch') }} - Serveri ry</Title>
      </Head>
      <vue-markdown
         class="rich-text merch-content flex flex-col items-center"
         :source="merch[$i18n.locale + '_content']"
      />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let merch;
   // let updated: Date;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/merch_sivu`)) as { data: Data };
      merch = data.value.data;
   } catch (e) {
      merch = {
         fi_content: '# Mertsi kadoksissa',
         en_content: '# Merch missing',
      };
   }
</script>

<style>
   @reference "tailwindcss";
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
      content: url('https://api.serveriry.fi/assets/3759b452-ee3e-4c6c-9a3a-59e482fa2421');
      padding-right: 1rem;
   }
</style>
