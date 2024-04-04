<template>
   <div>
      <Head>
         <Title>{{ $t('title_forms') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text py-2" :source="content[$i18n.locale + '_text']" />
   </div>
   <div class="mb-8">
      <div class="space-y-4 text-center">
         <NuxtLink class="btn-custom-primary" to="https://forms.office.com/e/4kn5NM7M4u">
            {{ $i18n.locale === 'fi' ? 'Periodi palautekysely' : 'Feedback form' }}
            <font-awesome-icon class="ml-4" :icon="['fas', 'arrow-up-right-from-square']" />
         </NuxtLink>
         <div>
            <NuxtLink class="btn-custom-primary" to="/about">
               {{ $i18n.locale === 'fi' ? 'Vappudiplomi lomake' : 'Student Diploma Form' }}
            </NuxtLink>
         </div>
         <div>
            <NuxtLink class="btn-custom-primary" to="/about">
               {{ $i18n.locale === 'fi' ? 'Haalarimerkki ideat' : 'Overall Patch Designs' }}
            </NuxtLink>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
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
</script>

<style scoped></style>
