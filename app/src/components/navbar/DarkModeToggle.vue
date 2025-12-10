<template>
   <button
      title="Change page theme between light and dark."
      tabindex="0"
      class="m-6 w-20 h-10 md:h-6 md:w-12 rounded-full bg-gray-200 dark:bg-gray-800 flex items-center transition duration-300 focus:outline-hidden shadow-sm focus:ring-2"
      @click="onToggle"
   >
      <span
         :id="`switch-toggle-${props.id}`"
         :class="knobClass"
      >
         <client-only fallback-tag="span" fallback="">
            <FontAwesomeIcon v-if="isDark" :id="`icon-moon-${props.id}`" :icon="['fas', 'moon']" class="text-white" />
            <FontAwesomeIcon v-else :id="`icon-sun-${props.id}`" :icon="['fas', 'sun']" class="text-gray-700" />
         </client-only>
      </span>
   </button>
</template>

<script setup lang="ts">
   import { useDark, useToggle } from '@vueuse/core';
   import { computed } from 'vue';
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

   const props = defineProps<{ id: string }>();

   const isDark = useDark({
      selector: 'html',
      attribute: 'class',
      valueDark: 'dark',
      valueLight: '',
      storageKey: 'color-scheme',
   });
   const toggleDark = useToggle(isDark);

   // Default to light on the server to keep SSR/CSR markup consistent
   const knobClass = computed(() => [
      'flex justify-center items-center w-12 h-12 md:w-8 md:h-8 relative rounded-full transition duration-500 transform p-1',
      typeof window !== 'undefined' && isDark.value ? 'bg-gray-700 translate-x-full' : 'bg-gray-300 -translate-x-2',
   ]);

   function onToggle() {
      toggleDark();
      if (typeof document !== 'undefined') {
         const expires = new Date('2040-01-01T12:00:00Z').toUTCString();
         const val = isDark.value ? 'dark' : 'light';
         document.cookie = `color-scheme=${val}; expires=${expires}; path=/;`;
      }
   }
</script>

<script lang="ts">
   export default {
      name: 'DarkMode',
   };
</script>
