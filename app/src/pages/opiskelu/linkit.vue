<template>
   <div>
      <Head>
         <Title>{{ $t('title_forms') }} - Serveri ry</Title>
         <Meta name="description" content="Serveri ry:n lomakkeet ja linkit." />
         <Meta name="og:title" content="{{ $t('title_forms') }} - Serveri ry" />
         <Meta name="og:description" content="Serveri ry:n lomakkeet ja linkit." />
      </Head>
      <vue-markdown class="rich-text py-2" :source="content[$i18n.locale + '_text']" />
   </div>
   <div class="mb-8 mx-auto">
      <div class="space-y-12 mx-auto w-s text-center">
         <div v-for="link in links" class="btn-custom-link px-4 lg:mx-64 z-10">
            <NuxtLink class="text-white" :to="$i18n.locale === 'fi' ? link.fi_url : link.en_url">
               {{ $i18n.locale === 'fi' ? link.fi_text : link.en_text }}
               <font-awesome-icon
                  v-if="
                     !(
                        link.fi_url.startsWith('https://serveriry.fi/') ||
                        link.fi_url.startsWith('/') ||
                        link.fi_url.startsWith('#')
                     )
                  "
                  class="ml-4"
                  :icon="['fas', 'arrow-up-right-from-square']"
               />
            </NuxtLink>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
   const config = useRuntimeConfig();
   const router = useRouter();

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/forms_page`)) as { data: Data };
      content = data.value.data;
   } catch (e) {
      content = {
         fi_text: '# Virhe ladattaessa sivua',
         en_text: '# Error loading page',
      };
   }

   let links;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/forms`)) as { data: Data };
      links = data.value.data;
   } catch (e) {
      links = [
         {
            fi_text: 'Try again later',
            fi_url: '#',
            en_text: 'Try again later',
            en_url: '#',
         },
      ];
   }
</script>

<style scoped></style>
