<template>
   <div class="flex flex-col justify-center items-center">
      <Head>
         <Title>{{ $t('title_front-page') }} - Serveri ry</Title>
      </Head>
      <section>
         <HeroSection class="w-screen" />
      </section>

      <section class="py-5 flex flex-col sm:flex-col lg:flex-row">
         <DescriptionText />
         <TopNews />
      </section>

      <section class="py-5 flex flex-col md:flex-row w-full gap-8">
         <YTHS />
         <InstagramFeed />
      </section>

      <section>
         <EmbeddedMap />
      </section>
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
