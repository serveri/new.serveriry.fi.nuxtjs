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

      <div class="flex flex-col md:flex-row w-full gap-8 py-5">
         <div class="md:flex-1">
            <h2 class="custom-page-title">Muista YTHS Maksu!</h2>
            <p class="py-3 sm:text-justify">
               Vuonna 2023 korkeakouluopiskelijan terveydenhoitomaksu on 36,80 euroa lukukaudessa. Sinun täytyy maksaa
               se Kelalle sekä kevät- että syyslukukaudelta. Sinulle ei lähetetä laskua, vaan maksu pitää maksaa
               oma-aloitteisesti. Maksettava summa määritellään valtioneuvoston asetuksella, ja se voi muuttua
               vuosittain.
            </p>
            <p class="py-3 sm:text-justify">Voit maksaa maksun, vaikka et olisi vielä ilmoittautunut läsnä olevaksi.</p>
            <p class="py-3 sm:text-justify">
               Terveydenhoitomaksu vahvistetaan kalenterivuodeksi kerrallaan. Keväällä 2023 voit siis maksaa sekä
               kevätlukukauden 2023 että syyslukukauden 2023 maksun.
            </p>
            <a class="flex flex-col items-center py-8" href="https://kela.fi/">
               <button
                  class="text-white bg-gradient-to-r from-cyan-400 via-cyan-500 to-cyan-600 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-cyan-300 dark:focus:ring-cyan-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2"
                  type="button"
               >
                  Maksa maksu (kela.fi)
               </button>
            </a>
         </div>
         <div class="flex flex-col items-center sm:grid sm:grid-cols-2 gap-y-2 gap-x-5 md:flex-1 sm:h-[100vw] md:h-[54vw] xl:h-[75vh] ">
            <iframe
               class="rounded-lg w-full h-[100vw] sm:h-[100%]"
               src="//instagram.com/p/CpKgJHQhzER/embed/"
               height="100%"
               scrolling="no"
               allowtransparency="true"
            ></iframe>
            <iframe
               class="rounded-lg w-full h-[100vw] sm:h-[100%]"
               src="//instagram.com/p/CpM-KyjBNsR/embed/"
               height="100%"
               scrolling="no"
               allowtransparency="true"
            ></iframe>
            <iframe
               class="rounded-lg w-full h-[100vw] sm:h-[100%]"
               src="//instagram.com/p/CpKCyiOhZn3/embed/"
               height="100%"
               scrolling="no"
               allowtransparency="true"
            ></iframe>
            <iframe
               class="rounded-lg w-full h-[100vw] sm:h-[100%]"
               src="//instagram.com/p/CotodDxB34V/embed/"
               height="100%"
               scrolling="no"
               allowtransparency="true"
            ></iframe>
         </div>
      </div>
   </div>
</template>

<style>
   p {
      @apply tracking-wide;
   }
</style>
