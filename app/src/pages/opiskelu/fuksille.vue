<template>
   <div>
      <Head>
         <Title>{{ $t('title_new-student') }} - Serveri ry</Title>
      </Head>
      <vue-markdown class="rich-text py-2" :source="text[$i18n.locale + '_text']" />
      <p class="pb-4 text-center paragraph">Tietojenkäsittelytieteen uudet opiskelijat aloittavat syksyllä pitkän ja kivikkoisen, mutta niin kovin antoisan tiensä kohti luonnontieteen kandidaatin ja filosofian maisterin titteleitä.
</p>


<h2 class="text-2xl font-bold">Fuksin muistilista</h2>

<ul>
      <li></li>
</ul>


<h2 class="text-2xl font-bold">Opiskelijakortti</h2>

   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   let text;
   try {
      const { data } = await useFetch('http://127.0.0.1:8081/items/for_new_student');
      text = data.value.data;
   } catch (e) {
      text = {
         fi_text: 'API error',
         en_text: 'API error',
      };
   }
</script>
