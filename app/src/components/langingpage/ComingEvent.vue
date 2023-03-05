<template>
   <div class="max-w-sm p-3">
      <h3 class="text-2xl font-bold tracking-tight text-gray-900 dark:text-white">{{ event.title }}</h3>
      <p class="mb-3 font-light text-gray-400 dark:text-gray-400">
         {{ event.time.toLocaleDateString($i18n.locale, DateOptions) }}
      </p>
      <nuxt-link
         :to="event.link"
         class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-server-blue rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
      >
         Lue lisää
         <svg
            aria-hidden="true"
            class="w-4 h-4 ml-2 -mr-1"
            fill="currentColor"
            viewBox="0 0 20 20"
            xmlns="http://www.w3.org/2000/svg"
         >
            <path
               fill-rule="evenodd"
               d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
               clip-rule="evenodd"
            ></path>
         </svg>
      </nuxt-link>
   </div>
</template>

<script setup lang="ts">
   const event = defineProps({
      title: {
         type: String,
         default: 'Default Title',
         required: true,
      },
      time: {
         type: Date,
         default: new Date('01/01/1970'),
         required: true,
      },
      link: {
         type: String,
         default: '#event',
         required: true,
      },
   });
   const DateOptions = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
</script>

<script lang="ts">
   export default {
      name: 'ComingEvent',
   };
</script>

<style scoped></style>
