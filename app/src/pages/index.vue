<template>
   <div class="flex flex-col justify-center items-center">
      <Head>
         <Title>{{ $t('title_front-page') }} - Serveri ry</Title>
      </Head>
      <section>
         <HeroSection class="w-screen" />
      </section>

      <section class="sm:my-[-3rem] xl:sm:my-[-6rem] 2xl:sm:my-[-8rem] flex flex-col lg:flex-row">
         <DescriptionText />
         <TopNews />
      </section>

      <section class="py-8 w-screen sm:mt-12 xl:mt-28 2xl:mt-32">
         <div class="flex self-center justify-center">
            <SponsorCarousel />
         </div>
      </section>

      <section class="py-8 flex flex-col md:flex-row w-full gap-8">
         <YTHS />
         <InstagramFeed />
      </section>

      <section class="pt-8">
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
   import SponsorCarousel from '@/components/langingpage/SponsorCarousel.vue';
</script>

<style>
   p {
      @apply tracking-wide;
   }
</style>
