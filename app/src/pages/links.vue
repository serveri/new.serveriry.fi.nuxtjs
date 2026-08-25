<template>
   <div>
      <Head>
         <Title>{{ $t('title_links') }} - Serveri ry</Title>
      </Head>
      <MarkdownView class="rich-text links-content" :source="links[$i18n.locale + '_content']" />
   </div>
</template>

<script setup lang="ts">
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let links;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/links`)) as { data: Data };
      links = data.value.data;
   } catch {
      links = {
         fi_content: '# Hyödylliset linkit',
         en_content: '# Useful links',
      };
   }
</script>
