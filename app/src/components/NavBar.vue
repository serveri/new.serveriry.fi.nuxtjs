<template>
   <Disclosure v-slot="{ open }" as="nav" class="bg-zinc-50 dark:bg-zinc-900">
      <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
         <div class="relative flex h-20 items-center justify-between">
            <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
               <!-- Mobile menu button-->
               <DisclosureButton
                  class="inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
               >
                  <span class="sr-only">Open main menu</span>
                  <Bars3Icon v-if="!open" class="block h-6 w-6" aria-hidden="true" />
                  <XMarkIcon v-else class="block h-6 w-6" aria-hidden="true" />
               </DisclosureButton>
            </div>
            <div class="flex sm:items-stretch w-full">
               <!-- Server Logo -->
               <div class="flex flex-1 sm:flex-auto items-center justify-center">
                  <div class="hidden h-16 w-auto sm:block">
                     <a href="/">
                        <ServerLogo class="hover:bg-gray-700" />
                     </a>
                  </div>
                  <div class="block h-16 w-auto sm:hidden">
                     <a href="/">
                        <ServerLogo class="hover:bg-gray-700" />
                     </a>
                  </div>
               </div>

               <!-- NavBar Links (defined in script) -->
               <div class="hidden ml-6 lg:ml-24 sm:block w-full">
                  <div class="flex space-x-0 xl:space-x-8 justify-end items-center h-full">
                     <div v-for="item in navigation" :key="item.name">
                        <!-- IF -->
                        <div v-if="item.subMenu">
                           <DropDownMenu :menu="item" />
                        </div>

                        <!-- ELSE -->
                        <div v-else class="relative">
                           <a :href="item.href">
                              <button
                                 :class="[
                                    item.current
                                       ? 'bg-gray-900 text-white'
                                       : 'text-gray-700 dark:text-gray-300 hover:bg-gray-700 hover:text-white',
                                    'px-1 py-1 md:px-3 md:py-2 rounded-md font-medium uppercase md:font-bold text-sm lg:text-lg whitespace-nowrap',
                                 ]"
                                 :aria-current="item.current ? 'page' : undefined"
                              >
                                 {{ item.name }}
                              </button></a
                           >
                        </div>
                     </div>
                     <!-- Ain't rly bug but only one toggle button is updated at time -->

                     <DarkMode id="nav" />
                  </div>
               </div>
            </div>
         </div>
      </div>

      <DisclosurePanel class="sm:hidden">
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
                  <div
                     tabindex="0"
                     :class="[
                        item.current
                           ? 'bg-gray-900 text-white'
                           : 'text-gray-700 dark:text-gray-300 hover:bg-gray-700 hover:text-white',
                        'flex items-center justify-start block px-3 py-2 rounded-md text-base font-medium uppercase whitespace-nowrap cursor-pointer select-none',
                     ]"
                  >
                     {{ item.name }}
                  </div>
               </div>
            </DisclosureButton>
            <DarkMode id="mobile" />
         </div>
      </DisclosurePanel>
   </Disclosure>
</template>

<script setup>
   import { Disclosure, DisclosureButton, DisclosurePanel } from '@headlessui/vue';
   import { Bars3Icon, XMarkIcon } from '@heroicons/vue/24/outline';
   import ServerLogo from '@/components/ServerLogo.vue';

   const navigation = [
      {
         name: 'Yhdistys',
         href: '#Yhdistys',
         current: false,
         subMenu: [
            { name: 'Hallitustoiminta', href: '#' },
            { name: 'Säännöt', href: '#' },
            { name: 'Tapahtumat', href: '#' },
            { name: 'Merch', href: '#' },
            { name: 'Uutiset', href: '#' },
            { name: 'Turvallinen tila', href: '#' },
         ],
      },
      { name: 'Jäseneksi', href: '#Jäseneksi', current: false },
      {
         name: 'Yritysyhteistyö',
         href: '#Yritysyhteistyö',
         current: false,
         subMenu: [
            { name: 'IT-rekry', href: '#' },
            { name: 'Yhteistyökumppanit', href: '#' },
            { name: 'Yhteistyökumppaniksi?', href: '#' },
         ],
      },
      {
         name: 'Opiskelu',
         href: '#Opiskelu',
         current: false,
         subMenu: [
            { name: 'Mitä tietojenkäsittelytiede on?', href: '#' },
            { name: 'Uudelle opiskelijalle', href: '#' },
            { name: 'Läksykerho', href: '#' },
            { name: 'Palaute', href: '#' },
         ],
      },
   ];
</script>

<script>
   import DropDownMenu from '@/components/DropDownMenu.vue';
   import DropDownMobile from '@/components/DropDownMobile.vue';
   import DarkMode from '@/components/DarkMode.vue';

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
