<template>
   <div>
      <Head>
         <Title>{{ $t('title_documents') }} - Serveri ry</Title>
      </Head>
      <h2 class="custom-page-title">{{ $t('h1_documents') }}</h2>

      <p class="py-2 text-lg text-gray-700 dark:text-gray-300">
         {{ $t('documents_description') }}
      </p>

      <div class="mt-8 space-y-8">
         <div v-for="group in groupedDocuments" :key="group.year" class="py-4">
            <h3 class="text-3xl font-bold mb-2 text-custom-primary">{{ group.year }}</h3>

            <div class="space-y-2">
               <!-- Toimintasuunnitelma (Action Plan) -->
               <details v-if="group.actionPlan" class="group py-2">
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
                     <h2 class="pl-2 text-2xl">TOIMINTASUUNNITELMA</h2>
                  </summary>
                  <vue-markdown
                     class="rich-text group-open:animate-fadeIn mt-4"
                     :source="group.actionPlan[$i18n.locale + '_content'] || group.actionPlan['fi_content']"
                  />
               </details>

               <!-- Toimintakertomus (Report) -->
               <details v-if="group.report" class="group py-2">
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
                     <h2 class="pl-2 text-2xl">TOIMINTAKERTOMUS</h2>
                  </summary>
                  <vue-markdown
                     class="rich-text group-open:animate-fadeIn mt-4"
                     :source="group.report[$i18n.locale + '_toimintakertomus'] || group.report['fi_toimintakertomus']"
                  />
               </details>
            </div>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
   import { computed } from 'vue';
   import VueMarkdown from 'vue-markdown-render';
   import { useRuntimeConfig, useFetch } from '#imports';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let reports: any[] = [];
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/toimintakertomus`)) as { data: Data };
      if (data.value?.data) {
         reports = data.value.data;
      }
   } catch {
      reports = [
         {
            vuosi: '2077',
            fi_toimintakertomus: '# Toimintakertomukset kadoksissa \n try again later or inform sysadmin',
            en_toimintakertomus: '# Report 2077 \n ### Who lost the history? \n try again later or inform sysadmin',
         },
      ];
   }

   let actionPlans: any[] = [];
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/toimintasuunitelma`)) as { data: Data };
      if (data.value?.data) {
         actionPlans = data.value.data;
      }
   } catch {
      actionPlans = [
         {
            identifier: '2077',
            fi_content: '# Toimintasuunitelmat kadoksissa \n try again later or inform sysadmin',
            en_content: '# Action Plan 2077 \n ### Who lost the papers? \n try again later or inform sysadmin',
         },
      ];
   }

   const groupedDocuments = computed(() => {
      const groups = new Map<string, { year: string; report?: any; actionPlan?: any }>();

      for (const r of reports) {
         if (!groups.has(r.vuosi)) groups.set(r.vuosi, { year: r.vuosi });
         groups.get(r.vuosi)!.report = r;
      }

      for (const ap of actionPlans) {
         if (!groups.has(ap.identifier)) groups.set(ap.identifier, { year: ap.identifier });
         groups.get(ap.identifier)!.actionPlan = ap;
      }

      return Array.from(groups.values()).sort((a, b) => Number(b.year) - Number(a.year));
   });
</script>
