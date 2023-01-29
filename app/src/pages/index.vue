import UutisetHero from '@/components/hero/UutisetHero.vue';

<template>
   <div class="flex flex-col justify-center items-center">
      <Head>
         <Title>{{ $t('title_front-page') }} - Serveri ry</Title>
      </Head>

      <HeroImage class="w-screen" />

      <div class="flex flex-col py-5 lg:flex-row md:flex-col sm:flex-col">
         <HeroSection />
         <HeroUutiset />
      </div>
   </div>
</template>
