<template>
   <div>
      <Head>
         <Title>{{ $t('title_safe-space') }} - Serveri ry</Title>
      </Head>
      <SafeSpace
         :safe_space_fi="rules.turvallinen_tila_fi"
         :safe_space_en="rules.turvalinen_tila_en"
         :updated_at="updated"
      />
   </div>
</template>

<script setup lang="ts">
   import SafeSpace from '@/components/yhdistys/SafeSpace.vue';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let rules;
   let updated: Date;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/turvallinen_tila`)) as { data: Data };
      rules = data.value.data;
      updated = new Date(rules.date_updated);
   } catch (e) {
      rules = {
         turvallinen_tila_fi: 'Säännöt ovat kadonneet. Viva la revolucion!',
         turvalinen_tila_en: 'Rules are missing. Viva la revolucion!',
      };
      updated = new Date();
   }
</script>

<style>
   @reference "tailwindcss";
   p {
      @apply tracking-wide;
   }
</style>
