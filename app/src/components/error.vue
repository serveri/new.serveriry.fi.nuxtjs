<template>
   <div class="flex items-center justify-center w-screen sm:h-[80vh] mt-8">
      <div class="px-40 py-20 rounded-md sm:shadow-xl bg-zinc-50 dark:bg-zinc-900">
         <div class="flex flex-col items-center">
            <h1 class="font-bold text-custom-primary dark:text-custom-primary text-9xl">
               {{ error.error.statusCode }}
            </h1>

            <div v-if="error.error.statusCode === 404">
               <h6 class="mb-2 text-2xl font-bold text-center text-gray-800 md:text-3xl">
                  <span class="text-custom-primary">{{ $t('oops') }}</span> {{ $t('404_msg') }}
               </h6>

               <p class="mb-8 text-center text-gray-500 md:text-lg">
                  {{ $t('404_msg_long') }}
               </p>
            </div>
            <div v-else-if="error.error.statusCode === 500">
               <h6 class="mb-2 text-2xl font-bold text-center text-gray-800 md:text-3xl">
                  <span class="text-custom-primary">{{ $t('oops') }}</span> {{ $t('500_msg') }}
               </h6>

               <p class="mb-8 text-center text-gray-500 md:text-lg">
                  {{ error.error.statusCode === 500 ? $t('500_msg_long') : error.error.message }}
               </p>
            </div>
            <div v-else>
               <h6 class="mb-2 text-2xl font-bold text-center text-gray-800 md:text-3xl">
                  <span class="text-custom-primary">{{ $t('oops') }}</span> {{ $t('xxx_msg') }}
               </h6>

               <p class="mb-8 text-center text-gray-500 md:text-lg">
                  {{ error.error.statusCode === 500 ? $t('xxx_msg_long') : error.error.message }}
               </p>
            </div>

            <button
               class="px-6 py-2 text-sm font-semibold text-blue-800 dark:text-blue-100 bg-blue-200 dark:bg-custom-primary"
               @click="handleError"
            >
               {{ $t('back_to_home') }}
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
