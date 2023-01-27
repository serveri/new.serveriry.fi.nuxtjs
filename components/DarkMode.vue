<template>
    <button
        title="Change page theme between light and dark."
        tabindex="0"
        class="m-4 w-20 h-10 rounded-full bg-yellow-100 dark:bg-gray-800 flex items-center transition duration-300 focus:outline-none shadow focus:ring-2"
        @click="switchTheme()"
    >
        <span
            :id="'switch-toggle-' + id.id"
            class="flex justify-center items-center w-12 h-12 relative rounded-full transition duration-500 transform bg-yellow-500 -translate-x-2 p-1 text-white"
        >
            <font-awesome-icon
                :id="'icon-sun-' + id.id"
                class="hidden"
                icon="fa-solid fa-sun"
            />
            <font-awesome-icon
                :id="'icon-moon-' + id.id"
                class="hidden"
                icon="fa-solid fa-moon"
            />
        </span>
    </button>
</template>

<script setup>
    import { useDark, useToggle } from '@vueuse/core';
    import { onMounted } from 'vue';

    const id = defineProps({
        // eslint-disable-next-line vue/require-default-prop
        id: String,
    });

    const isDark = useDark();
    const toggleDark = useToggle(isDark);

    function switchTheme() {
        toggleDark();
        toggleButton();
    }
    function toggleButton() {
        // There are two theme toggle, they need to have separate ID's
        const switchToggle = document.getElementById(`switch-toggle-${id.id}`);
        const iconSun = document.getElementById(`icon-sun-${id.id}`);
        const iconMoon = document.getElementById(`icon-moon-${id.id}`);
        // if isDark._value is undef, isDark._value = bool if class list contains dark
        const light =
            isDark._value === undefined
                ? document.documentElement.classList.contains('dark')
                : isDark._value;

        if (light) {
            switchToggle.classList.remove('bg-yellow-500', '-translate-x-2');
            switchToggle.classList.add('bg-gray-700', 'translate-x-full');
            iconSun.classList.add('hidden');
            iconMoon.classList.remove('hidden');
        } else {
            switchToggle.classList.add('bg-yellow-500', '-translate-x-2');
            switchToggle.classList.remove('bg-gray-700', 'translate-x-full');
            iconSun.classList.remove('hidden');
            iconMoon.classList.add('hidden');
        }
    }

    onMounted(() => {
        toggleButton();
    });
</script>

<script>
    export default {
        name: 'DarkMode',
    };
</script>
