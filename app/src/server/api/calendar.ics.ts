// server/api/calendar.ts

import { H3Event, send, defineEventHandler, getQuery, createError } from 'h3';
import { useRuntimeConfig } from '#imports';

export default defineEventHandler(async (event: H3Event) => {
   const config = useRuntimeConfig();
   const query = getQuery(event);
   const selectedLocale = query.lang === 'en' ? 'en' : 'fi'; // Default to 'fi' if no language specified

   let events = [];

   // Fetch events from the API
   try {
      const response = await fetch(`${config.public.API_URL}items/tapahtuma`);
      const data = await response.json();
      const today = new Date();

      events = data.data.filter((item: any) => new Date(item.alku_aika) >= today);

      // Add image link to events
      events.forEach((event: any) => {
         event.image = event.kuva
            ? `${config.public.API_URL}assets/${event.kuva}`
            : `${config.public.API_URL}assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f`;
      });
   } catch (error) {
      console.error('Error fetching events:', error);
      throw createError({ statusCode: 500, message: 'Failed to fetch events' });
   }

   // Generate ICS file content
   let icsContent = 'BEGIN:VCALENDAR\nVERSION:2.0\nPRODID:-//Serveri ry//Events//EN\n';

   events.forEach((event: any) => {
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

   // Set response headers to return the ICS file
   event.node.res.setHeader('Content-Disposition', `attachment; filename="tapahtumat-${selectedLocale}.ics"`);
   event.node.res.setHeader('Content-Type', 'text/calendar; charset=utf-8');

   // Send the ICS content as the response
   return send(event, icsContent);
});

// Helper function to format date for ICS file
function formatDate(dateString: string) {
   const date = new Date(dateString);
   return date.toISOString().replace(/[-:]/g, '').split('.')[0];
}
