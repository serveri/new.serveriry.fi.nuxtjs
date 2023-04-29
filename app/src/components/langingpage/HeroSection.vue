<template>
   <div
      class="py-20 bg-cover bg-no-repeat bg-fixed bg-[url('/images/serveritoverit.png')] bg-cover w-screen h-96 md:h-[40rem]"
   >
      <!-- content -->

      <div class="flex w-full justify-center text-center absolute">
         <div>
            <h1 class="text text-5xl font-extrabold text-gray-900 dark:text-gray-900 sm:text-6xl lg:text-8xl pb-2">
               <span class="text-transparent bg-clip-text bg-custom-blue">
                  {{ content[$i18n.locale + '_title'] }}
               </span>
            </h1>
            <h3 class="text-xl md:text-2xl mb-8 md:mb-16 dark:text-black">
               {{ content[$i18n.locale + '_description'] }}
            </h3>
            <nuxt-link :to="content[$i18n.locale + '_button_url']" class="py-4">
               <div
                  class="p-3 sm:py-4 sm:px-6 text-white bg-custom-blue hover:bg-uef-blue rounded-lg text-center uppercase font-bold md:text-lg tracking-wider mx-auto"
                  role="button"
                  style="width: fit-content"
               >
                  {{ content[$i18n.locale + '_button_text'] }}
               </div>
            </nuxt-link>
         </div>
      </div>
      <!-- curve -->
      <div class="flex items-end h-80 md:h-[36rem]">
         <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
            <path
               fill-opacity="1"
               d="M0,224L60,218.7C120,213,240,203,360,197.3C480,192,600,192,720,192C840,192,960,192,1080,181.3C1200,171,1320,149,1380,138.7L1440,128L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"
            ></path>
         </svg>
      </div>
   </div>
</template>

<script setup>
   const data = defineProps({
      content: {
         type: Object,
         required: true,
      },
   });
   const content = data.content;
</script>

<style scoped>
   svg {
      @apply fill-white dark:fill-zinc-800;
   }
</style>
