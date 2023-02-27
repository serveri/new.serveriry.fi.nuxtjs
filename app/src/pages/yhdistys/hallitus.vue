<template>
   <div>
      <Head>
         <Title>{{ $t('title_board') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_board') }}</h1>

      <p>
         Serverin hallitus vastaa ainejärjestötoiminnan käytännön asioiden hoidosta. Asioita tehdään yhdessä, mutta
         käytännön syistä tehtäviä on jaettu "hallitusrooleihin" jäsenten kiinnostuksen ja osaamisen mukaan. Mikäli
         haluat olla yhteydessä hallitukseen, tapahtuu se helpoiten sähköpostitse hallitus[ät]serveriry.fi tai Serverin
         jäsenenä löydät kaikki hallituslaiset myös Oppositiosta.
      </p>
      <br />
      <p>
         Serverin hallituksen jäsenet vaihtuvat vuosittain ja heidät valitaan kaikille jäsenille avoimessa
         syyskokouksessa. Ainejärjestötoiminnan sisältö mukautuu aikaan, mutta hallituksen varsinaiset tehtävät
         muuttuvat harvemmin ja hitaammin. Mikäli ainejärjestötoiminta kiinnostaa, kannattaa harkita hallitustoimintaan
         mukaan lähtemistä! Syyskokouksessa valitut jäsenet järjestäytyvät hallituskautensa alussa ja valitsevat
         keskuudestaan vastuuhenkilöt eri osaalueiden hoitamiseen. Vastuuhenkilöiden titteleistä saa jo hyvän kuvan
         siitä, minkälaista hallitustoiminta on.
      </p>
      <br />
      <p>
         Serverin hallituksen koko määräytyy syyskokouksessa ja tällä kaudella se koostuu 15:sta varsinaisesta ja 5:stä
         varajäsenestä. Hallituslaisiin ja heidän rooleihinsa voit tutustua alta, josta löydät myös yhteystiedot.
         Roolikohtaisten sähköpostiosotteiden lisäksi jokaisella hallituksen varsinaisella- ja varajäsenellä on
         henkilökohtainen sähköpostiosoite muodossa etunimi.sukunimi[ät]serveriry.fi.
      </p>

      <h2 class="opposition-header font-extrabold text-2xl mt-3.5 mb-3.5">Serverin Oppositio</h2>
      <p class="opposition-textmt-3.5 mb-3.5">
         Kiinnostaako ainejärjestötoiminta? Serverin Oppositio on ryhmä Telegramissa, jossa pääsee seuraamaan
         ainejärjestötoimintaa hieman lähempää. Ryhmään liittyminen ei sido mihinkään ja voit liittyä/poistua täysin
         vapaasti. Tervetuloa mukaan! Liittymislinkki TG-ryhmään.
      </p>

      <h2 class="board-header font-extrabold mt-8 mb-1 text-3xl">Kokoonpano</h2>

      <div class="board-members p-8">
         <div class="grid grid-cols-1 gap-8 md:grid-cols-2 md:gap-8 lg:grid-cols-4 lg:gap-8">
            <CommitteeCard img="/_nuxt/assets/images/jäsenkuva.jpeg" img2="/_nuxt/assets/images/jäsenkuva2.jpeg"/>
            <CommitteeCard img="/_nuxt/assets/images/jäsenkuva.jpeg" img2="/_nuxt/assets/images/jäsenkuva2.jpeg"/>
            <CommitteeCard img="/_nuxt/assets/images/jäsenkuva.jpeg" img2="/_nuxt/assets/images/jäsenkuva2.jpeg"/>
            <CommitteeCard img="/_nuxt/assets/images/jäsenkuva.jpeg" img2="/_nuxt/assets/images/jäsenkuva2.jpeg"/>
            <CommitteeCard img="/_nuxt/assets/images/jäsenkuva.jpeg" img2="/_nuxt/assets/images/jäsenkuva2.jpeg"/>
         </div>
      </div>
   </div>
</template>
