<template>
   <div class="p-4 pb-16 mx-auto max-w-screen-md">
      <h2 class="custom-page-title">{{ $t('contact-us') }}</h2>
      <p class="mb-8 lg:mb-16 font-light text-center text-gray-500 dark:text-gray-400 sm:text-xl">
         Haluaisitko sinä tai yriyksesi tukea serverin toimintaa ja saada näkyvyyttä opiskelijoiden keskuudessa
         esimerkiksi tapahtumissa ja somessa?
      </p>
      <form onsubmit="alert('This website is demo')" class="space-y-8">
         <div>
            <label for="subject" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
               >Yrityksen nimi</label
            >
            <input
               id="subject"
               type="text"
               class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
               placeholder="OY yritys AB"
               required
            />
         </div>
         <div>
            <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
               >Organisaationne nimeämän yhteyshenkilön sähköposti</label
            >
            <input
               id="email"
               type="email"
               class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
               placeholder="name@example.com"
               required
            />
         </div>
         <div class="sm:col-span-2">
            <label for="message" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400"
               >Vapaamuotoinen viesti</label
            >
            <textarea
               id="message"
               rows="6"
               class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-sm border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
               placeholder="Millaista yhteistyöta haluaisitte tehdä?"
            ></textarea>
         </div>
         <button type="submit" class="btn-custom-blue">Lähetä viesti</button>
      </form>
   </div>
</template>

<script>
   export default {
      name: 'ContactFormBusiness',
   };
</script>

<style scoped></style>
