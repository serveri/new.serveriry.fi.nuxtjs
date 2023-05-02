<template>
   <div>
      <Head>
         <Title>{{ $t('title_study-club') }} - Serveri ry</Title>
      </Head>
     <vue-markdown class="rich-text py-2" :source="text[$i18n.locale + '_text']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   let text;
   try {
      const response = await useFetch('http://api.serveri.jeb4.dev/items/study_club');
      text = response.data.value.data;
   } catch (e) {
      text = {
         fi_text: 'API error',
         en_text: 'API error',
      };
   }
</script>
