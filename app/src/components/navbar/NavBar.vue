<template>
   <Disclosure v-slot="{ open }" as="nav" class="bg-zinc-50 dark:bg-zinc-900 fixed w-full z-10">
      <div class="px-6 lg:px-16 xl:px-32">
         <div class="relative flex items-center justify-between">
            <!-- Mobile menu button-->
            <div class="absolute inset-y-0 left-0 flex items-center md:hidden">
               <DisclosureButton
                  class="inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
               >
                  <span class="sr-only">Open main menu</span>
                  <Bars3Icon v-if="!open" class="block h-6 w-6" aria-hidden="true" />
                  <XMarkIcon v-else class="block h-6 w-6" aria-hidden="true" />
               </DisclosureButton>
            </div>

            <div class="flex md:items-stretch w-full">
               <!-- Server Logo -->
               <div class="flex flex-1 md:flex-auto items-center justify-center">
                  <!-- Desktop -->
                  <div class="hidden h-20 my-1 w-auto md:block">
                     <nuxt-link :to="localePath('/')">
                        <ServerLogo />
                     </nuxt-link>
                  </div>
                  <!-- Mobile -->
                  <div class="block h-20 my-1 w-auto md:hidden">
                     <nuxt-link :to="localePath('/')">
                        <ServerLogo />
                     </nuxt-link>
                  </div>
               </div>

               <!-- NavBar Links (defined in script) -->
               <div class="hidden md:block w-full">
                  <div class="flex space-x-0 xl:space-x-4 2xl:space-x-8 justify-end items-center h-full">
                     <!--
                     -->
                     <div v-for="item in navigation" :key="item.name">
                        <!-- IF -->
                        <div v-if="item.subMenu">
                           <DropDownMenu :menu="item" />
                        </div>

                        <!-- ELSE -->
                        <div v-else class="relative">
                           <nuxt-link :to="localePath(item.href)" tabindex="-1">
                              <button
                                 :class="[
                                    $route.path === localePath(item.href)
                                       ? 'text-custom-primary'
                                       : 'text-gray-700 dark:text-gray-300',
                                    'nav-link',
                                 ]"
                                 :aria-current="item.current ? 'page' : undefined"
                              >
                                 {{ $t(item.name) }}
                              </button>
                           </nuxt-link>
                        </div>
                     </div>
                     <lang-switcher />
                     <DarkMode id="nav" />
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- Mobile NavBar-->
      <DisclosurePanel class="md:hidden">
         <div class="space-y-3 px-2 pt-2 pb-5">
            <DisclosureButton
               v-for="item in navigation"
               :key="item.name"
               :as="item.subMenu ? 'div' : 'div'"
               :href="item.href"
               :aria-current="item.current ? 'page' : undefined"
            >
               <!-- IF -->
               <div v-if="item.subMenu">
                  <DropDownMobile :menu="item" />
               </div>
               <!-- ELSE -->
               <div v-else class="relative">
                  <nuxt-link
                     :to="localePath(item.href)"
                     tabindex="0"
                     :class="[
                        $route.path === localePath(item.href)
                           ? 'text-custom-primary'
                           : 'text-gray-700 dark:text-gray-300 hover:bg-gray-700 hover:text-white',
                        'flex items-center justify-start block px-3 py-2 rounded-md text-base font-bold uppercase whitespace-nowrap cursor-pointer select-none',
                     ]"
                  >
                     {{ $t(item.name) }}
                  </nuxt-link>
               </div>
            </DisclosureButton>
            <!-- Languages -->
            <lang-switcher />
            <DarkMode id="mobile" />
         </div>
      </DisclosurePanel>
   </Disclosure>
</template>

<script setup>
   import { Disclosure, DisclosureButton, DisclosurePanel } from '@headlessui/vue';
   import { Bars3Icon, XMarkIcon } from '@heroicons/vue/24/outline';
   import ServerLogo from '@/components/navbar/ServerLogo.vue';
   import LangSwitcher from '@/components/navbar/LangSwitcher.vue';

   const navigation = [
      {
         name: 'org',
         href: '/yhdistys',
         current: false,
         subMenu: [
            { name: 'board', href: '/yhdistys/hallitus' },
            { name: 'news', href: '/yhdistys/uutiset' },
            { name: 'events', href: '/yhdistys/tapahtumat' },
            { name: 'merch', href: '/yhdistys/merch' },
            { name: 'history', href: '/yhdistys/historia' },
            { name: 'rules', href: '/yhdistys/saannot' },
            { name: 'safe-space', href: '/yhdistys/turvallinen-tila' },
         ],
      },
      { name: 'join-us', href: '/jaseneksi', current: false },
      {
         name: 'business',
         href: '/yrityksille',
         current: false,
         subMenu: [
            { name: 'it-rekry', href: '/yrityksille/it-rekry' },
            { name: 'partners', href: '/yrityksille/kumppanit' },
            { name: 'collaboration', href: '/yrityksille/yhteistyo' },
         ],
      },
      {
         name: 'study',
         href: '/opiskelu',
         current: false,
         subMenu: [
            { name: 'what-is-cs', href: '/opiskelu/tkt' },
            { name: 'new-student', href: '/opiskelu/fuksille' },
            { name: 'study-club', href: '/opiskelu/laksykerho' },
            { name: 'feedback', href: '/opiskelu/palaute' },
         ],
      },
   ];
</script>

<script>
   import DropDownMenu from '@/components/navbar/dropdown/DropDownMenu.vue';
   import DropDownMobile from '@/components/navbar/dropdown/DropDownMobile.vue';
   import DarkMode from '@/components/navbar/DarkModeToggle.vue';

   export default {
      components: {
         DropDownMenu,
         DropDownMobile,
         DarkMode,
      },
      data() {
         return {
            menu: 'Error occurred',
         };
      },
   };
</script>

<style>
   .nav-link {
      @apply px-1 py-1 md:px-3 md:py-2 text-sm lg:text-lg font-bold uppercase whitespace-nowrap tracking-wide;
   }
   /* underline effect */
   .nav-link:after {
      @apply bg-custom-primary;
      content: '';
      position: absolute;
      width: 100%;
      transform: scaleX(0);
      height: 2px;
      left: 0;
      bottom: 0;
      transform-origin: bottom right;
      transition: transform 0.4s ease-out;
   }
   .nav-link:hover:after {
      transform: scaleX(1);
      transform-origin: bottom left;
   }
</style>
