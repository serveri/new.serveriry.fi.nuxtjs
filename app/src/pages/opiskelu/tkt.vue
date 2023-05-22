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
         <h2 class="text-xl font-bold mt-2 mb-3">
            Jos mietit kannattaisiko alaa alkaa opiskelemaan niin olet oikealla sivulla
         </h2>
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

      <div>
         <div class="table-container">
            <div>
               <h2 class="table-desc">Yleisopinnot</h2>
               <p>Yleisopinnot tukevat opiskelua erityisesti ensimmäisenä opiskeluvuotena.</p>
            </div>

            <table class="course-table">
               <thead>
                  <tr>
                     <th class="table-header name"><p class="text-white">Opintojakso</p></th>

                     <th class="table-header desc"><p class="text-white">Kurssikuvaus</p></th>

                     <th class="table-header credits"><p class="text-white">Laajuus (opintopisteet)</p></th>
                  </tr>
               </thead>
               <tbody>
                  <tr
                     v-for="course in courses.filter((item: { tyyppi: string }) => item.tyyppi == 'yleisopinnot')"
                     :key="course.name"
                     class="table-row"
                  >
                     <td class="table-data">
                        <p>{{ course.nimi }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.kuvaus }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.laajuus }}</p>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div class="table-container">
            <div>
               <h2 class="table-desc">Perusopinnot</h2>
               <p>
                  Perusopinnot antavat kokonaiskuvan tietojenkäsittelytieteestä ja rakentavat perustan aineopintojen
                  kursseille.
               </p>
            </div>

            <table class="course-table">
               <thead>
                  <tr>
                     <th class="table-header name"><p class="text-white">Opintojakso</p></th>

                     <th class="table-header desc"><p class="text-white">Kurssikuvaus</p></th>

                     <th class="table-header credits"><p class="text-white">Laajuus (opintopisteet)</p></th>
                  </tr>
               </thead>
               <tbody>
                  <tr
                     v-for="course in courses.filter((item: { tyyppi: string }) => item.tyyppi == 'perusopinnot')"
                     :key="course.name"
                     class="table-row"
                  >
                     <td class="table-data">
                        <p>{{ course.nimi }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.kuvaus }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.laajuus }}</p>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div class="table-container">
            <div>
               <h2 class="table-desc">Pakolliset Aineopinnot</h2>
               <p>
                  Aineopintojen kursseilla opiskellaan tietojenkäsittelytieteen keskeiset perusasiat, jotka antavat
                  teoreettiset perustiedot ja käytännön osaamista alan tehtäviin. Tämä muodostaa pohjan
                  maisteriopinnoille.
               </p>
            </div>

            <table class="course-table">
               <thead>
                  <tr>
                     <th class="table-header name"><p class="text-white">Opintojakso</p></th>

                     <th class="table-header desc"><p class="text-white">Kurssikuvaus</p></th>

                     <th class="table-header credits"><p class="text-white">Laajuus (opintopisteet)</p></th>
                  </tr>
               </thead>
               <tbody>
                  <tr
                     v-for="course in courses.filter((item: { tyyppi: string }) => item.tyyppi == 'pakolliset')"
                     :key="course.name"
                     class="table-row"
                  >
                     <td class="table-data">
                        <p>{{ course.nimi }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.kuvaus }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.laajuus }}</p>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div class="table-container">
            <div>
               <h2 class="table-desc">Valinnaiset aineopinnot</h2>
               <p>Valinnaisia aineopintoja kuuluu tutkintoon vähintään 5 op. Ne sijoittuvat toiseen ja kolmanteen opiskeluvuoteen. Kurssit käsittelevät tietojenkäsittelyn erilaisia kiinnostavia osa-alueita, jotka tukevat ammatillista osaamista ja antavat osaltaan pohjaa maisteriopinnoille.</p>
            </div>

            <table class="course-table">
               <thead>
                  <tr>
                     <th class="table-header name"><p class="text-white">Opintojakso</p></th>

                     <th class="table-header desc"><p class="text-white">Kurssikuvaus</p></th>

                     <th class="table-header credits"><p class="text-white">Laajuus (opintopisteet)</p></th>
                  </tr>
               </thead>
               <tbody>
                  <tr
                     v-for="course in courses.filter((item: { tyyppi: string }) => item.tyyppi == 'valinnaiset')"
                     :key="course.name"
                     class="table-row"
                  >
                     <td class="table-data">
                        <p>{{ course.nimi }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.kuvaus }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.laajuus }}</p>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div class="table-container">
            <div>
               <h2 class="table-desc">Kieli- ja viestintäopinnot</h2>
               <p>Kieli- ja viestintäopinnot tukevat tietojenkäsittelytieteen opintoja ja antavat perustaidot ruotsin ja englannin kielten akateemiselle osaamiselle.</p>
            </div>

            <table class="course-table">
               <thead>
                  <tr>
                     <th class="table-header name"><p class="text-white">Opintojakso</p></th>

                     <th class="table-header desc"><p class="text-white">Kurssikuvaus</p></th>

                     <th class="table-header credits"><p class="text-white">Laajuus (opintopisteet)</p></th>
                  </tr>
               </thead>
               <tbody>
                  <tr
                     v-for="course in courses.filter((item: { tyyppi: string }) => item.tyyppi == 'kieliviesti')"
                     :key="course.name"
                     class="table-row"
                  >
                     <td class="table-data">
                        <p>{{ course.nimi }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.kuvaus }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.laajuus }}</p>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div class="table-container">
            <div>
               <h2 class="table-desc">Syventävät opinnot</h2>
               <p>Yleisopinnot tukevat opiskelua erityisesti ensimmäisenä opiskeluvuotena.</p>
            </div>

            <table class="course-table">
               <thead>
                  <tr>
                     <th class="table-header name"><p class="text-white">Opintojakso</p></th>

                     <th class="table-header desc"><p class="text-white">Kurssikuvaus</p></th>

                     <th class="table-header credits"><p class="text-white">Laajuus (opintopisteet)</p></th>
                  </tr>
               </thead>
               <tbody>
                  <tr
                     v-for="course in courses.filter((item: { tyyppi: string }) => item.tyyppi == 'syventavat')"
                     :key="course.name"
                     class="table-row"
                  >
                     <td class="table-data">
                        <p>{{ course.nimi }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.kuvaus }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.laajuus }}</p>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>

          <div class="table-container">
            <div>
               <h2 class="table-desc">Valinnaiset syventävät opinnot</h2>
               <p>Valinnaiset syventävät opintojaksot vuorottelevat eri vuosina. Valinnaisia syventävien opintojen opintojaksoja sopii tutkintoon 30-40 op tai jopa enemmän, riippuen omasta HOPS:sta. Valinnaiset syventävät opintojaksot kannattaa valinta omaan syventävien opintojen suuntautumiseen eli HOPS:iin sopiviksi sen lisäksi että ne sopivat omiin kiinnostuksen kohteisiin ja työllistymisen tukemiseen.</p>
            </div>

            <table class="course-table">
               <thead>
                  <tr>
                     <th class="table-header name"><p class="text-white">Opintojakso</p></th>

                     <th class="table-header desc"><p class="text-white">Kurssikuvaus</p></th>

                     <th class="table-header credits"><p class="text-white">Laajuus (opintopisteet)</p></th>
                  </tr>
               </thead>
               <tbody>
                  <tr
                     v-for="course in courses.filter((item: { tyyppi: string }) => item.tyyppi == 'val-syventavat')"
                     :key="course.name"
                     class="table-row"
                  >
                     <td class="table-data">
                        <p>{{ course.nimi }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.kuvaus }}</p>
                     </td>

                     <td class="table-data">
                        <p>{{ course.laajuus }}</p>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
   let courses;
   try {
      const { data } = await useFetch('https://api.serveri.jeb4.dev/items/tutkinto_rakenne');
      courses = data.value.data;
   } catch (e) {
      courses = [
         {
            tyyppi: 'valinnaiset',
            nimi: 'Api error',
            laajuus: '4.00',
            kuvaus:
               'Ohjelmistovirheet, testauksen vaiheet, testausmenetelmät, regressiotestaus, testauksen automatisointi, testausprosessin kehittäminen ',
            sort: 1,
         },
         { tyyppi: 'sivuaine', nimi: 'Api error', laajuus: '25.00', kuvaus: 'matikkaa voi opiskella :D', sort: 2 },
         {
            tyyppi: 'pakolliset',
            nimi: 'Api error',
            laajuus: '5.00',
            kuvaus:
               'Propositio- ja predikaattilogiikka, joukko-oppi, funktiot ja relaatiot, kombinatoriikka, graafiteoria, matemaattinen induktio',
            sort: 3,
         },
         {
            tyyppi: 'kieliviesti',
            nimi: 'Api error',
            laajuus: '2.00',
            kuvaus:
               'opintojen ja työelämän kannalta keskeiset tekstilajit sekä tieteen viestinnän erityispiirteet\noikeakielisyys ja huoliteltu teksti\nargumentoinnin keinot\ntyyli ja tarkoituksenmukainen sävy\nkriittinen lukutapa ja tekstianalyysi\nkirjoitusprosessin hallinta ja erityisesti oman kandidaatintutkielman työstäminen\ntekstien kohdentaminen lukijoille ja yleistajuinen viestintä\nrakentavan palautteen antaminen ja vastaanottaminen ',
            sort: 4,
         },
         {
            tyyppi: 'yleisopinnot',
            nimi: 'Api error',
            laajuus: '1.00',
            kuvaus:
               'Opiskelija tutustuu oppiaine- ja vertaistuutoroinnin, verkkomateriaalin, erilaisten orientaatiotapahtumien sekä oheismateriaalin avulla yliopistoon opiskeluympäristönä ja oppimisyhteisönä. Erityisesti tutustutaan oman oppiaineen opiskelukäytäntöihin ja opiskelua tukeviin palveluihin. Lisäksi saadaan tietoa akateemisen opiskelun edellyttämistä tiedoista ja taidoista sekä opiskelukyvystä ja sen ylläpitämisestä. ',
            sort: 6,
         },
         {
            tyyppi: 'perusopinnot',
            nimi: 'Api error',
            laajuus: '5.00',
            kuvaus:
               'Informaatio, sen esittäminen ja tallentaminen ja sen käsittelemisen automatisointi. Ohjelmointi, ohjelmointikielet, ja kuinka niillä luodaan ohjelmia ja ohjelmistoja. Tiedon mallintaminen, tietokannat, tietoverkot ja kuinka tietoa hallitaan. Laskennan rajat. Suunnittelu, design ja älykkäät järjestelmät. Tietojenkäsittelyn ja tietojenkäsittelijän tehtävät ja vastuut yhteiskunnassa. ',
            sort: 9,
         },
      ];
   }
   const pakolliset = courses.filter((item: { tyyppi: string }) => item.tyyppi == 'valinnaiset');
</script>

<style scoped>
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
   .table-row {
      @apply even:bg-stone-100 odd:bg-stone-200 dark:odd:bg-stone-700 dark:even:bg-stone-800;
   }

   .credits {
      @apply w-[22%] sm:w-1/3;
   }
   .name {
      @apply w-[31%] sm:w-1/3;
   }
   .desc {
      @apply w-[47%] sm:w-1/3;
   }
</style>
