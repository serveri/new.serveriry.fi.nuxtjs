<template>
   <Html :lang="$i18n.locale" />
   <Head>
      <Meta
         name="description"
         content="Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö."
      />
      <Meta name="og:title" content="Serveri ry" />
      <Meta
         name="og:description"
         content="Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö."
      />
      <Meta name="og:image" :content="config.public['API_URL'] + 'assets/c90a01ea-5b87-4832-995a-f7ca42c81108'" />
      <Meta name="og:url" content="https://serveriry.fi/" />
      <Title>Serveri ry</Title>
      <Link rel="icon" href="/images/rotta.svg" />
   </Head>
   <div id="app" class="bg-white dark:bg-zinc-800 min-h-screen overflow-hidden">
      <NavBar />
      <page-content />
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
      class="flex items-center justify-center fixed bottom-4 left-4 w-[3rem] h-[3rem] bg-black dark:bg-white rounded-full cursor-pointer"
      @click="handleSmallCookie()"
   >
      <client-only>
         <font-awesome-icon class="fa-xl text-white dark:invert" :icon="['fas', 'cookie-bite']" />
      </client-only>
   </div>
</template>

<script lang="ts">
   export default {
      data() {
         return {
            isHidden: false,
            isConsent: false,
            isPageLoaded: false,
         };
      },
      created() {
         if (process.client) {
            const cookieValue = this.getCookie('cookieconsent_status');
            if (cookieValue !== null) {
               this.isConsent = true;
               this.isHidden = true;
            }
         }
      },
      mounted() {
         window.onload = () => {
            const cookieValue = this.getCookie('cookieconsent_status');
            if (cookieValue !== null) {
               this.isConsent = true;
               this.isHidden = true;
            }
            this.isPageLoaded = true;
         };
      },
      methods: {
         deleteCookies() {
            if (process.client) {
               const Cookies = document.cookie.split(';');
               // set 1 Jan, 1970 expiry for every cookies
               for (let i = 0; i < Cookies.length; i++)
                  document.cookie = Cookies[i] + '=;expires=' + new Date(0).toUTCString();
               this.isHidden = true;
               this.isConsent = true;
               document.cookie = 'cookieconsent_status=deny; expires=Thu, 18 Dec 2040 12:00:00 UTC; path=/;';
               setTimeout(() => {
                  window.location.reload();
               }, 1000); // reload page after 1 second
            }
         },
         hideDiv() {
            if (process.client) {
               this.isHidden = true;
               this.isConsent = true;
               document.cookie = 'cookieconsent_status=allow; expires=Thu, 18 Dec 2040 12:00:00 UTC; path=/;';
               setTimeout(() => {
                  window.location.reload();
               }, 1000); // reload page after 1 second
            }
         },
         getCookie(name: string) {
            if (process.client) {
               const cookieString = process.client ? document.cookie : '';
               const cookies = cookieString.split(';');

               for (let i = 0; i < cookies.length; i++) {
                  const cookie = cookies[i].trim();
                  if (cookie.startsWith(name + '=')) {
                     return cookie.substring(name.length + 1);
                  }
               }

               return null; // Return null if cookie not found
            }
         },
         handleSmallCookie() {
            if (process.client) {
               this.isHidden = false;
               this.isConsent = false;
            }
         },
      },
   };
</script>

<script setup lang="ts">
   import { useI18n } from '#i18n';
   const { locale } = useI18n();
   import NavBar from '@/components/navbar/NavBar.vue';
   import CustomFooter from '@/components/footer/CustomFooter.vue';
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
   const config = useRuntimeConfig();
</script>
