<template>
   <button
      title="Change page theme between light and dark."
      tabindex="0"
      class="m-6 w-20 h-10 md:h-6 md:w-12 rounded-full bg-gray-200 dark:bg-gray-800 flex items-center transition duration-300 focus:outline-none shadow focus:ring-2"
      @click="switchTheme()"
   >
      <span
         :id="'switch-toggle-' + id.id"
         class="flex justify-center items-center w-12 h-12 md:w-8 md:h-8 relative rounded-full transition duration-500 transform bg-gray-300 -translate-x-2 p-1 text-white"
         ><ClientOnly fallback-tag="span" fallback="">
            <font-awesome-icon :id="'icon-moon-' + id.id" class="hidden" :icon="['fas', 'moon']" />
            <font-awesome-icon
               :id="'icon-sun-' + id.id"
               class="hidden"
               :icon="['fas', 'sun']"
               style="color: rgb(55 65 81)"
            />
         </ClientOnly>
      </span>
   </button>
</template>

<script setup lang="ts">
   import { useDark, useToggle } from '@vueuse/core';
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
   import { nextTick, onMounted } from 'vue';

   const id = defineProps({
      id: {
         type: String,
         default: 'Default',
         required: true,
      },
   });

   const isDark = useDark();
   const toggleDark = useToggle(isDark);

   function switchTheme() {
      toggleDark();
      toggleButton();
   }

   function toggleButton() {
      // There are two theme toggle, they need to have separate ID's
      const switchToggle: HTMLElement | null = document.getElementById(`switch-toggle-${id.id}`);
      const iconSun: HTMLElement | null = document.getElementById(`icon-sun-${id.id}`);
      const iconMoon: HTMLElement | null = document.getElementById(`icon-moon-${id.id}`);

      if (isDark.value) {
         light(switchToggle, iconSun, iconMoon);
      } else {
         dark(switchToggle, iconSun, iconMoon);
      }
   }

   function dark(switchToggle: HTMLElement | null, iconSun: HTMLElement | null, iconMoon: HTMLElement | null) {
      switchToggle?.classList.add('bg-gray-300', '-translate-x-2');
      switchToggle?.classList.remove('bg-gray-700', 'translate-x-full');
      iconSun?.classList.remove('hidden');
      iconMoon?.classList.add('hidden');
   }
   function light(switchToggle: HTMLElement | null, iconSun: HTMLElement | null, iconMoon: HTMLElement | null) {
      switchToggle?.classList.remove('bg-gray-300', '-translate-x-2');
      switchToggle?.classList.add('bg-gray-700', 'translate-x-full');
      iconSun?.classList.add('hidden');
      iconMoon?.classList.remove('hidden');
   }
   onMounted(() => {
      nextTick(function () {
         toggleButton();
      });
   });
</script>

<script lang="ts">
   export default {
      name: 'DarkMode',
   };
</script>
