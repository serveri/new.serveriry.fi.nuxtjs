<template>
   <div>
      <Head>
         <Title>{{ $t('title_rules') }} - Serveri ry</Title>
      </Head>
      <Saannot :rules_fi="rules.rules_fi" :rules_en="rules.rules_en" :updated_at="updated" />
   </div>
</template>

<script setup lang="ts">
   import Saannot from '@/components/yhdistys/Saannot.vue';

   let rules;
   let updated: Date;
   try {
      const response = await useFetch('http://api.serveri.jeb4.dev/items/serveri_rules');
      rules = response.data.value.data;
      updated = new Date(rules.date_updated);
   } catch (e) {
      rules = 'Säännöt ovat kadonneet. Viva la revolucion!';
      updated = new Date();
   }
</script>

<style>
   p {
      @apply tracking-wide;
   }
</style>
