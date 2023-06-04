<template>
   <div class="p-4 pb-16 mx-auto max-w-screen-md">
      <h2 class="custom-page-title">{{ $t('contact-us') }}</h2>
      <p class="mb-8 lg:mb-16 text-center paragraph">
         Haluaisitko sinä tai yrityksesi tukea Serveri Ry:n toimintaa ja saada näkyvyyttä opiskelijoiden keskuudessa
         esimerkiksi tapahtumissa ja somessa?
      </p>
      <form class="space-y-8" @submit="submitForm">
         <div>
            <label for="subject" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
               >Yrityksen nimi</label
            >
            <input
               v-if="validated"
               id="subject"
               v-model="firm_name"
               type="text"
               class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
               placeholder="OY yritys AB"
               required
            />
            <!-- <input
               v-else
               v-model="firm_name"
               type="text"
               id="username-error"
               class="bg-red-50 border border-red-500 text-red-900 placeholder-red-700 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-full p-2.5 dark:bg-red-100 dark:border-red-400"
            /> -->
         </div>
         <div>
            <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
               >Organisaationne nimeämän yhteyshenkilön sähköposti</label
            >
            <input
               id="email"
               v-model="firm_contact"
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
               v-model="firm_message"
               rows="6"
               class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-sm border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
               placeholder="Millaista yhteistyöta haluaisitte tehdä?"
            ></textarea>
         </div>
         <button type="submit" class="btn-custom-primary">Lähetä viesti</button>
      </form>
   </div>
</template>

<script setup>
   let validated = true;
   let firm_name = '';
   let firm_contact = '';
   let firm_message = '';

   const router = useRouter();

   async function submitForm(e) {
      e.preventDefault();
      // POST validated form data
      await fetch('https://api.serveri.jeb4.dev/items/lomake_vastaukset', {
         headers: {
            'Content-Type': 'application/json',
         },
         method: 'POST',
         mode: 'cors',
         body: JSON.stringify({
            firm_message: firm_message,
            firm_contact: firm_contact,
            firm_name: firm_name,
         }),
      });
      // Redirect to success page
      router.push('/yrityksille/kiitos');

      // Scroll top of page
      window.scrollTo(0, 0);
   }
</script>

<style scoped></style>
