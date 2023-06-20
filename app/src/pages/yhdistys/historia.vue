<template>
   <div>
      <Head>
         <Title>{{ $t('title_history') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_history') }}</h1>

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
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import { Data } from '@/app.vue';
   const config = useRuntimeConfig();

   let reports;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/toimintakertomus`)) as { data: Data };
      reports = data.value.data;
   } catch (e) {
      reports = [
         {
            fi_toimintakertomus: '# Toimintakertomukset kadoksissa \n try again later or inform sysadmin',
            en_toimintakertomus: '# Report 2077 \n ### Who lost the history? \n try again later or inform sysadmin',
         },
      ];
   }
</script>
