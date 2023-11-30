<template>
   <div>
      <Head>
         <Title>{{ $t('title_history') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_history') }}</h1>
      <vue-markdown class="rich-text group-open:animate-fadeIn" :source="content[$i18n.locale + '_content']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import { Data } from '@/app.vue';
   const config = useRuntimeConfig();

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/history`)) as { data: Data };
      content = data.value.data;
   } catch (e) {
      content = {
         fi_content: '# Historia kadoksissa \n Tämä tulee myöhemmin',
         en_content: '# History \n ### Who lost the history? \n Will be added later',
      };
   }
</script>
