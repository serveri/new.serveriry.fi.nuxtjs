<template>
   <div>
      <Head>
         <Title>{{ $t('title_forms') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text py-2" :source="content[$i18n.locale + '_text']" />
   </div>
   <div class="mb-8">
      <div class="space-y-4 text-center">
         <NuxtLink class="btn-custom-primary" to="https://forms.office.com/e/4kn5NM7M4u">
            {{ $i18n.locale === 'fi' ? 'Periodi palautekysely' : 'Feedback form' }}
            <font-awesome-icon class="ml-4" :icon="['fas', 'arrow-up-right-from-square']" />
         </NuxtLink>
         <div>
            <NuxtLink class="btn-custom-primary" to="/about">
               {{ $i18n.locale === 'fi' ? 'Vappudiplomi lomake' : 'Student Diploma Form' }}
            </NuxtLink>
         </div>
         <div>
            <NuxtLink class="btn-custom-primary" to="/about">
               {{ $i18n.locale === 'fi' ? 'Haalarimerkki ideat' : 'Overall Patch Designs' }}
            </NuxtLink>
         </div>
      </div>
   </div>
   <form class="space-y-8" @submit="submitForm">
      <div>
         <label for="subject" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{
            $t('label_topic')
         }}</label>
         <select
            id="subject"
            v-model="subject"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            required
         >
            <option value="" disabled selected hidden>{{ $t('label_topic') }}</option>
            <option value="diplomi">
               {{ $i18n.locale === 'fi' ? 'Vappudiplomi lomake' : 'Student Diploma Form' }}
            </option>
            <option value="merkkikilpailu">
               {{ $i18n.locale === 'fi' ? 'Haalarimerkki ideat' : 'Overall Patch Designs' }}
            </option>
         </select>
      </div>
      <div v-if="subject">
         <label for="contact" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{
            $t('label_name')
         }}</label>
         <input
            id="contact"
            v-model="person_name"
            type="text"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            placeholder="Sinun nimesi"
         />
      </div>
      <div v-if="subject">
         <label for="contact" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{
            $t('label_contact')
         }}</label>
         <input
            id="contact"
            v-model="person_contact"
            type="text"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            placeholder="Sähköposti tai telegram-käyttäjätunnus"
         />
      </div>
      <div class="sm:col-span-2" v-if="subject">
         <label for="introduction" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">{{
            $t('label_field')
         }}</label>
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
         <label for="skills" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">{{
            $t('label_field')
         }}</label>
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
         <label for="portfolio" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">{{
            $t('label_field')
         }}</label>
         <textarea
            id="portfolio"
            v-model="person_portfolio"
            rows="6"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-sm border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="Github tai muu portfolio"
            required
         ></textarea>
      </div>
      <button type="submit" class="btn-custom-primary">{{ $t('form_button') }}</button>
   </form>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();
   const router = useRouter();

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/forms_page`)) as { data: Data };
      content = data.value.data;
   } catch (e) {
      content = {
         fi_text: '# Kyselylomakkeet',
         en_text: '# Forms',
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
      router.push('/opiskelu/kiitos');

      // Scroll top of page
      window.scrollTo(0, 0);
   }
</script>

<style scoped></style>
