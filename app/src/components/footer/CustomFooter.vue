<template>
   <footer class="bg-white dark:bg-zinc-900">
      <div class="p-4 sm:p-6 content">
         <!-- Logo -->
         <div class="mx-2 sm:mx-0 flex flex-col sm:flex-row items-stretch justify-between">
            <!-- Serveri ry-->
            <div class="sm:w-1/3">
               <h2 class="mb-2 text-xl font-bold text-gray-900 dark:text-white">Serveri ry</h2>
               <h2 class="mb-6 text-md font-semibold text-gray-900 dark:text-white">Y: 1085522-1</h2>
               <p class="mb-1 text-md font-mediumfont-bold text-gray-9font-bold00 dark:text-white">Microkatu 1</p>
               <p class="mb-1 text-md font-mediumfont-bold text-gray-900 dark:text-white">PL 1627</p>
               <p class="mb-1 text-md font-mediumfont-bold text-gray-900 dark:text-white">70211 Kuopio</p>
            </div>
            <!-- Logo -->
            <div class="hidden sm:block sm:w-1/3">
               <a href="https://serveriry.fi/" class="flex items-center justify-center">
                  <ServerLogoRound class="h-48" />
               </a>
            </div>
            <!-- Links -->
            <div class="sm:w-1/3">
               <div class="text-left sm:text-right">
                  <ul class="mb-6 text-md font-medium text-gray-900 dark:text-white mt-10 sm:mt-0">
                     <li v-for="link in links" :key="link.text" class="mb-2">
                        <nuxt-link
                           v-if="link.href[0] === '/'"
                           :to="localePath(link.href)"
                           class="hover:underline"
                           aria-label="link.text"
                        >
                           {{ $t(link.text) }}
                        </nuxt-link>
                        <a v-else :href="link.href" class="hover:underline" :aria-label="$t(link.text)" target="_blank">
                           {{ $t(link.text) }}
                        </a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
         <hr class="my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8" />
         <!-- Lower Footer -->
         <div class="sm:flex sm:items-stretch sm:justify-between">
            <span class="sm:w-1/3" />
            <!-- Server logo (mobile) -->
            <div class="sm:hidden sm:w-1/3">
               <a href="https://serveriry.fi/" class="flex items-center justify-center" aria-label="Etusivu">
                  <ServerLogoRound class="h-32" />
               </a>
            </div>
            <!-- Copyright -->
            <div class="text-sm text-gray-600 text-center dark:text-gray-400 sm:w-1/3 mt-4 sm:mt-0">
               © {{ date }}
               <a href="https://serveriry.fi/" class="hover:underline">Serveri ry</a>
            </div>
            <!-- Social Media-->
            <div class="flex m-6 space-x-6 justify-center sm:justify-end sm:m-0 sm:w-1/3">
               <div v-for="social in socialMedia" :id="social.name" :key="social.name">
                  <FooterSocialMedia :name="social.name" :link="social.link" :icon="social.icon" />
               </div>
            </div>
         </div>
      </div>
   </footer>
</template>

<script setup>
   import ServerLogoRound from '@/components/footer/ServerLogoRound.vue';
   import FooterSocialMedia from '@/components/footer/FooterSocialMedia.vue';

   const links = [
      { text: 'rules-footer', href: '/yhdistys/saannot' },
      { text: 'gdpr', href: '/gdpr' },
      { text: 'tkt', href: 'https://www.uef.fi/fi/koulutus/tietojenkasittelytiede' },
      { text: 'skripti', href: 'https://www.skripti.org/' },
      { text: 'links', href: '/links' },
   ];
   const socialMedia = [
      {
         name: 'Instagram',
         link: 'https://www.instagram.com/serveriry/',
         icon: 'fab fa-instagram',
      },
      {
         name: 'Telegram',
         link: 'https://t.me/serveriry',
         icon: 'fab fa-telegram',
      },
      {
         name: 'Discord',
         link: 'https://discord.gg/TGrgBMTq4s',
         icon: 'fab fa-discord',
      },
      {
         name: 'Linkedin',
         link: 'https://www.linkedin.com/company/serveriry',
         icon: 'fab fa-linkedin',
      },
      {
         name: 'Steam',
         link: 'https://steamcommunity.com/groups/serveriry',
         icon: 'fab fa-steam',
      },
      {
         name: 'Matrix',
         link: 'https://matrix.to/#/!snbPIxozkoFgdhSyzz:matrix.org?via=matrix.org&via=t2bot.io',
         icon: 'fa fa-m',
      },
   ];
</script>

<script>
   export default {
      data() {
         return {
            date: new Date().getFullYear(),
            name: 'CustomFooter',
         };
      },
   };
</script>

<style scoped></style>
