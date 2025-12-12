// Removed explicit h3 import; Nuxt/Nitro provides server utilities via auto-import
export default defineEventHandler(async (event) => {
   const config = useRuntimeConfig();
   const query = getQuery(event);
   const qLang = Array.isArray(query.lang) ? query.lang[0] : query.lang; // normalize lang
   const selectedLocale = qLang === 'en' ? 'en' : 'fi'; // Default to 'fi'

   let events: any[] = [];

   // Fetch events from the API using Nitro $fetch for server compatibility
   try {
      const data = await $fetch<{ data: any[] }>(`${config.public.API_URL}items/tapahtuma`);
      const today = new Date();

      events = (data?.data ?? []).filter((item: any) => {
         const start = new Date(item.alku_aika);
         return !Number.isNaN(start.getTime()) && start >= today;
      });

      // Add image link to events safely
      events.forEach((ev: any) => {
         const kuva = ev?.kuva;
         ev.image = kuva
            ? `${config.public.API_URL}assets/${kuva}`
            : `${config.public.API_URL}assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f`;
      });
   } catch (error) {
      console.error('Error fetching events:', error);
      throw createError({ statusCode: 500, message: 'Failed to fetch events' });
   }

   // Generate ICS file content with CRLF line endings
   let icsContent =
      `BEGIN:VCALENDAR\r\n` +
      `VERSION:2.0\r\n` +
      `PRODID:-//Serveri ry//Events//EN\r\n` +
      `CALSCALE:GREGORIAN\r\n` +
      `METHOD:PUBLISH\r\n`;

   events.forEach((ev: any, index: number) => {
      const title = selectedLocale === 'fi' ? ev.fi_otsikko : ev.en_otsikko || 'Untitled Event';
      const description = selectedLocale === 'fi' ? ev.fi_kuvaus : ev.en_kuvaus || '';
      const startDate = formatDateUTC(ev.alku_aika);
      const endDate = ev.loppu_aika ? formatDateUTC(ev.loppu_aika) : '';
      const location = formatLocation(ev.sijainti || '');
      const imageUrl = ev.image || '';

      const uid = `event-${index}-${Date.now()}@serveriry.fi`;

      let fullDescription = description;
      if (imageUrl) fullDescription += ` Picture: ${imageUrl}`;
      fullDescription = escapeText(fullDescription);

      icsContent += `BEGIN:VEVENT\r\n`;
      icsContent += `UID:${uid}\r\n`;
      icsContent += `SUMMARY:${escapeText(title)}\r\n`;
      icsContent += `DTSTART:${startDate}\r\n`;
      if (endDate) icsContent += `DTEND:${endDate}\r\n`;
      if (location) icsContent += `LOCATION:${escapeText(location)}\r\n`;
      icsContent += `DESCRIPTION:${fullDescription}\r\n`;
      icsContent += `END:VEVENT\r\n`;
   });

   icsContent += 'END:VCALENDAR';

   event.node.res.setHeader('Content-Disposition', `attachment; filename="tapahtumat-${selectedLocale}.ics"`);
   event.node.res.setHeader('Content-Type', 'text/calendar; charset=utf-8');

   return send(event, icsContent);
});

// Helper function to format date for ICS file in UTC
function formatDateUTC(dateString: string) {
   const date = new Date(dateString);
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
   let escapedText = (text || '')
      .replace(/\\/g, '\\\\')
      .replace(/;/g, '\\;')
      .replace(/,/g, '\\,')
      .replace(/\r?\n/g, '');

   const lines: string[] = [];
   while (escapedText.length > 75) {
      lines.push(escapedText.substring(0, 75));
      escapedText = ' ' + escapedText.substring(75);
   }
   lines.push(escapedText);
   return lines.join('\r\n');
}

// Helper function to convert POINT format to "latitude, longitude"
function formatLocation(point: unknown) {
   // Accept various formats: WKT string "POINT (lon lat)", GeoJSON { type: 'Point', coordinates: [lon, lat] }, or null/undefined
   if (typeof point === 'string') {
      const match = point.match(/POINT\s*\(([^ ]+)\s+([^ ]+)\)/);
      if (match) {
         const longitude = match[1];
         const latitude = match[2];
         return `${latitude} ${longitude}`;
      }
      return '';
   }

   // Handle GeoJSON-like object
   if (point && typeof point === 'object') {
      const obj = point as { type?: string; coordinates?: [number, number] | number[] };
      if (obj.type === 'Point' && Array.isArray(obj.coordinates) && obj.coordinates.length >= 2) {
         const [longitude, latitude] = obj.coordinates as [number, number];
         return `${latitude} ${longitude}`;
      }
   }

   return '';
}