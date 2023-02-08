<template>
   <div>
      <Head>
         <Title>{{ $t('title_companies') }} - Serveri ry</Title>
      </Head>

      <h1 class="custom-page-title">{{ $t('h1_companies') }}</h1>
      <div class="pb-8">
         <div>
            <h2 class="text-center">Yhteistyökumppanit</h2>
            <partner-page-section />
         </div>
         <div>
            <div class="py-4">
               <h2 class="text-center">Kuopiossa:</h2>
               <ul class="flex flex-wrap text-center pt-8">
                  <li>Ambientia</li>
                  <li>CGI</li>
                  <li>Efecte</li>
                  <li>Etteplan</li>
                  <li>Innofactor</li>
                  <li>Loihde</li>
                  <li>Ponsse</li>
                  <li>Talent Tree</li>
                  <li>Tietoevry</li>
                  <li>Valmet</li>
                  <li>Huld</li>
                  <li>Hurja</li>
                  <!-- Jätä aina 4 jaollinen luku lista elementtejä niin näyttää nätimmältä-->
               </ul>
            </div>
            <div class="py-4">
               <h2 class="text-center">Koko Suomi:</h2>
               <ul class="flex flex-wrap text-center pt-8">
                  <li>Alfame</li>
                  <li>Apotti</li>
                  <li>F-secure</li>
                  <li>Fortum</li>
                  <li>Gofore</li>
                  <li>Next Games</li>
                  <li>Nixu</li>
                  <li>Nokia</li>
                  <li>Rovio</li>
                  <li>Sitowise</li>
                  <li>Supercell</li>
                  <li>Visma</li>
                  <li>With Secure</li>
                  <li>Yle</li>
                  <li>Siili solutions</li>
                  <li>Nordea</li>
                  <li>Solita</li>
                  <li>Loimu</li>
                  <li>Abloy</li>
                  <li>Blancco</li>
                  <li>Digia</li>
                  <li>Futurice</li>
                  <li>Reaktor</li>
                  <li>accenture</li>
                  <li>Nitor</li>
                  <li>boogie</li>
                  <li>Vaimo</li>
                  <li>Qt</li>
                  <li>netum</li>
                  <li>Vincit</li>
                  <li>Pinja</li>
                  <li></li>
                  <!-- Jätä aina 4 jaollinen luku lista elementtejä niin näyttää nätimmältä-->
               </ul>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
   import PartnerPageSection from '@/components/partners/PartnerPageSection.vue';

   export default {
      name: 'Yritykset',
      components: { PartnerPageSection },
   };
</script>

<style scoped>
   h2 {
      font-size: x-large;
      padding: 1rem 0;
   }

   li {
      flex: 1 0 20%;
      margin: 5px 30px;
   }
</style>
