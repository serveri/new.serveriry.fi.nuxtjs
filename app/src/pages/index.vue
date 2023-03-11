<template>
   <div class="flex flex-col justify-center items-center">
      <Head>
         <Title>{{ $t('title_front-page') }} - Serveri ry</Title>
      </Head>

      <HeroSection class="w-screen" />
      <section class="flex flex-col py-5 lg:flex-row md:flex-col sm:flex-col">
         <DescriptionText />
         <TopNews />
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

<script setup lang="ts">
   import InstagramFeed from '@/components/langingpage/InstagramFeed.vue';
   import YTHS from '@/components/langingpage/yths.vue';
   import EmbeddedMap from '@/components/langingpage/EmbeddedMap.vue';
   import HeroSection from '@/components/langingpage/HeroSection.vue';
   import DescriptionText from '@/components/langingpage/DescriptionText.vue';
   import TopNews from '@/components/langingpage/TopNews.vue';
</script>
<style>
   p {
      @apply tracking-wide;
   }
</style>
