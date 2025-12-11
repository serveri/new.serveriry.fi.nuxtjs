<template>
   <div
      class="py-20 bg-no-repeat bg-fixed bg-cover w-screen h-96 md:h-[40rem]"
      :style="{ backgroundImage: `url(${heroBg})` }"
   >
      <div class="flex w-full justify-center text-center absolute">
         <div>
            <h1 class="text text-5xl font-extrabold text-gray-900 dark:text-gray-900 sm:text-6xl lg:text-8xl pb-2">
               <span class="text-transparent bg-clip-text bg-custom-primary">
                  {{ content[$i18n.locale + '_title'] }}
               </span>
            </h1>
            <h2 class="text-xl md:text-2xl mb-8 md:mb-16" style="color: black !important">
               {{ content[$i18n.locale + '_description'] }}
            </h2>
            <nuxt-link :to="content[$i18n.locale + '_button_url']" class="py-4">
               <div
                  class="p-3 sm:py-4 sm:px-6 text-white bg-custom-primary hover:bg-custom-secondary rounded-lg text-center uppercase font-bold md:text-lg tracking-wider mx-auto"
                  role="button"
                  style="width: fit-content"
               >
                  {{ content[$i18n.locale + '_button_text'] }}
               </div>
            </nuxt-link>
         </div>
      </div>
      <!-- curve -->
      <div class="flex items-end h-80 md:h-144">
         <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
            <path
               class="fill-white dark:fill-zinc-800 transition-colors duration-300"
               fill-opacity="1"
               d="M0,224L60,218.7C120,213,240,203,360,197.3C480,192,600,192,720,192C840,192,960,192,1080,181.3C1200,171,1320,149,1380,138.7L1440,128L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"
            ></path>
         </svg>
      </div>
   </div>
</template>

<script setup>
   import { computed } from 'vue';
   const props = defineProps({
      content: {
         type: Object,
         required: true,
      },
   });
   const content = computed(() => props.content);
   const heroBg = 'https://api.serveriry.fi/assets/04ca26d6-a4e9-462f-a9f9-bda57a660192';
</script>
