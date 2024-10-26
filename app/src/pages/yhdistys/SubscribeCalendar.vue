<script setup lang="ts">
   import { onMounted } from 'vue';
   const config = useRuntimeConfig();

   let events = [];

   // Hae tapahtumat API:sta
   async function fetchEvents() {
      try {
         const { data } = await useFetch(`${config.public['API_URL']}items/tapahtuma`);
         const today = new Date();
         events = data.value.data.filter((item) => new Date(item.alku_aika) >= today);

         // Lisää kuvalinkki tapahtumiin
         events.forEach((event) => {
            event.image = event.kuva
               ? `${config.public['API_URL']}assets/${event.kuva}`
               : `${config.public['API_URL']}assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f`;
         });

         // Luo ICS-tiedosto
         createICSFile();
      } catch (error) {
         console.error('Virhe tapahtumien hakemisessa:', error);
      }
   }

   // Luo ICS-tiedosto tapahtumista ja lataa se
   function createICSFile() {
      let icsContent = 'BEGIN:VCALENDAR\nVERSION:2.0\nPRODID:-//Serveri ry//Tapahtumat//EN\n';

      events.forEach(event => {
         const title = event.fi_otsikko || event.en_otsikko;
         const description = event.fi_kuvaus || event.en_kuvaus;

         icsContent += `BEGIN:VEVENT\n`;
         icsContent += `SUMMARY:${title}\n`;
         icsContent += `DTSTART:${formatDate(event.alku_aika)}\n`;
         icsContent += `DTEND:${formatDate(event.loppu_aika)}\n`;
         icsContent += `LOCATION:${event.sijainti || ''}\n`;
         icsContent += `DESCRIPTION:${description || ''}\n`;
         icsContent += `END:VEVENT\n`;
      });

      icsContent += 'END:VCALENDAR';

      // Luo Blob tiedostona ja lataa se
      const blob = new Blob([icsContent], { type: 'text/calendar' });
      const link = document.createElement('a');
      link.href = URL.createObjectURL(blob);
      link.download = 'tapahtumat.ics';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
   }

   // Muotoile päivämäärä ICS-muotoon
   function formatDate(dateString) {
      const date = new Date(dateString);
      return date.toISOString().replace(/[-:]/g, '').split('.')[0];
   }

   onMounted(() => {
      fetchEvents();
   });
</script>

<template>
   <div>
      <h1 class="custom-page-title text-left font-bold">{{
            $i18n.locale === 'fi'
               ? 'Tulevat tapahtumat'
               : 'Upcoming events'
         }}</h1>
      <p>
         {{
            $i18n.locale === 'fi'
               ? 'Tästä voit ladata tapahtumat omaan kalenteriisi.'
               : 'You can download the events to your own calendar from here.'
         }}
      </p>
   </div>
</template>

<style scoped></style>
