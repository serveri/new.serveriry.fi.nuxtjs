import UutisetHero from '@/components/hero/UutisetHero.vue';

<template>
   <div class="flex flex-col justify-center items-center">
      <Head>
         <Title>{{ $t('title_front-page') }} - Serveri ry</Title>
      </Head>

      <!-- cannot be 100vw, causes x overflow. Cannot be 100%, will be too small... -->
      <HeroImage style="width: 100vw" />

      <section class="flex flex-col py-5 lg:flex-row md:flex-col sm:flex-col">
         <HeroSection />
         <HeroUutiset />
      </section>

      <!-- 2 Col -->
      <section class="flex flex-col md:flex-row w-full gap-8 py-5">
         <YTHS />
         <InstagramFeed />
      </section>

      <!-- Embedded map -->
      <EmbeddedMap />
   </div>
</template>

<style>
   p {
      @apply tracking-wide;
   }
</style>
<script setup lang="ts">
   import InstagramFeed from '@/components/langingpage/InstagramFeed.vue';
   import YTHS from '@/components/langingpage/yths.vue';
   import EmbeddedMap from '@/components/langingpage/EmbeddedMap.vue';
</script>
