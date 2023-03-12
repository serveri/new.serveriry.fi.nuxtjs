<template>
   <div class="py-20 bg-cover bg-no-repeat bg-fixed bg-[url('/images/serveritoverit.png')] bg-cover h-[400px]">
      <div class="container m-auto text-center px-6 opacity-100">
         <h1 class="text text-4xl font-extrabold text-gray-900 dark:text-gray-900 sm:text-5xl lg:text-6xl pb-2">
            <span class="text-transparent bg-clip-text bg-custom-blue">Serveri ry</span>
         </h1>
         <h3 class="text-xl md:text-2xl mb-8 md:mb-16 dark:text-black">
            Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö
         </h3>
         <nuxt-link to="/opiskelu/tkt" class="py-4">
            <div
               class="py-4 px-8 text-white bg-custom-blue hover:bg-uef-blue rounded-lg text-center uppercase font-bold md:text-xl tracking-wider mx-auto"
               role="button"
               style="width: fit-content"
            >
               {{ $t('what-is-cs-like') }}
            </div>
         </nuxt-link>
      </div>
   </div>
</template>
