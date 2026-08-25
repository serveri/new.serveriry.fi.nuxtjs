<template>
   <div>
      <Head>
         <Title>{{ $t('title_forms') }} - Serveri ry</Title>
         <Meta name="description" content="Serveri ry:n lomakkeet ja linkit." />
         <Meta name="og:title" :content="$t('title_forms') + ' - Serveri ry'" />
         <Meta name="og:description" content="Serveri ry:n lomakkeet ja linkit." />
      </Head>
      <MarkdownView class="rich-text py-2" :source="content[langKey + '_text']" />
   </div>
   <div class="mb-8 flex flex-col items-center w-full gap-4">
      <div v-for="(item, idx) in links" :key="idx">
         <NuxtLink
            class="btn-custom-primary w-96 text-center justify-center inline-flex items-center"
            :to="currentLink(item)"
            :target="isExternal(item) ? '_blank' : undefined"
            :rel="isExternal(item) ? 'noopener noreferrer' : undefined"
         >
            <span>{{ currentTitle(item) }}</span>
            <font-awesome-icon v-if="isExternal(item)" class="ml-4" :icon="['fas', 'arrow-up-right-from-square']" />
         </NuxtLink>
      </div>
   </div>
</template>

<script setup lang="ts">
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
   import { computed } from 'vue';
   import { useI18n } from 'vue-i18n';

   interface FormLink {
      fi_text?: string;
      en_text?: string;
      fi_url?: string;
      en_url?: string;
      title_fi?: string;
      title_en?: string;
      link_fi?: string;
      link_en?: string;
      sort?: number | null;
   }

   const { locale } = useI18n();
   const config = useRuntimeConfig();
   const langKey = computed(() => (locale.value || 'fi').split('-')[0]);

   let content;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/forms_page`)) as { data: any };
      content = data.value?.data || {
         fi_text: '# Kyselylomakkeet',
         en_text: '# Forms',
      };
   } catch {
      content = {
         fi_text: '# Kyselylomakkeet',
         en_text: '# Forms',
      };
   }

   const fallbackForms: FormLink[] = [
      {
         fi_text: 'Jatkuva opetuspalautelomake',
         en_text: 'Continuous Form for Education Feedback',
         fi_url: 'https://forms.office.com/e/4kn5NM7M4u',
         en_url: 'https://forms.office.com/e/4kn5NM7M4u',
      },
      {
         fi_text: 'Vappudiplomilomake',
         en_text: 'May Day Diploma Form',
         fi_url: 'https://forms.office.com/e/qkM5Aq3ee4',
         en_url: 'https://forms.office.com/e/qkM5Aq3ee4',
      },
   ];

   let fetchedForms: FormLink[] = [];
   try {
      const { data: apiForms } = (await useFetch(`${config.public['API_URL']}items/forms?sort=sort`)) as { data: any };
      const raw = apiForms.value?.data;
      if (Array.isArray(raw) && raw.length > 0) {
         fetchedForms = raw;
      }
   } catch {
      fetchedForms = [];
   }

   const links = computed(() => (fetchedForms.length > 0 ? fetchedForms : fallbackForms));

   const currentTitle = (item: FormLink) => {
      if (langKey.value === 'en') {
         return item.en_text || item.title_en || item.fi_text || item.title_fi || '';
      }
      return item.fi_text || item.title_fi || item.en_text || item.title_en || '';
   };

   const currentLink = (item: FormLink) => {
      if (langKey.value === 'en') {
         return item.en_url || item.link_en || item.fi_url || item.link_fi || '#';
      }
      return item.fi_url || item.link_fi || item.en_url || item.link_en || '#';
   };

   const isExternal = (item: FormLink) => {
      const url = currentLink(item);
      return (
         typeof url === 'string' &&
         (url.startsWith('http://') || url.startsWith('https://')) &&
         !url.startsWith('https://serveriry.fi')
      );
   };
</script>
