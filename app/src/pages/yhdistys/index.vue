<template>
   <div>
      <Head>
         <Title>{{ $t('title_org') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text" :source="content[$i18n.locale + '_text']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import { Data } from '@/app.vue';
   const config = useRuntimeConfig();

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/yhdistys`)) as { data: Data };
      content = data.value.data;
   } catch (e) {
      content = {
         fi_text: '# Yhdistys \n rajapintaan ei saatu yhteyttä',
         en_text: '# Organization \n content missing',
      };
   }
</script>

<style>
   p {
      @apply tracking-wide;
   }
</style>
