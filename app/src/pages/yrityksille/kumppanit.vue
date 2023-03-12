<template>
   <div>
      <Head>
         <Title>{{ $t('title_partners') }} - Serveri ry</Title>
      </Head>

      <h1 class="custom-page-title">{{ $t('h1_partners') }}</h1>

      <p class="mb-8 lg:mb-16 font-light text-center text-gray-500 dark:text-gray-400 sm:text-xl">
         Serveri tekee yritysyhteistyötä useiden IT alan yritysten ja muiden opiskelijoille hyödyllisten tahojen kanssa.
         Tässä on viimeaikaiset tahot jotka ovat olleet esillä jossain tapahtumassamme tai haalareissamme:
      </p>

      <partner-page-section />
      <!-- Contact Form -->
      <section>
         <ContactFormBusiness />
      </section>
   </div>
</template>

<script setup lang="ts">
   import PartnerPageSection from '@/components/partners/PartnerPageSection.vue';
   import ContactFormBusiness from '@/components/partners/ContactFormBusiness.vue';
</script>
