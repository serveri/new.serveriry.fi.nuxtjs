<template>
   <!-- Profile dropdown -->
   <Menu as="div" class="relative">
      <MenuButton>
         <!-- I am sorry for this purkka koodi -->
         <div
            :class="[
               route.path.split('/').slice(-2)[0] === localePath(props.menu.href).split('/').slice(-1)[0]
                  ? 'text-custom-primary dark:text-custom-secondary-dark'
                  : 'text-gray-700 dark:text-gray-300',
               'nav-link',
            ]"
            :aria-current="props.menu.current ? 'page' : undefined"
         >
            {{ t(props.menu.name) }}
            <DropDownArrow />
         </div>
      </MenuButton>
      <transition
         enter-active-class="transition ease-out duration-100"
         enter-from-class="transform opacity-0 scale-95"
         enter-to-class="transform opacity-100 scale-100"
         leave-active-class="transition ease-in duration-75"
         leave-from-class="transform opacity-100 scale-100"
         leave-to-class="transform opacity-0 scale-95"
      >
         <MenuItems
            class="absolute px-1 py-1 md:px-6 md:py-2 md:pb-4 right-0 z-10 mt-2 min-w-max origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-hidden whitespace-nowrap dark:bg-[#282828]"
         >
            <MenuItem v-for="subMenu in props.menu.subMenu" :key="subMenu.name" v-slot="{ close }">
               <nuxt-link
                  :to="localePath(subMenu.href)"
                  :class="[
                     route.path === localePath(subMenu.href)
                        ? 'text-custom-primary dark:text-custom-secondary-dark'
                        : 'text-gray-700 dark:text-gray-200',
                     'nav-link-parent',
                  ]"
               >
                  <span class="nav-dropdown-link" tabindex="1" @click="close">
                     {{ t(subMenu.name) }}
                  </span>
               </nuxt-link>
            </MenuItem>
         </MenuItems>
      </transition>
   </Menu>
</template>

<script setup lang="ts">
   import { Menu, MenuButton, MenuItem, MenuItems } from '@headlessui/vue';
   import { useI18n, useLocalePath } from '#i18n';
   import { useRoute } from 'vue-router';
   import DropDownArrow from '@/components/navbar/dropdown/DropDownArrow.vue';

   const { t } = useI18n();
   const localePath = useLocalePath();
   const route = useRoute();

   const props = defineProps<{
      menu: {
         href: string;
         current?: boolean;
         name: string;
         subMenu: Array<{ name: string; href: string }>;
      };
   }>();
</script>

<style>
   @reference "tailwindcss";
   @config '../../../../tailwind.config.js';
   .nav-link {
      @apply flex items-center justify-between font-medium text-sm lg:text-lg md:font-bold uppercase whitespace-nowrap tracking-wide;
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

   .nav-dropdown-link {
      @apply flex items-center px-4 py-2 text-sm tracking-wider;
      border-bottom: 0.2em transparent solid;
      padding: 0.5rem 0 0 0;
      width: 100%;
      height: 3rem;
      letter-spacing: 0.025em;
   }
   /* underline effect */
   .nav-link-parent:hover .nav-dropdown-link {
      @apply border-b-custom-primary;
      transition: border-bottom-color 0.5s ease-out;
   }
</style>
