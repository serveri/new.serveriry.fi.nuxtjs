<template>
   <div class="flex items-center justify-center w-screen sm:h-[80vh]">
      <div class="px-40 py-20 bg-white rounded-md sm:shadow-xl bg-zinc-50 dark:bg-zinc-900">
         <div class="flex flex-col items-center">
            <h1 class="font-bold text-blue-600 dark:text-blue-600 text-9xl">{{ error.error.statusCode }}</h1>

            <h6 class="mb-2 text-2xl font-bold text-center text-gray-800 md:text-3xl">
               <span class="text-red-500">Hupsista!</span> Sivua ei löytynyt.
            </h6>

            <p class="mb-8 text-center text-gray-500 md:text-lg">
               Etsimäsi sivu saattaa olla poistettu. Kirjoititko osoitteen oikein?
            </p>

            <button
               class="px-6 py-2 text-sm font-semibold text-blue-800 dark:text-blue-100 bg-blue-200 dark:bg-blue-800"
               @click="handleError"
            >
               Etusivulle
            </button>
         </div>
      </div>
   </div>
</template>

<script setup>
   const error = defineProps({
      error: {
         type: Object,
         required: true,
      },
      handleError: {
         type: Object,
         required: true,
      },
   });
</script>

<style scoped></style>
