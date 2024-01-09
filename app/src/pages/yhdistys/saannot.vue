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
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let rules;
   let updated: Date;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/serveri_rules`)) as { data: Data };
      rules = data.value.data;
      updated = new Date(rules.date_updated);
   } catch (e) {
      rules = {
         rules_fi: 'Säännöt ovat kadonneet. Viva la revolucion!',
         rules_en: 'Rules are missing. Viva la revolucion!',
      };
      updated = new Date();
   }
</script>

<style>
   p {
      @apply tracking-wide;
   }
</style>
