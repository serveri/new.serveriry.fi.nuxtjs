<template class="flex items-center justify-center w-screen sm:h-[80vh]">
   <div class="mt-40 py-20 rounded-md sm:shadow-xl bg-zinc-50 dark:bg-zinc-900 px-10">
      <div class="flex flex-col items-center">
         <h1
            class="pb-8 font-bold text-custom-primary dark:text-custom-primary text-4xl lg:text-6xl md:text-4xl sm:text-2xl"
         >
            {{ $t('thanks-application') }}
         </h1>

         <p class="pb-4">
            {{ $t('we-contact-you-soon') }}
         </p>

         <button
            class="px-6 py-2 text-sm font-semibold text-blue-800 dark:text-blue-100 bg-blue-200 dark:bg-custom-primary"
         >
            <nuxt-link href="/">{{ $t('back-to-frontpage') }}</nuxt-link>
         </button>
      </div>
   </div>
</template>

<script>
   export default {
      name: 'Kiitos',
   };
</script>

<style scoped></style>
