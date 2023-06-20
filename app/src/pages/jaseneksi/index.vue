<template>
   <div class="flex flex-col justify-center items-center">
      <Head>
         <Title>{{ $t('title_join-us') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text py-2" :source="text[$i18n.locale + '_text']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import { Data } from '@/app.vue';
   const config = useRuntimeConfig();

   let text;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/liity_serveriin`)) as { data: Data };
      text = data.value.data;
   } catch (e) {
      text = {
         fi_text: 'API error',
         en_text: 'API error',
      };
   }
</script>
