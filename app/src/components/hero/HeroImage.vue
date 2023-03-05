<template>
   <div class="py-20 bg-cover bg-no-repeat bg-fixed bg-[url('~/assets/images/serveritoverit.png')] bg-cover h-[400px]">
      <div class="container m-auto text-center px-6 opacity-100">
         <h1 class="text text-3xl font-extrabold text-gray-900 dark:text-gray-900 md:text-5xl lg:text-6xl pb-2">
            <span class="text-transparent bg-clip-text bg-gradient-to-r to-emerald-600 from-sky-400">Sereri ry</span>
         </h1>
         <h3 class="text-2xl md:mb-8 dark:text-black">
            Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö
         </h3>
         <nuxt-link to="/opiskelu/tkt">
            <button
               class="my-8 text-white bg-gradient-to-r from-teal-400 via-teal-500 to-teal-600 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-300 dark:focus:ring-teal-800 shadow-lg shadow-teal-500/50 dark:shadow-teal-800/80 rounded-lg text-center mr-2 mb-2 rounded-full uppercase font-bold md:text-xl py-4 px-8 tracking-wider"
            >
               Millaista tietojenkäsittelytiede on?
            </button>
         </nuxt-link>
      </div>
   </div>
</template>
