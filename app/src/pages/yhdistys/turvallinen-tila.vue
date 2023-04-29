<template>
   <div>
      <Head>
         <Title>{{ $t('title_safe-space') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_safe-space') }}</h1>

      <p>{{ $i18n.locale === 'en' ? content.en.p1 : content.fi.p1 }}</p>
      <br />

      <ol>
         <li>{{ $i18n.locale === 'en' ? content.en.l1 : content.fi.l1 }}</li>

         <li>{{ $i18n.locale === 'en' ? content.en.l2 : content.fi.l2 }}</li>

         <li>{{ $i18n.locale === 'en' ? content.en.l3 : content.fi.l3 }}</li>

         <li>{{ $i18n.locale === 'en' ? content.en.l4 : content.fi.l4 }}</li>

         <li>{{ $i18n.locale === 'en' ? content.en.l5 : content.fi.l5 }}</li>

         <li>{{ $i18n.locale === 'en' ? content.en.l6 : content.fi.l6 }}</li>
      </ol>

      <p>{{ $i18n.locale === 'en' ? content.en.p2 : content.fi.p2 }}</p>
      <br />

      <p>{{ $i18n.locale === 'en' ? content.en.p3 : content.fi.p3 }}</p>
      <br />
      <br />
   </div>
</template>

<script setup>
   const content = {
      fi: {
         p1: `"Turvallisemmat tilat" on termi, jota käytetään kuvaamaan yhteisön ponnistuksia luoda ympäristöjä, jotka edistävät turvallisuutta. Käytännössä turvallisempi tila edellyttää opiskelijajärjestön ja sen jäsenten vastuunottoa haastavissa tilanteissa. Konflikteja käsitellään sen sijaan että niitä siedettäisiin.`,
         l1: `On tärkeää olla kunnioittava ja välttää kysymyksiä toisen erilaisuudesta. Käsittele herkkiä aiheita huolellisesti ja varmista, että kaikilla on ääni ja heidät otetaan huomioon.`,
         l2: `Kunnioita jokaisen fyysistä ja henkistä hyvinvointia sekä heidän oikeuttaan itsemääräämiseen. Älä tee oletuksia stereotypioiden perusteella.`,
         l3: `Vältä rasististen tai syrjivien stereotypioiden uusintamista, vaikka se olisi tarkoitus tehdä "vitsinä" tai ironisesti. Älä häiritse ketään sanallisesti, fyysisesti tai visuaalisesti. Jos joku sanoo "ei", kunnioita heidän rajojaan ja muuta käyttäytymistäsi tarvittaessa.`,
         l4: `Jos tilanne tuntuu epämukavalta, kerro siitä järjestön hallitukselle tai johtajille. Voit myös antaa palautetta nimettömänä.`,
         l5: `On tärkeää olla kunnioittava ja välttää kysymyksiä toisen erilaisuudesta. Käsittele herkkiä aiheita huolellisesti ja varmista, että kaikilla on ääni ja heidät otetaan huomioon.`,
         l6: `On olennaista puuttua, jos todistat rasismia, syrjintää, häirintää tai muuta sopimatonta käytöstä.`,
         p2: `Valerija Kirpu toimii häirintäyhteyshenkilönä Serveri ry:ssä, hänen roolissaan sosiaalipoliittisena edustajana.`,
         p3: `Osallistumalla Serveri ry:hyn jäsenet sitoutuvat noudattamaan tätä käytännesääntöä ja tukemaan positiivista ja kunnioittavaa yhteisöä. Tämän käytännesäännön rikkomukset voivat johtaa kurinpitotoimenpiteisiin, mukaan lukien poistaminen Serveri ry:stä.`,
      },
      en: {
         p1: `Safer spaces" is a term used to describe the communal effort to create environments that promote safety. In
         practice, a safer space involves the student organization and its members taking responsibility for challenging
         situations. Conflicts are addressed instead of being tolerated.`,
         l1: `It is important to be respectful, avoiding any questioning of someone's differences. Handle sensitive
            topics with care, and ensure that everyone has a voice and is included.`,
         l2: `Respect everyone's physical and mental well-being, as well as their right to self-determination. Do not make
            assumptions based on stereotypes.`,
         l3: `Avoid reproducing racist or discriminatory stereotypes, even if intended as "jokes" or irony. Do not harass
            anyone verbally, physically, or visually. If someone says "no," respect their boundaries and change your
            behavior if necessary.`,
         l4: `If a situation feels uncomfortable, raise it with the organization's board or leadership. You can also give
            feedback anonymously.`,
         l5: `It is important to be respectful, avoiding any questioning of someone's differences. Handle sensitive
            topics with care, and ensure that everyone has a voice and is included.`,
         l6: `It is essential to intervene if you witness racism, discrimination, harassment, or any other inappropriate
            behavior.`,
         p2: `Valerija Kirpu serves as our harassment contact person at Serveri ry, in her role as the social policy
         representative.`,
         p3: `By participating in the Serveri ry, members agree to adhere to this Code of Conduct and support a positive and respectful community. Any violations of this Code of Conduct may result in disciplinary action, up to and including removal from the Serveri ry.`,
      },
   };
</script>

<style>
   h2 {
      @apply text-xl;
   }

   ol {
      list-style-type: decimal;
      @apply pl-8;
   }

   li {
      @apply mb-4 dark:text-white ;
   }
</style>
