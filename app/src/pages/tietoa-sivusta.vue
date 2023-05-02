<template>
   <div>
      <Head>
         <Title>{{ $t('title_about_site') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_about_site') }}</h1>
      <div>
         <vue-markdown class="rich-text py-2" :source="about_text" />
      </div>
   </div>
</template>

<script setup>
   import VueMarkdown from 'vue-markdown-render';
   let about_text;
   try {
      let response = await useFetch('https://api.serveri.jeb4.dev/items/tietoa_sivustosta');
      about_text = response.data.value.data.tietoa_sivustosta_text;
      console.log('rixhText:', about_text);
   } catch (e) {
      about_text = {
         fi_text: 'API error',
         en_text: 'API error',
      };
   }
</script>

<style scoped></style>
