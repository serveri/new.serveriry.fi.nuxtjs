<template>
   <div class="max-w-sm px-3 py-2">
      <nuxt-link :to="event.link" class="hover:underline">
         <h3 class="text-2xl font-bold tracking-tight text-gray-900 dark:text-white">{{ event.title }}</h3>
      </nuxt-link>
      <p class="font-light text-gray-400 dark:text-gray-400">
         {{ event.time.toLocaleDateString($i18n.locale, DateOptions) }}
      </p>
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
