<template>
   <div>
      <Head>
         <Title>{{ $t('title_partners') }} - Serveri ry</Title>
      </Head>

      <h1 class="custom-page-title">{{ $t('h1_partners') }}</h1>

      <p>
         Serveri tekee yritysyhteistyötä useiden IT alan yritysten ja muiden opiskelijoille hyödyllisten tahojen kanssa.
         Tässä on viimeaikaiset tahot jotka ovat olleet esillä jossain tapahtumassamme tai haalareissamme:
      </p>

      <partner-page-section />
   </div>
</template>

<script setup lang="ts">
   import PartnerPageSection from '@/components/partners/PartnerPageSection.vue';
</script>
