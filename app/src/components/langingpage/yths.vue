<template>
   <div class="md:flex-1 md:border-r border-gray-200 dark:border-gray-700">
      <h2 class="custom-page-title sm:mr-8">Muista YTHS Maksu!</h2>
      <div class="py-3 sm:mr-8 sm:text-justify">
         <p>
            Vuonna 2023 korkeakouluopiskelijan terveydenhoitomaksu on 36,80 euroa lukukaudessa. Sinun täytyy maksaa se
            Kelalle sekä kevät- että syyslukukaudelta. Sinulle ei lähetetä laskua, vaan maksu pitää maksaa
            oma-aloitteisesti. Maksettava summa määritellään valtioneuvoston asetuksella, ja se voi muuttua vuosittain.
         </p>
         <p>Voit maksaa maksun, vaikka et olisi vielä ilmoittautunut läsnä olevaksi.</p>
         <p>
            Terveydenhoitomaksu vahvistetaan kalenterivuodeksi kerrallaan. Keväällä 2023 voit siis maksaa sekä
            kevätlukukauden 2023 että syyslukukauden 2023 maksun.
         </p>
      </div>
      <div class="flex flex-col items-center mt-8">
         <a href="https://kela.fi/" class="btn-custom-blue" type="button">Maksa maksu (kela.fi)</a>
      </div>
   </div>
</template>

<script>
   export default {
      name: 'YTHS',
   };
</script>

<style scoped></style>
