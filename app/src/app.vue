<template>
   <div id="app" class="bg-white dark:bg-zinc-800 min-h-screen overflow-hidden">
      <NavBar />
      <PageContent />
      <CustomFooter />
   </div>

   <!-- CookieConsent -->
   <div
      v-if="!isHidden && !isConsent && isPageLoaded"
      class="flex gap-5 items-center justify-center sm:justify-start sm:h-16 fixed bottom-0 w-full h-24 p-4 bg-white"
   >
      <button class="p-2 text-white bg-custom-primary hover:bg-custom-secondary" @click="deleteCookies">
         {{ locale === 'en' ? 'Remove Cookies 😐' : 'Poista keksit 😐' }}
      </button>
      <button class="p-2 text-white bg-custom-primary hover:bg-custom-secondary" @click="hideDiv">
         {{ locale === 'en' ? 'Cookies are fine for me 😏' : 'Keksit kelpaavat 😏' }}
      </button>
   </div>

   <div
      v-if="isHidden && isConsent && isPageLoaded"
      class="flex items-center justify-center fixed bottom-4 left-4 w-12 h-12 bg-black dark:bg-white rounded-full cursor-pointer"
      @click="handleSmallCookie()"
   >
      <ClientOnly>
         <FontAwesomeIcon class="fa-xl text-white dark:invert" :icon="['fas', 'cookie-bite']" />
      </ClientOnly>
   </div>
</template>

<script setup lang="ts">
   import { ref, onBeforeMount, onMounted } from 'vue';
   import { useI18n } from 'vue-i18n';
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
   import NavBar from '@/components/navbar/NavBar.vue';
   import PageContent from '@/components/PageContent.vue';
   import CustomFooter from '@/components/footer/CustomFooter.vue';

   const { locale } = useI18n();
   const config = useRuntimeConfig();

   // State
   const isHidden = ref(false);
   const isConsent = ref(false);
   const isPageLoaded = ref(false);

   // Helpers
   const getCookie = (name: string): string | null => {
      if (process.client) {
         const cookieString = document.cookie || '';
         const cookies = cookieString ? cookieString.split(';') : [];
         for (const raw of cookies) {
            const cookie = (raw || '').trim();
            if (cookie.startsWith(name + '=')) {
               return cookie.substring(name.length + 1);
            }
         }
      }
      return null;
   };

   const deleteCookies = () => {
      if (process.client) {
         const Cookies = document.cookie.split(';');
         for (let i = 0; i < Cookies.length; i++) {
            const item = Cookies[i] || '';
            document.cookie = item + '=;expires=' + new Date(0).toUTCString();
         }
         isHidden.value = true;
         isConsent.value = true;
         document.cookie = 'cookieconsent_status=deny; expires=Thu, 18 Dec 2040 12:00:00 UTC; path=/;';
         setTimeout(() => {
            window.location.reload();
         }, 1000);
      }
   };

   const hideDiv = () => {
      if (process.client) {
         isHidden.value = true;
         isConsent.value = true;
         document.cookie = 'cookieconsent_status=allow; expires=Thu, 18 Dec 2040 12:00:00 UTC; path=/;';
         setTimeout(() => {
            window.location.reload();
         }, 1000);
      }
   };

   const handleSmallCookie = () => {
      if (process.client) {
         isHidden.value = false;
         isConsent.value = false;
      }
   };

   // Lifecycle
   onBeforeMount(() => {
      if (process.client) {
         const cookieValue = getCookie('cookieconsent_status');
         if (cookieValue !== null) {
            isConsent.value = true;
            isHidden.value = true;
         }
      }
   });

   onMounted(() => {
      if (process.client) {
         const cookieValue = getCookie('cookieconsent_status');
         if (cookieValue !== null) {
            isConsent.value = true;
            isHidden.value = true;
         }
         isPageLoaded.value = true;
      }
   });

   // SSR: determine theme from color-scheme cookie and set Html class via head htmlAttrs
   const headers = useRequestHeaders(['cookie']);
   const cookieStr = (headers && headers.cookie) ? headers.cookie : '';
   const hasDark = cookieStr.split(';').some((c) => (c || '').trim().startsWith('color-scheme=dark'));

   useHead({
      title: 'Serveri ry',
      meta: [
         {
            name: 'description',
            content:
               'Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö.',
         },
         { name: 'og:title', content: 'Serveri ry' },
         {
            name: 'og:description',
            content:
               'Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö.',
         },
         { name: 'og:image', content: config.public['API_URL'] + 'assets/c90a01ea-5b87-4832-995a-f7ca42c81108' },
         { name: 'og:url', content: 'https://serveriry.fi/' },
      ],
      link: [{ rel: 'icon', href: 'https://api.serveriry.fi/assets/5404c898-6ac5-485b-bdb8-185ed5e1e374' }],
      htmlAttrs: { lang: locale.value, class: hasDark ? 'dark' : '' },
   });
</script>
