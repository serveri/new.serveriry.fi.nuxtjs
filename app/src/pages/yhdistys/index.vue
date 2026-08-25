<template>
   <div>
      <Head>
         <Title>{{ $t('title_org') }} - Serveri ry</Title>
      </Head>
      <MarkdownView class="rich-text" :source="content[$i18n.locale + '_text']" />
   </div>
</template>

<script setup lang="ts">
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/yhdistys`)) as { data: Data };
      content = data.value.data;
   } catch {
      content = {
         fi_text: '# Yhdistys \n rajapintaan ei saatu yhteyttä',
         en_text: '# Organization \n content missing',
      };
   }
</script>

<style>
   @reference 'tailwindcss';

   p {
      @apply tracking-wide;
   }
</style>
