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

   let rules;
   let updated: Date;
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/turvallinen_tila');
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
