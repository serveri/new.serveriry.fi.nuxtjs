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
      <Meta
         name="og:image"
         content="https://cloud.serveriry.fi/apps/files_sharing/publicpreview/MjiD9378faa3RA6?x=1920&y=577&a=true&file=serverihiiri.png"
      />
      <Meta name="og:url" content="https://serveriry.fi/" />
      <Title>Serveri ry</Title>
   </Head>
   <div id="app" class="bg-white dark:bg-zinc-800 min-h-screen overflow-hidden">
      <NavBar />
      <page-content />
      <CustomFooter />
   </div>

   <!-- CookieConsent -->
   <div
      v-if="!isHidden && !isConsent"
      class="flex gap-5 items-center justify-center sm:justify-start sm:h-16 fixed bottom-0 w-full h-24 p-4 bg-white"
   >
      <button class="p-2 text-white bg-custom-primary hover:bg-custom-secondary" @click="deleteCookies">
         Poista keksit 😐
      </button>
      <button class="p-2 text-white bg-custom-primary hover:bg-custom-secondary" @click="hideDiv">
         Keksit kelpaavat 😏
      </button>
   </div>

   <div
      v-if="isHidden && isConsent"
      class="flex items-center justify-center fixed bottom-4 left-4 w-[3rem] h-[3rem] bg-black dark:bg-white rounded-full cursor-pointer"
      @click="handleSmallCookie()"
   >
      <client-only>
         <font-awesome-icon class="fa-xl" :icon="['fas', 'cookie-bite']" style="color: #000000" />
      </client-only>
   </div>
</template>

<script lang="ts">
   export default {
      created() {
         const cookieValue = this.getCookie('cookieconsent_status');
         if (cookieValue !== null) {
            this.isConsent = true;
            this.isHidden = true;
         }
      },
      data() {
         return {
            isHidden: false,
            isConsent: false,
         };
      },
      methods: {
         deleteCookies() {
            var Cookies = document.cookie.split(';');
            // set 1 Jan, 1970 expiry for every cookies
            for (var i = 0; i < Cookies.length; i++)
               document.cookie = Cookies[i] + '=;expires=' + new Date(0).toUTCString();
            this.isHidden = true;
            document.cookie = 'cookieconsent_status=deny; expires=Thu, 18 Dec 2040 12:00:00 UTC; path=/;';
            setTimeout(() => {
               window.location.reload();
            }, 1000); // reload page after 1 second
         },
         hideDiv() {
            this.isHidden = true;
            document.cookie = 'cookieconsent_status=allow; expires=Thu, 18 Dec 2040 12:00:00 UTC; path=/;';
            setTimeout(() => {
               window.location.reload();
            }, 1000); // reload page after 1 second
         },
         getCookie(name: string) {
            const cookieString = document.cookie;
            const cookies = cookieString.split(';');

            for (let i = 0; i < cookies.length; i++) {
               const cookie = cookies[i].trim();
               if (cookie.startsWith(name + '=')) {
                  const value = cookie.substring(name.length + 1);
                  console.log('value', value);
                  return value;
               }
            }

            return null; // Return null if cookie not found
         },
         handleSmallCookie() {
            this.isHidden = false;
            this.isConsent = false;
         },
      },
   };
</script>

<script setup lang="ts">
   import NavBar from '@/components/navbar/NavBar.vue';
   import CustomFooter from '@/components/footer/CustomFooter.vue';
</script>
