<template>
   <!-- Profile dropdown -->
   <Menu as="div" class="relative">
      <MenuButton>
         <!--        :to="localePath(menu.href)"-->
         <nuxt-link
            :class="[
               menu.current
                  ? 'bg-gray-900 text-white'
                  : 'text-gray-700 dark:text-gray-300 dark:hover:bg-gray-700 hover:outline dark:hover:outline-none outline-2 dark:hover:text-white hover:text-blue-500',
               'flex items-center justify-between px-1 py-1 md:px-3 md:py-2 rounded-md font-medium uppercase md:font-bold text-sm lg:text-lg whitespace-nowrap',
            ]"
            :aria-current="menu.current ? 'page' : undefined"
         >
            {{ $t(menu.name) }}
            <DropDownArrow />
         </nuxt-link>
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
            class="absolute right-0 z-10 mt-2 min-w-max origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none whitespace-nowrap dark:bg-[#282828]"
         >
            <MenuItem v-for="subMenu in menu.subMenu" v-slot="{ active }" :key="subMenu.name">
               <nuxt-link
                  :to="localePath(subMenu.href)"
                  :class="[
                     active ? 'bg-gray-100 dark:outline dark:outline-1' : '',
                     'my-custom-one block px-4 py-2 text-sm text-gray-700 dark:text-gray-200 dark:hover:bg-gray-600 dark:hover:outline-none dark:even:bg-[#202020] dark:odd:bg-[#282828]',
                  ]"
                  tabindex="1"
                  >{{ $t(subMenu.name) }}</nuxt-link
               >
            </MenuItem>
         </MenuItems>
      </transition>
   </Menu>
</template>

<script setup>
   import { Menu, MenuButton, MenuItem, MenuItems } from '@headlessui/vue';
   import DropDownArrow from '@/components/navbar/DropDownArrow.vue';
</script>

<script>
   export default {
      name: 'DropDownMenu',
      props: {
         // eslint-disable-next-line vue/require-default-prop
         menu: Object,
      },
   };
</script>

<style scoped></style>
