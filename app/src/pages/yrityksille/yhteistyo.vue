<template>
   <div>
      <Head>
         <Title>{{ $t('title_collaboration') }} - Serveri ry</Title>
      </Head>
      <div class="p-4 pb-16 mx-auto max-w-screen-md">
         <vue-markdown class="rich-text content-style" :source="content[$i18n.locale + '_text']" />
      </div>
      <section>
         <ContactFormBusiness />
      </section>
   </div>
</template>

<script setup lang="ts">
   import ContactFormBusiness from '@/components/partners/ContactFormBusiness.vue';
   import VueMarkdown from 'vue-markdown-render';

   let content;
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/yhteistyo_sivu');
      content = response.data.value.data;
   } catch (e) {
      content = {
         fi_text: '# Yhteistyökumppaniksi?',
         en_text: '# Collaborate?',
      };
   }
</script>

<style>
   .content-style p {
      @apply text-center paragraph;
   }
</style>
