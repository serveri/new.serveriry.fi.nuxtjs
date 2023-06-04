<template>
   <div class="flex items-center justify-center w-screen sm:h-[80vh]">
      <div class="px-40 py-20 rounded-md sm:shadow-xl bg-zinc-50 dark:bg-zinc-900">
         <div class="flex flex-col items-center">
            <h1 class="font-bold text-custom-primary dark:text-custom-primary text-9xl">
               {{ error.error.statusCode }}
            </h1>

            <h6 class="mb-2 text-2xl font-bold text-center text-gray-800 md:text-3xl">
               <span class="text-custom-primary">{{ $t('404_oops') }}</span> {{ $t('404_msg') }}
            </h6>

            <p class="mb-8 text-center text-gray-500 md:text-lg">
               {{ $t('404_msg_long') }}
            </p>

            <button
               class="px-6 py-2 text-sm font-semibold text-blue-800 dark:text-blue-100 bg-blue-200 dark:bg-custom-primary"
               @click="handleError"
            >
               {{ $t('404_btn') }}
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
         type: Function,
         required: true,
      },
   });
</script>

<style scoped></style>
