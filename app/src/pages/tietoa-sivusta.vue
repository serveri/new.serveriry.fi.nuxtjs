<template>
   <div>
      <Head>
         <Title>{{ $t('title_about_site') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_about_site') }}</h1>
      <div>
         <vue-markdown class="rich-text py-2" :source="about_text['tietoa_sivustosta_text_' + $i18n.locale]" />
      </div>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let about_text;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/tietoa_sivustosta`)) as { data: Data };
      about_text = data.value.data;
   } catch (e) {
      about_text = {
         tietoa_sivustosta_text_fi: 'API error',
         tietoa_sivustosta_text_en: 'API error',
      };
   }
</script>

<style scoped></style>
