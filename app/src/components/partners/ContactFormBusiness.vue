<template>
   <div class="p-4 pb-16 mx-auto max-w-screen-md">
      <h2 class="custom-page-title">{{ $t('contact-us') }}</h2>
      <p class="mb-8 lg:mb-16 text-center paragraph">
         Haluaisitko sinä tai yrityksesi tukea Serveri Ry:n toimintaa ja saada näkyvyyttä opiskelijoiden keskuudessa
         esimerkiksi tapahtumissa ja somessa?
      </p>
      <form class="space-y-8">
         <div>
            <label for="subject" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
               >Yrityksen nimi</label
            >
            <input
               id="subject"
               v-model="firm_name"
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
         <button type="submit" class="btn-custom-primary" @click="submitForm">Lähetä viesti</button>
      </form>
   </div>
</template>

<script>
   export default {
      data() {
         return {
            firm_name: this.firm_name,
            firm_contact: this.firm_contact,
            firm_message: this.firm_message,
         };
      },

      async submit() {
         this.user = await this.submitForm();
      },

      methods: {
         async submitForm(e) {
            e.preventDefault();
            await fetch('https://api.serveri.jeb4.dev/items/lomake_vastaukset', {
               headers: {
                  'Content-Type': 'application/json',
               },
               method: 'POST',
               mode: 'cors',
               body: JSON.stringify({
                  firm_message: this.firm_message,
                  firm_contact: this.firm_contact,
                  firm_name: this.firm_name,
               }),
            });
            // Redirect to success page
            this.$router.push('/yrityksille/kiitos');
         },
      },
   };
</script>

<style scoped></style>
