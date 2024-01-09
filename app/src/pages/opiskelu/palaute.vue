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
            >Yhteystiedot</label
         >
         <input
            v-if="validated"
            id="subject"
            v-model="person_name"
            type="text"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            placeholder="Nimi (valinnainen)"
         />
      </div>
      <div class="sm:col-span-2">
         <label for="message" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400"
            >Vapaamuotoinen viesti</label
         >
         <textarea
            id="message"
            v-model="person_message"
            rows="6"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-sm border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="Kerro vapaamuotoinen palaute."
            required
         ></textarea>
      </div>
      <button type="submit" class="btn-custom-primary">Lähetä viesti</button>
   </form>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();
   const router = useRouter();

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/feedback_page`)) as { data: Data };
      content = data.value.data;
   } catch (e) {
      content = {
         fi_text: '# Palaute',
         en_text: '# Feedback',
      };
   }

   let validated = true;
   let person_name = '';
   let person_message = '';

   async function submitForm(e) {
      e.preventDefault();
      // POST validated form data
      await fetch(config.public['API_URL'] + 'items/feedback', {
         headers: {
            'Content-Type': 'application/json',
         },
         method: 'POST',
         mode: 'cors',
         body: JSON.stringify({
            person_message: person_message,
            person_name: person_name,
         }),
      });
      // Redirect to success page
      router.push('/opiskelu/kiitos');

      // Scroll top of page
      window.scrollTo(0, 0);
   }
</script>

<style scoped></style>
