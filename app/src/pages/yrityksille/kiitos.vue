<template class="flex items-center justify-center w-screen sm:h-[80vh]">
   <div class="px-40 mt-40 py-20 bg-white rounded-md sm:shadow-xl bg-zinc-50 dark:bg-zinc-900 px-10">
      <div class="flex flex-col items-center">
         <h1 class="pb-10 font-bold text-custom-blue dark:text-custom-blue text-4xl lg:text-6xl md:text-4xl sm:text-2xl">Kiitos yhteydenotosta!</h1>

         <h6 class="mb-2 text-2xl font-bold text-center text-gray-800 md:text-3xl">
            <span class="text-custom-blue">Otamme teihin yhteyttä mahdollisimman pian</span>
         </h6>

         <p class="mb-8 text-center text-gray-500 md:text-lg"></p>

         <button
            class="px-6 py-2 text-sm font-semibold text-purple-800 dark:text-purple-100 bg-purple-200 dark:bg-custom-blue"
         >
            <nuxt-link href="/">Palaa etusivulle</nuxt-link>
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
