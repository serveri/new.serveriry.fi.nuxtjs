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
      link: [
         { rel: 'icon', type: 'image/svg+xml', href: '/favicon.svg?v=2' },
         { rel: 'icon', type: 'image/png', sizes: '96x96', href: '/favicon-96x96.png?v=2' },
         { rel: 'shortcut icon', href: '/favicon.ico?v=2' },
         { rel: 'apple-touch-icon', href: '/apple-touch-icon.png?v=2' },
      ],
      script: [
         {
            async: true,
            src: 'https://analytics.bittive.com/js/pa-fDG6O3DAZF7sX9bdOg6c7.js',
         },
         {
            innerHTML:
               'window.plausible=window.plausible||function(){(plausible.q=plausible.q||[]).push(arguments)},plausible.init=plausible.init||function(i){plausible.o=i||{}};plausible.init()',
         },
      ],
      htmlAttrs: { lang: locale.value, class: hasDark ? 'dark' : '' },
   });
</script>
