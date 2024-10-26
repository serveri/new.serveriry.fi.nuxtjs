<script setup lang="ts">
   import { onMounted } from 'vue';
   import { useI18n } from 'vue-i18n';
   const { locale } = useI18n(); // Get the current locale
   const config = useRuntimeConfig();

   let events = [];

   // Fetch events from the API
   async function fetchEvents() {
      try {
         const { data } = await useFetch(`${config.public['API_URL']}items/tapahtuma`);
         const today = new Date();
         events = data.value.data.filter((item) => new Date(item.alku_aika) >= today);

         // Add image link to events
         events.forEach((event) => {
            event.image = event.kuva
               ? `${config.public['API_URL']}assets/${event.kuva}`
               : `${config.public['API_URL']}assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f`;
         });

         // Create ICS file
         createICSFile(locale.value);
      } catch (error) {
         console.error('Error fetching events:', error);
      }
   }

   // Create an ICS file from events and download it
   function createICSFile(selectedLocale = 'fi') {
      let icsContent = 'BEGIN:VCALENDAR\nVERSION:2.0\nPRODID:-//Serveri ry//Events//EN\n';

      events.forEach(event => {
         // Select language-specific fields based on the locale
         const title = selectedLocale === 'fi' ? event.fi_otsikko : event.en_otsikko || 'Untitled Event';
         const description = selectedLocale === 'fi' ? event.fi_kuvaus : event.en_kuvaus || '';
         const startDate = formatDate(event.alku_aika);
         const endDate = event.loppu_aika ? formatDate(event.loppu_aika) : '';
         const location = event.sijainti || '';
         const imageUrl = event.image || '';

         icsContent += `BEGIN:VEVENT\n`;
         icsContent += `SUMMARY:${title}\n`;
         icsContent += `DTSTART:${startDate}\n`;

         // Include DTEND only if an end date is provided
         if (endDate) {
            icsContent += `DTEND:${endDate}\n`;
         }

         // Include LOCATION only if it's not empty
         if (location) {
            icsContent += `LOCATION:${location}\n`;
         }

         // Include DESCRIPTION and add the image URL if it exists
         let fullDescription = description;
         if (imageUrl) {
            fullDescription += `\\n\\nImage: ${imageUrl}`;
         }
         icsContent += `DESCRIPTION:${fullDescription}\n`;

         icsContent += `END:VEVENT\n`;
      });

      icsContent += 'END:VCALENDAR';

      // Create the Blob and download the ICS file
      const blob = new Blob([icsContent], { type: 'text/calendar' });
      const link = document.createElement('a');
      link.href = URL.createObjectURL(blob);
      link.download = `tapahtumat-${selectedLocale}.ics`; // Add locale to the file name
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
   }

   // Format date for ICS file
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
      <h1 class="custom-page-title text-left font-bold">
         {{ locale === 'fi' ? 'Tulevat tapahtumat' : 'Upcoming events' }}
      </h1>
      <p>
         {{ locale === 'fi' ? 'Tästä voit ladata tapahtumat omaan kalenteriisi.' : 'You can download the events to your own calendar from here.' }}
      </p>
   </div>
</template>

<style scoped></style>
