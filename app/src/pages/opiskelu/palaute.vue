<template>
   <div>
      <Head>
         <Title>{{ $t('title_feedback') }} - Serveri ry</Title>
      </Head>

      <vue-markdown class="rich-text py-2" :source="content[$i18n.locale + '_text']" />
   </div>

   <form class="space-y-8" @submit.prevent="submitForm">
      <div>
         <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{
            $t('label_name_optional')
         }}</label>
         <input
            id="name"
            v-model="person_name"
            type="text"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-xs focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            :placeholder="$t('placeholder_name_optional')"
         />
      </div>
      <div class="sm:col-span-2">
         <label for="message" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">{{
            $t('label_message_feedback')
         }}</label>
         <textarea
            id="message"
            v-model="person_message"
            rows="6"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-xs border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            :placeholder="$t('placeholder_feedback')"
            required
         ></textarea>
      </div>
      <button type="submit" class="btn-custom-primary">{{ $t('form_button_feedback') }}</button>
   </form>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();
   const router = useRouter();
   const localePath = useLocalePath();

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/feedback_page`)) as { data: Data };
      content = data.value.data;
   } catch {
      content = {
         fi_text: '# Palaute',
         en_text: '# Feedback',
      };
   }

   const person_name = ref('');
   const person_message = ref('');

   async function submitForm() {
      // POST validated form data
      await fetch(config.public['API_URL'] + 'items/feedback', {
         headers: {
            'Content-Type': 'application/json',
         },
         method: 'POST',
         mode: 'cors',
         body: JSON.stringify({
            person_message: person_message.value,
            person_name: person_name.value,
         }),
      });
      // Redirect to success page
      router.push(localePath('/opiskelu/kiitos'));

      // Scroll top of page
      window.scrollTo(0, 0);
   }
</script>
