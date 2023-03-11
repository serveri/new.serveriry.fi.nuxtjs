<template>
   <div class="md:flex-1">
      <h2 class="custom-page-title">Muista YTHS Maksu!</h2>
      <p class="py-3 sm:text-justify">
         Vuonna 2023 korkeakouluopiskelijan terveydenhoitomaksu on 36,80 euroa lukukaudessa. Sinun täytyy maksaa se
         Kelalle sekä kevät- että syyslukukaudelta. Sinulle ei lähetetä laskua, vaan maksu pitää maksaa
         oma-aloitteisesti. Maksettava summa määritellään valtioneuvoston asetuksella, ja se voi muuttua vuosittain.
      </p>
      <p class="py-3 sm:text-justify">Voit maksaa maksun, vaikka et olisi vielä ilmoittautunut läsnä olevaksi.</p>
      <p class="py-3 sm:text-justify">
         Terveydenhoitomaksu vahvistetaan kalenterivuodeksi kerrallaan. Keväällä 2023 voit siis maksaa sekä
         kevätlukukauden 2023 että syyslukukauden 2023 maksun.
      </p>
      <a class="flex flex-col items-center py-8" href="https://kela.fi/">
         <button class="button-server-blue" type="button">Maksa maksu (kela.fi)</button>
      </a>
   </div>
</template>

<script>
   export default {
      name: 'YTHS',
   };
</script>

<style scoped></style>
