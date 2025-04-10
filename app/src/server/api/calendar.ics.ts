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
   let icsContent = `BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Serveri ry//Events//EN
CALSCALE:GREGORIAN
METHOD:PUBLISH
`;

   events.forEach((event: any, index: number) => {
      // Select language-specific fields based on the locale
      const title = selectedLocale === 'fi' ? event.fi_otsikko : event.en_otsikko || 'Untitled Event';
      const description = selectedLocale === 'fi' ? event.fi_kuvaus : event.en_kuvaus || '';
      const startDate = formatDateUTC(event.alku_aika);
      const endDate = event.loppu_aika ? formatDateUTC(event.loppu_aika) : '';
      const location = formatLocation(event.sijainti || '');
      const imageUrl = event.image || '';

      // Generate a unique UID for each event
      const uid = `event-${index}-${Date.now()}@serveriry.fi`;

      // Preprocess the description
      let fullDescription = description;
      if (imageUrl) {
         fullDescription += ` Picture: ${imageUrl}`; // Append the image URL to the description
      }
      fullDescription = escapeText(fullDescription);

      icsContent += `BEGIN:VEVENT
UID:${uid}
SUMMARY:${escapeText(title)}
DTSTART:${startDate}
`;

      // Include DTEND only if an end date is provided
      if (endDate) {
         icsContent += `DTEND:${endDate}
`;
      }

      // Include LOCATION only if it's not empty
      if (location) {
         icsContent += `LOCATION:${escapeText(location)}
`;
      }

      // Include the processed DESCRIPTION
      icsContent += `DESCRIPTION:${fullDescription}
`;

      icsContent += `END:VEVENT
`;
   });

   icsContent += 'END:VCALENDAR';

   // Set response headers to return the ICS file
   event.node.res.setHeader('Content-Disposition', `attachment; filename="tapahtumat-${selectedLocale}.ics"`);
   event.node.res.setHeader('Content-Type', 'text/calendar; charset=utf-8');

   // Send the ICS content as the response
   return send(event, icsContent);
});

// Helper function to format date for ICS file in UTC
function formatDateUTC(dateString: string) {
   const date = new Date(dateString);

   date.setHours(date.getHours() - 2);

   const year = date.getUTCFullYear().toString().padStart(4, '0');
   const month = (date.getUTCMonth() + 1).toString().padStart(2, '0');
   const day = date.getUTCDate().toString().padStart(2, '0');

   const hours = date.getUTCHours().toString().padStart(2, '0');
   const minutes = date.getUTCMinutes().toString().padStart(2, '0');
   const seconds = date.getUTCSeconds().toString().padStart(2, '0');

   return `${year}${month}${day}T${hours}${minutes}${seconds}Z`;
}

// Helper function to escape special characters in text fields and remove newlines
function escapeText(text: string) {
   // Replace special characters with escaped versions and remove newlines
   let escapedText = text
      .replace(/\\/g, '\\\\') // Escape backslashes
      .replace(/;/g, '\\;') // Escape semicolons
      .replace(/,/g, '\\,') // Escape commas
      .replace(/\r?\n/g, ''); // Replace newlines with a space

   // Split long lines into segments of 75 characters or less, with a space at the start of new lines
   const lines = [];
   while (escapedText.length > 75) {
      lines.push(escapedText.substring(0, 75));
      escapedText = ' ' + escapedText.substring(75);
   }
   lines.push(escapedText);

   return lines.join('\n');
}

// Helper function to convert POINT format to "latitude, longitude"
function formatLocation(point: string) {
   const match = point.match(/POINT\s*\(([^ ]+) ([^ ]+)\)/);
   if (match) {
      const longitude = match[1];
      const latitude = match[2];
      return `${latitude} ${longitude}`;
   }
   return ''; // Return an empty string if the format doesn't match
}
