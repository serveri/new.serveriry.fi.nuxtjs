import UutisetHero from '@/components/hero/UutisetHero.vue';

<template>
   <div class="flex flex-col justify-center items-center">
      <Head>
         <Title>{{ $t('title_front-page') }} - Serveri ry</Title>
      </Head>

      <!-- cannot be 100vw, causes x overflow. Cannot be 100%, will be too small... -->
      <HeroImage style="width: 100vw" />

      <div class="flex flex-col py-5 lg:flex-row md:flex-col sm:flex-col">
         <HeroSection />
         <HeroUutiset />
      </div>

      <div class="grid grid-cols-4">

        <iframe class="rounded-2xl" src="//instagram.com/p/CpKgJHQhzER/embed/" width="300" height="353" scrolling="no" allowtransparency="true"></iframe>
        <iframe class="rounded-2xl" src="//instagram.com/p/CpM-KyjBNsR/embed/" width="300" height="353" scrolling="no" allowtransparency="true"></iframe>
        <iframe class="rounded-2xl" src="//instagram.com/p/CpKCyiOhZn3/embed/" width="300" height="353" scrolling="no" allowtransparency="true"></iframe>
        <iframe class="rounded-2xl" src="//instagram.com/p/CotodDxB34V/embed/" scrolling="no" allowtransparency="true"></iframe>
        <iframe class="rounded-2xl" src="//instagram.com/p/CpKgJHQhzER/embed/" width="300" height="353" scrolling="no" allowtransparency="true"></iframe>
        <iframe class="rounded-2xl" src="//instagram.com/p/CpM-KyjBNsR/embed/" width="300" height="353" scrolling="no" allowtransparency="true"></iframe>
        <iframe class="rounded-2xl" src="//instagram.com/p/CpKCyiOhZn3/embed/" width="300" height="353" scrolling="no" allowtransparency="true"></iframe>
        <iframe class="rounded-2xl" src="//instagram.com/p/CotodDxB34V/embed/" width="300" height="353" scrolling="no" allowtransparency="true"></iframe>

      </div>
   </div>
</template>

<style>
iframe {
  position: relative;
  top: -100px;
}
</style>
