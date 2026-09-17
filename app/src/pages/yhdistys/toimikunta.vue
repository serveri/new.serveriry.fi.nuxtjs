<template>
   <div>
      <Head>
         <Title>{{ $t('title_committee') }} - Serveri ry</Title>
         <Meta
            name="description"
            content="Haluatko vaikuttaa Serverin toimintaan matalalla kynnnyksellä? Toimikunnat ovat hyvä mahdollisuus tähän. Hae mukaan jo tänään!"
         />
      </Head>

      <MarkdownView class="rich-text py-2" :source="content[$i18n.locale + '_text']" />
   </div>

   <form class="space-y-8" @submit.prevent="submitForm">
      <div>
         <label for="subject" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{
            $t('label_topic')
         }}</label>
         <select
            id="subject"
            ref="subjectSelect"
            v-model="subject"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-xs focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            required
            @change="onSubjectChange"
         >
            <option value="" disabled selected hidden>{{ $t('select_committee') }}</option>
            <option
               value="yllapito"
               :disabled="!isCommitteeOpen('jarjestelmatk_true')"
               :hidden="!isCommitteeOpen('jarjestelmatk_true')"
            >
               {{ $t('option_it_committee') }}
            </option>
            <option
               value="tapahtuma"
               :disabled="!isCommitteeOpen('tapahtumatk_true')"
               :hidden="!isCommitteeOpen('tapahtumatk_true')"
            >
               {{ $t('option_event_committee') }}
            </option>
            <option
               value="koppi"
               :disabled="!isCommitteeOpen('koppitk_true')"
               :hidden="!isCommitteeOpen('koppitk_true')"
            >
               {{ $t('option_koppi_committee') }}
            </option>
         </select>
      </div>
      <div v-if="subject">
         <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{
            $t('label_name')
         }}</label>
         <input
            id="name"
            v-model="person_name"
            type="text"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-xs focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            :placeholder="$t('placeholder_name')"
            required
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
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-xs focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            :placeholder="$t('placeholder_contact')"
            required
         />
      </div>
      <div v-if="subject" class="sm:col-span-2">
         <label for="introduction" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">{{
            $t('label_about_you')
         }}</label>
         <textarea
            id="introduction"
            v-model="person_info"
            rows="6"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-xs border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            :placeholder="$t('placeholder_about_you')"
            required
         ></textarea>
      </div>
      <div v-if="subject === 'yllapito'" class="sm:col-span-2">
         <label for="skills" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">{{
            $t('label_skills')
         }}</label>
         <textarea
            id="skills"
            v-model="person_skills"
            rows="6"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-xs border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            :placeholder="$t('placeholder_skills')"
            required
         ></textarea>
      </div>
      <div v-if="subject === 'yllapito'" class="sm:col-span-2">
         <label for="portfolio" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">{{
            $t('label_portfolio')
         }}</label>
         <textarea
            id="portfolio"
            v-model="person_portfolio"
            rows="6"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-xs border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            :placeholder="$t('placeholder_portfolio')"
         ></textarea>
      </div>
      <button type="submit" class="btn-custom-primary">{{ $t('form_button') }}</button>
   </form>
</template>

<script setup lang="ts">
   import type { Data } from '@/types';

   const config = useRuntimeConfig();
   const router = useRouter();
   const localePath = useLocalePath();
   const { t } = useI18n();

   let content: any;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/toimikunta`)) as { data: Data };
      content = data.value.data;
   } catch {
      content = {
         fi_text: '# Hakemukset\nSisältöä ei voitu ladata.',
         en_text: '# Applications\nContent could not be loaded.',
      };
   }

   const isCommitteeOpen = (key: string): boolean => {
      const avoimet = content?.avoimet_toimikunnat;
      if (!avoimet) return false;
      if (Array.isArray(avoimet)) {
         return avoimet.includes(key);
      }
      if (typeof avoimet === 'string') {
         return avoimet
            .split(',')
            .map((s: string) => s.trim())
            .includes(key);
      }
      if (typeof avoimet === 'object') {
         return Boolean((avoimet as Record<string, any>)[key]);
      }
      return false;
   };

   const subject = ref('');
   const subjectSelect = ref<HTMLSelectElement | null>(null);
   const person_name = ref('');
   const person_contact = ref('');
   const person_info = ref('');
   const person_skills = ref('');
   const person_portfolio = ref('');

   function onSubjectChange() {
      if (subjectSelect.value) {
         subjectSelect.value.setCustomValidity('');
      }
   }

   async function submitForm() {
      const committeeKeyMap: Record<string, string> = {
         yllapito: 'jarjestelmatk_true',
         tapahtuma: 'tapahtumatk_true',
         koppi: 'koppitk_true',
      };

      const requiredKey = committeeKeyMap[subject.value];
      if (!requiredKey || !isCommitteeOpen(requiredKey)) {
         if (subjectSelect.value) {
            const hasAnyOpen = Object.values(committeeKeyMap).some((key) => isCommitteeOpen(key));
            const errorMsg = hasAnyOpen ? t('validation_select_open_committee') : t('validation_no_committees_open');
            subjectSelect.value.setCustomValidity(errorMsg);
            subjectSelect.value.reportValidity();
            subjectSelect.value.focus();
         }
         return;
      }

      try {
         // POST validated form data
         const response = await fetch(config.public['API_URL'] + 'items/toimikuntahakemukset', {
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

         if (!response.ok) {
            if (subjectSelect.value) {
               subjectSelect.value.setCustomValidity(t('500_msg'));
               subjectSelect.value.reportValidity();
            }
            return;
         }

         // Redirect to success page
         router.push(localePath('/opiskelu/kiitos_hakemus'));

         // Scroll top of page
         window.scrollTo(0, 0);
      } catch {
         if (subjectSelect.value) {
            subjectSelect.value.setCustomValidity(t('500_msg'));
            subjectSelect.value.reportValidity();
         }
      }
   }
</script>

<style scoped></style>
