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
   <div class="mb-8 flex flex-col items-center w-full gap-4">
      <div v-for="item in links">
         <NuxtLink
            class="btn-custom-primary w-96 text-center justify-center"
            :to="$i18n.locale === 'fi' ? item.link_fi : item.link_en"
         >
            {{ $i18n.locale === 'fi' ? item.title_fi : item.title_en }}
            <font-awesome-icon
               v-if="!(item.link_en.startsWith('/') || item.link_en.startsWith('https://serveriry.fi/'))"
               class="ml-4"
               :icon="['fas', 'arrow-up-right-from-square']"
            />
         </NuxtLink>
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
         fi_text: '# Kyselylomakkeet',
         en_text: '# Forms',
      };
   }
   const subject = ref('');
   const person_name = ref('');
   const person_contact = ref('');
   const person_info = ref('');
   const person_skills = ref('');
   const person_portfolio = ref('');

   async function submitForm(e) {
      e.preventDefault();
      // POST validated form data
      await fetch(config.public['API_URL'] + 'items/toimikuntahakemukset', {
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
      // Redirect to success page
      router.push('/opiskelu/kiitos');

      // Scroll top of page
      window.scrollTo(0, 0);
   }

   const links = [
      {
         title_fi: 'Periodi palautekysely',
         title_en: 'Feedback form',
         link_fi: 'https://forms.office.com/e/4kn5NM7M4u',
         link_en: 'https://forms.office.com/e/4kn5NM7M4u',
      },
      {
         title_fi: 'Vappudiplomi lomake',
         title_en: 'Student Diploma Form',
         link_fi: '/about',
         link_en: '/about',
      },
      {
         title_fi: 'Haalarimerkki ideat',
         title_en: 'Overall Patch Designs',
         link_fi: '/about',
         link_en: '/about',
      },
   ];
</script>
