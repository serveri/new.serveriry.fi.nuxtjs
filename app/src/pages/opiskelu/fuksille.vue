<template>
   <div>
      <Head>
         <Title>{{ $t('title_new-student') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text py-2" :source="text[$i18n.locale + '_text']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let text;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/for_new_student`)) as { data: Data };
      text = data.value.data;
   } catch (e) {
      text = {
         fi_text: 'API error',
         en_text: 'API error',
      };
   }
</script>
