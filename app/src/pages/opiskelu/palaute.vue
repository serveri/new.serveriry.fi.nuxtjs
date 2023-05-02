<template>
   <div>
      <Head>
         <Title>{{ $t('title_feedback') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_feedback') }}</h1>

      <vue-markdown class="rich-text py-2" :source="text[$i18n.locale + '_text']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   let text;
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/feedback_page');
      text = response.data.value.data;
   } catch (e) {
      text = {
         fi_text: 'API error',
         en_text: 'API error',
      };
   }
</script>
