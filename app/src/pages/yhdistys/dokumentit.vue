<template>
   <div>
      <Head>
         <Title>{{ $t('title_history') }} - Serveri ry</Title>
      </Head>
      <h2 class="custom-page-title">{{ $t('h1_documents') }}</h2>

      <div>
         <!--         <h2 class="custom-page-title">{{ $t('h1_annual_reports') }}</h2>-->

         <div v-for="report in reports" :key="report.vuosi">
            <details class="group py-4">
               <summary class="flex items-center font-medium cursor-pointer list-none">
                  <span class="transition group-open:rotate-90">
                     <svg
                        fill="none"
                        height="36"
                        shape-rendering="geometricPrecision"
                        stroke="currentColor"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="1.5"
                        viewBox="0 0 24 24"
                        width="36"
                        class="dark:invert -rotate-90"
                     >
                        <path d="M6 9l6 6 6-6"></path>
                     </svg>
                  </span>
                  <h2 class="pl-2 text-2xl">TOIMINTAKERTOMUS {{ report.vuosi }}</h2>
               </summary>
               <vue-markdown
                  class="rich-text group-open:animate-fadeIn"
                  :source="report[$i18n.locale + '_toimintakertomus']"
               />
            </details>
         </div>
      </div>
      <div>
         <!--         <h2 class="custom-page-title">{{ $t('h1_action_plan') }}</h2>-->

         <div v-for="document in actionPlans" :key="document.identifier">
            <details class="group py-4">
               <summary class="flex items-center font-medium cursor-pointer list-none">
                  <span class="transition group-open:rotate-90">
                     <svg
                        fill="none"
                        height="36"
                        shape-rendering="geometricPrecision"
                        stroke="currentColor"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="1.5"
                        viewBox="0 0 24 24"
                        width="36"
                        class="dark:invert -rotate-90"
                     >
                        <path d="M6 9l6 6 6-6"></path>
                     </svg>
                  </span>
                  <h2 class="pl-2 text-2xl">TOIMINTASUUNITELMA {{ document.identifier }}</h2>
               </summary>
               <vue-markdown
                  class="rich-text group-open:animate-fadeIn"
                  :source="document[$i18n.locale + '_content']"
               />
            </details>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import { Data } from '@/types';
   const config = useRuntimeConfig();

   // let docs: [{ fi_content: string; en_content: string; identifier: string }];

   let reports;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/toimintakertomus`)) as { data: Data };
      reports = data.value.data;
      reports.fi_content = reports.fi_toimintakertomus;
      reports.en_content = reports.en_toimintakertomus;
      reports.identifier = reports.vuosi;
   } catch (e) {
      reports = [
         {
            fi_content: '# Toimintakertomukset kadoksissa \n try again later or inform sysadmin',
            en_content: '# Report 2077 \n ### Who lost the history? \n try again later or inform sysadmin',
         },
      ];
   }

   let actionPlans;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/toimintasuunitelma`)) as { data: Data };
      actionPlans = data.value.data;
   } catch (e) {
      actionPlans = [
         {
            fi_content: '# Toimintasuunitelmat kadoksissa \n try again later or inform sysadmin',
            en_content: '# Action Plan 2077 \n ### Who lost the papers? \n try again later or inform sysadmin',
         },
      ];
   }
   // TODO: Add all documents to docs list
</script>
