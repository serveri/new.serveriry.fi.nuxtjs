<template>
   <div>
      <Head>
         <Title>{{ $t('title_partners') }} - Serveri ry</Title>
      </Head>

      <h1 class="custom-page-title">{{ $t('h1_partners') }}</h1>

      <p class="mb-8 lg:mb-16 text-center paragraph">
         {{
            $i18n.locale === 'fi'
               ? 'Serveri ry tekee yritysyhteistyötä useiden IT alan yritysten ja muiden opiskelijoille hyödyllisten tahojen kanssa. Tässä on viimeaikaiset tahot jotka ovat olleet esillä jossain tapahtumassamme tai haalareissamme:'
               : 'The Serveri ry works in partnership with a number of IT companies and other organisations that are useful to students. Here are some of the recent ones that have been featured at one of our events or in our overalls:'
         }}
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
