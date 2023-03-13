<template>
   <div>
      <Head>
         <Title>{{ $t('title_collaboration') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_collaboration') }}</h1>
      <section>
         <ContactFormBusiness />
      </section>
   </div>
</template>
<script setup lang="ts">
   import ContactFormBusiness from '@/components/partners/ContactFormBusiness.vue';
</script>
