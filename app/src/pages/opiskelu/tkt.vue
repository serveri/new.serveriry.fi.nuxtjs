<template>
   <div>
      <Head>
         <Title>{{ $t('title_what-is-cs') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_what-is-cs') }}</h1>

      <div class="video-container relative h-0 overflow-hidden max-w-full w-full mb-6" style="padding-bottom: 56.25%">
         <iframe
            class="absolute top-0 left-0 w-full h-full"
            src="https://www.youtube.com/embed/PMIhWO6C_FY"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            allowfullscreen
         ></iframe>
      </div>

      <div>
         <h4 class="text-xl font-bold mt-2 mb-3">
            Jos mietit kannattaisiko alaa alkaa opiskelemaan niin olet oikealla sivulla
         </h4>
         <p>
            Tietojenkäsittelytiede on aavistuksen näsäviisaasti ilmaistuna tiedettä tiedon käsittelystä. Nykyään
            tietojenkäsittelytiede hyödyntää vahvasti digitaalisia järjestelmiä. Käytännössä tietojenkäsittelytieteeseen
            kuuluu siis tiedon keräämiseen, tallentamiseen, välittämiseen, näyttämiseen, muuntamiseen sekä käsittelyyn
            liittyviä aihepiirejä. Käytännössä parhaan kuvan tietojenkäsittelytieteen tutkinnon rakenteesta Itä-Suomen
            yliopistossa saat kurssikuvauksista, jotka löydät alta. Kurssit ovat osapuilleen samat Kuopiossa ja
            Joensuussa, ainut isompi muuttuja on sivuainemahdollisuudet ja se että Serveriläiset opiskelevat Kuopiossa.
            (Joensuussa tietojenkäsittelytieteen ainejärjestönä toimii Skripti ry)
         </p>
      </div>

      <div>
         <h2 class="mt-8 text-2xl font-extrabold text-center">UEF tietojenkäsittelytieteen opintorakenne</h2>
      </div>

      <div class="table-container">
         <div>
            <h2 class="table-desc">Yleisopinnot</h2>
            <p>Yleisopinnot tukevat opiskelua erityisesti ensimmäisenä opiskeluvuotena.</p>
         </div>

         <table class="course-table">
            <tr>
               <th class="table-header"><p>Opintojakso</p></th>

               <th class="table-header"><p>Kurssikuvaus</p></th>

               <th class="table-header"><p>Laajuus (opintopisteet)</p></th>
            </tr>

            <tr class="data-row">
               <td class="table-data"><p>Hops-tietojenkäsittelytiede</p></td>

               <td class="table-data"><p>(Hops = henkilökohtainen opintosuunnitelma)</p></td>

               <td class="table-data"><p>2</p></td>
            </tr>

            <tr class="data-row">
               <td class="table-data"><p>Orientaatio yliopisto-opiskeluun</p></td>

               <td class="table-data">
                  <p>
                     Opiskelija tutustuu oppiaine- ja vertaistuutoroinnin, verkkomateriaalin, erilaisten
                     orientaatiotapahtumien sekä oheismateriaalin avulla yliopistoon opiskeluympäristönä ja
                     oppimisyhteisönä. Erityisesti tutustutaan oman oppiaineen opiskelukäytäntöihin ja opiskelua
                     tukeviin palveluihin. Lisäksi saadaan tietoa akateemisen opiskelun edellyttämistä tiedoista ja
                     taidoista sekä opiskelukyvystä ja sen ylläpitämisestä.
                  </p>
               </td>
               <td class="table-data"><p>1</p></td>
            </tr>
            <tr class="data-row">
               <td class="table-data"><p>Hops-tietojenkäsittelytiede</p></td>

               <td class="table-data"><p>(Hops = henkilökohtainen opintosuunnitelma)</p></td>

               <td class="table-data"><p>2</p></td>
            </tr>
         </table>
      </div>
   </div>
</template>

<style scoped>
   .erkki-video {
      display: flex;
      justify-content: center;
      align-items: center;
   }

   th {
      background-color: rgb(0 119 138 / var(--tw-bg-opacity));
   }
   .table-container {
      @apply my-6;
   }

   .table-desc {
      @apply text-xl font-extrabold;
   }
   .course-table {
      @apply mt-4 table-fixed w-full;
   }
   .table-header {
      @apply text-left break-words py-4 px-2;
   }
   .table-data {
      @apply break-words py-2 px-3;
   }
   .data-row {
      @apply odd:bg-stone-200;
   }
   .data-row {
      @apply dark:odd:bg-neutral-700;
   }
</style>
