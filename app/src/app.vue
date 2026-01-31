<template>
   <div id="app" class="bg-white dark:bg-zinc-800 min-h-screen overflow-hidden">
      <NavBar />
      <PageContent />
      <CustomFooter />
   </div>
   <CookieConsent />
</template>

<script setup lang="ts">
   import { useI18n } from 'vue-i18n';
   import NavBar from '@/components/navbar/NavBar.vue';
   import PageContent from '@/components/PageContent.vue';
   import CustomFooter from '@/components/footer/CustomFooter.vue';
   import CookieConsent from '@/components/CookieConsent.vue';

   const { locale } = useI18n();
   const config = useRuntimeConfig();

   // SSR: determine theme from color-scheme cookie and set Html class via head htmlAttrs
   const headers = useRequestHeaders(['cookie']);
   const cookieStr = headers && headers.cookie ? headers.cookie : '';
   const hasDark = cookieStr.split(';').some((c) => (c || '').trim().startsWith('color-scheme=dark'));

   useHead({
      title: 'Serveri ry',
      meta: [
         {
            name: 'description',
            content: 'Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö.',
         },
         { name: 'og:title', content: 'Serveri ry' },
         {
            name: 'og:description',
            content: 'Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö.',
         },
         { name: 'og:image', content: config.public['API_URL'] + 'assets/c90a01ea-5b87-4832-995a-f7ca42c81108' },
         { name: 'og:url', content: 'https://serveriry.fi/' },
      ],
      link: [{ rel: 'icon', href: 'https://api.serveriry.fi/assets/5404c898-6ac5-485b-bdb8-185ed5e1e374' }],
      htmlAttrs: { lang: locale.value, class: hasDark ? 'dark' : '' },
   });
</script>
