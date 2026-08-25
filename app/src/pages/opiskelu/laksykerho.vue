<template>
   <div>
      <Head>
         <Title>{{ $t('title_study-club') }} - Serveri ry</Title>
      </Head>
      <MarkdownView class="rich-text py-2" :source="text[$i18n.locale + '_text']" />
   </div>
</template>

<script setup lang="ts">
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let text;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/study_club`)) as { data: Data };
      text = data.value.data;
   } catch {
      text = {
         fi_text: 'API error',
         en_text: 'API error',
      };
   }
</script>
