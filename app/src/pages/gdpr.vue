<template>
   <div>
      <Head>
         <Title>{{ $t('title_gdpr') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text py-2" :source="text[$i18n.locale + '_text']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   let text;
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/gdpr');
      text = response.data.value.data;
   } catch (e) {
      text = {
         fi_text: 'API error',
         en_text: 'API error',
      };
   }
</script>
