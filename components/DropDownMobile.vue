<template>
    <!-- Dropdown -->
    <Menu as="div" class="relative">
        <MenuButton
            :class="[
                menu.current
                    ? 'bg-gray-900 text-white'
                    : 'text-gray-700 dark:text-gray-300 hover:bg-gray-700 hover:text-white',
                'flex items-center justify-start block px-3 py-2 rounded-md text-base font-medium uppercase whitespace-nowrap w-full',
            ]"
            :aria-current="menu.current ? 'page' : undefined"
        >
            {{ menu.name }}
            <DropDownArrow />
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
                class="absolute right-0 z-10 mt-2 w-full origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none whitespace-nowrap bg-transparent"
            >
                <MenuItem
                    v-for="subMenu in menu.subMenu"
                    v-slot="{ active }"
                    :key="subMenu.name"
                >
                    <a
                        href="#"
                        :class="[
                            active ? 'bg-neutral-100' : '',
                            'block px-4 py-2 text-sm text-left text-black hover:bg-zinc-600 hover:text-white even:bg-zinc-200 odd:bg-zinc-50   dark:text-gray-200 dark:hover:bg-gray-600 dark:hover:text-white dark:even:bg-zinc-800 dark:odd:bg-zinc-700',
                        ]"
                        >{{ subMenu.name }}</a
                    >
                </MenuItem>
            </MenuItems>
        </transition>
    </Menu>
</template>

<script setup>
    import { Menu, MenuButton, MenuItem, MenuItems } from '@headlessui/vue';
    import DropDownArrow from '@/components/DropDownArrow.vue';
</script>

<script>
    export default {
        name: 'DropDownMobile',
        props: {
            // eslint-disable-next-line vue/require-default-prop
            menu: Object,
        },
    };
</script>

<style scoped></style>
