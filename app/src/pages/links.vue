<template>
   <div>
      <Head>
         <Title>{{ $t('title_links') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text links-content" :source="links[$i18n.locale + '_content']" />
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import { Data } from '@/app.vue';
   const config = useRuntimeConfig();

   let links;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/links`)) as { data: Data };
      links = data.value.data;
   } catch (e) {
      links = {
         fi_content: '# Hyödylliset linkit',
         en_content: '# Useful links',
      };
   }
</script>
