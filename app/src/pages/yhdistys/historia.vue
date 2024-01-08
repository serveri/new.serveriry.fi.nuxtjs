<template>
   <div>
      <SEO :seo="content.seo" />
      <div>
         <h1 class="custom-page-title">{{ $t('h1_history') }}</h1>
         <vue-markdown class="rich-text group-open:animate-fadeIn mb-8" :source="content[$i18n.locale + '_text']" />

         <h2 class="custom-page-title">Vanhat sivut webarkistosta eri vuosilta</h2>
         <div>
            <ul>
               <li v-for="year in Object.keys(iframes)" :key="year" class="py-4">
                  <h3 class="text-2xl">{{ year }}</h3>
                  <iframe :src="iframes[year]" width="100%" height="500px" class="outline outline-1" />
               </li>
            </ul>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import { Data } from '@/app.vue';
   import SEO from '@/components/SEO.vue';
   const config = useRuntimeConfig();

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/history?fields=fi_text,en_text,seo.*`)) as {
         data: Data;
      };
      content = data.value.data;
   } catch (e) {
      content = {
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
   }

   const iframes = {
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
