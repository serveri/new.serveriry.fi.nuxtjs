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
   let text;
   try {
      const response = await useFetch('http://127.0.0.1:8081/items/liity_serveriin');
      text = response.data.value.data;
   } catch (e) {
      text = {
         fi_text: 'API error',
         en_text: 'API error',
      };
   }
</script>
