<template>
   <div>
      <Head>
         <Title>{{ $t('title_collaboration') }} - Serveri ry</Title>
      </Head>
      <div class="p-4 pb-16 mx-auto max-w-(--breakpoint-md)">
         <MarkdownView class="rich-text custom-paragraph" :source="content[$i18n.locale + '_text']" />
      </div>
      <section>
         <ContactFormBusiness />
      </section>
   </div>
</template>

<script setup lang="ts">
   import ContactFormBusiness from '@/components/partners/ContactFormBusiness.vue';

   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/yhteistyo_sivu`)) as { data: Data };
      content = data.value.data;
   } catch {
      content = {
         fi_text: '# Yhteistyökumppaniksi?',
         en_text: '# Collaborate?',
      };
   }
</script>

<style>
   @reference "tailwindcss";

   .custom-paragraph p {
      @apply font-light tracking-wide text-gray-500 dark:text-gray-400 text-lg text-center;
   }
</style>
