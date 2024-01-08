<template>
   <div>
      <Head>
         <Title>{{ $t('title_feedback') }} - Serveri ry</Title>
      </Head>

      <vue-markdown class="rich-text py-2" :source="content[$i18n.locale + '_text']" />
   </div>

   <form class="space-y-8" @submit="submitForm">
      <div>
         <label for="subject" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >Hakemuksen aihe</label
         >
         <select
            id="subject"
            v-model="subject"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            required
         >
            <option value="" disabled selected hidden>Valitse aihe</option>
            <option value="yllapito">Järjestelmätoimikunta</option>
            <option value="tapahtuma">Tapahtumatoimikunta</option>
            <option value="koppi">Koppitoimikunta</option>
         </select>
      </div>
      <div v-if="subject">
         <label for="contact" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Nimi</label>
         <input
            id="contact"
            v-model="person_name"
            type="text"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            placeholder="Sinun nimesi"
         />
      </div>
      <div v-if="subject">
         <label for="contact" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >Yhteystiedot</label
         >
         <input
            id="contact"
            v-model="person_contact"
            type="text"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            placeholder="Sähköposti tai telegram-käyttäjätunnus"
         />
      </div>
      <div class="sm:col-span-2" v-if="subject">
         <label for="introduction" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400"
            >Vapaamuotoinen kenttä</label
         >
         <textarea
            id="introduction"
            v-model="person_info"
            rows="6"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-sm border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="Esittele itsesi ja kerro mitä haluaisit tehdä toimikunnassa."
            required
         ></textarea>
      </div>
      <div v-if="subject === 'yllapito'" class="sm:col-span-2">
         <label for="skills" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400"
            >Vapaamuotoinen kenttä</label
         >
         <textarea
            id="skills"
            v-model="person_skills"
            rows="6"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-sm border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="Esittele itsesi ja kerro mitä haluaisit tehdä toimikunnassa. Onko sinulla kokemusta vastaavista tehtävistä? Mikä sinua kiinnostaa?"
            required
         ></textarea>
      </div>
      <div v-if="subject === 'yllapito'" class="sm:col-span-2">
         <label for="portfolio" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400"
            >Vapaamuotoinen kenttä</label
         >
         <textarea
            id="portfolio"
            v-model="person_portfolio"
            rows="6"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-sm border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="Github tai muu portfolio"
            required
         ></textarea>
      </div>
      <button type="submit" class="btn-custom-primary">Lähetä hakemus</button>
   </form>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import { Data } from '@/app.vue';
   const config = useRuntimeConfig();
   const router = useRouter();

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/toimikunta`)) as { data: Data };
      content = data.value.data;
   } catch (e) {
      content = {
         fi_text: '# Hakemukset\nSisältöä ei voitu ladata.',
         en_text: '# Applications\nContent could not be loaded.',
      };
   }

   const subject = ref('');
   const person_name = ref('');
   const person_contact = ref('');
   const person_info = ref('');
   const person_skills = ref('');
   const person_portfolio = ref('');

   async function submitForm(e) {
      e.preventDefault();
      // POST validated form data
      await fetch(config.public['API_URL'] + 'items/toimikuntahakemukset', {
         headers: {
            'Content-Type': 'application/json',
         },
         method: 'POST',
         mode: 'cors',
         body: JSON.stringify({
            subject: subject.value,
            person_name: person_name.value,
            person_contact: person_contact.value,
            person_info: person_info.value,
            skills: person_skills.value,
            portfolio: person_portfolio.value,
         }),
      });
      // Redirect to success page
      router.push('/opiskelu/kiitos_hakemus');

      // Scroll top of page
      window.scrollTo(0, 0);
   }
</script>

<style scoped></style>
