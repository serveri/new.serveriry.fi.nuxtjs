<template>
   <div>
      <SEO :seo="content.seo" />
      <div>
         <h1 class="custom-page-title">{{ $t('h1_history') }}</h1>
         <vue-markdown class="rich-text group-open:animate-fadeIn mb-8" :source="localeText" />

         <h2 class="custom-page-title">
            {{
               $i18n.locale === 'fi'
                  ? 'Vanhat sivut webarkistosta eri vuosilta'
                  : 'Old pages from the web archive from different years'
            }}
         </h2>
         <div>
            <ul>
               <li v-for="year in Object.keys(iframes)" :key="year" class="py-4">
                  <h3 class="text-2xl">{{ year }}</h3>
                  <client-only>
                     <iframe
                        v-if="trackingAllowed"
                        :src="iframes[year]"
                        width="100%"
                        height="500px"
                        class="outline-solid outline-1"
                        sandbox="allow-scripts"
                     />
                     <p v-else class="py-2 text-zinc-600 dark:text-zinc-400">
                        <span class="block text-sm">{{ $t('embed_cookies_required') }}</span>
                        <a :href="iframes[year]" target="_blank" rel="noopener noreferrer" class="text-custom-primary underline">
                           {{ $t('tracking_disabled_embed') }} ({{ year }})
                        </a>
                     </p>
                  </client-only>
               </li>
            </ul>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   import SEO from '@/components/SEO.vue';
   const config = useRuntimeConfig();
   const { trackingAllowed } = useTrackingConsent();

   interface HistorySeo {
      title?: string;
      meta_description?: string;
      canonical_url?: string;
      no_index?: boolean;
      no_follow?: boolean | null;
      og_image?: string;
      sitemap_change_frequency?: string;
      sitemap_priority?: number;
   }

   interface HistoryContent {
      fi_text: string;
      en_text: string;
      seo: HistorySeo;
      [key: string]: string | HistorySeo | undefined;
   }

   const defaultContent: HistoryContent = {
      fi_text: '# Historia kadoksissa \n Tämä tulee myöhemmin',
      en_text: '# History \n ### Who lost the history? \n Will be added later',
      seo: {
         title: 'Historia - Serveri ry',
         meta_description: 'Serveri ry:n historia 1990 luvulta nykypäivään',
         canonical_url: 'https://serveriry.fi/yhdistys/historia',
         no_index: false,
         no_follow: null,
         og_image: '55882074-5535-47d4-8a1a-eef51fbd5b38',
         sitemap_change_frequency: 'weekly',
         sitemap_priority: 0,
      },
   };

   const content = ref<HistoryContent>(defaultContent);
   const { locale } = useI18n();
   const localeText = computed(() => {
      const key = locale.value + '_text';
      const val = content.value[key];
      return typeof val === 'string' ? val : '';
   });

   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/history?fields=fi_text,en_text,seo.*`)) as {
         data: { value: { data: HistoryContent } };
      };
      if (data.value?.data && typeof data.value.data === 'object') {
         content.value = { ...defaultContent, ...data.value.data };
      }
   } catch (e) {
      content.value = defaultContent;
   }

   const iframes: Record<string, string> = {
      '2007': 'https://web.archive.org/web/20071027052615/http://serveriry.fi/',
      '2009': 'https://web.archive.org/web/20091001012342/http://serveriry.fi/',
      '2011': 'https://web.archive.org/web/20111205161058/http://www.serveriry.fi/',
      '2013': 'https://web.archive.org/web/20130706063834/http://serveriry.fi/',
      '2016': 'https://web.archive.org/web/20160319175243/http://www.serveriry.fi/',
      '2018': 'https://web.archive.org/web/20180426000520/http://www.serveriry.fi/',
      '2020': 'https://web.archive.org/web/20200807204208/https://www.serveriry.fi/',
      '2021': 'https://web.archive.org/web/20210821154619/https://serveriry.fi/',
      '2023': 'https://web.archive.org/web/20231223174907/https://serveriry.fi/',
   };
</script>
