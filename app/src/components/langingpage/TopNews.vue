<template>
  <div class="flex flex-col lg:ml-auto mt-8 sm:mt-0">
    <!-- Using the $t helper in template remains valid if configured -->
    <h2 class="custom-page-title uppercase">{{ $t('coming-events') }}</h2>
    <div class="p-4 sm:py-6 sm:px-12 flex flex-col self-center w-full sm:w-2/3 md:w-1/2 lg:w-full border border-gray-200 rounded-lg shadow dark:border-gray-700">
      <div v-if="events.length > 0">
        <div v-for="event in events" :id="event.link" :key="event.link">
          <ComingEvent
            v-if="event?.id"
            :en_otsikko="event.en_otsikko"
            :fi_otsikko="event.fi_otsikko"
            :alku_aika="event.alku_aika"
            :link="event.id"
          />
        </div>
      </div>
      <!-- Use the new localePath composable for generating localized paths -->
      <nuxt-link :to="localePath('/yhdistys/tapahtumat')" class="flex flex-col items-center pt-3">
        <button class="btn-custom-primary" type="button">{{ $t('show-all-coming-events') }}</button>
      </nuxt-link>
    </div>
  </div>
</template>

<script setup lang="ts">
// Import the necessary composable from i18n.
// In Nuxt 3 with @nuxtjs/i18n v9, these composables are auto-imported from '#i18n'.
import { useLocalePath, useI18n } from '#i18n';
import ComingEvent from '@/components/langingpage/ComingEvent.vue';
import type { Data } from '@/types';

const config = useRuntimeConfig();

// Create the composable instance for locale path generation.
const localePath = useLocalePath();
// Optionally, if you need to use translation in the script section,
// you can also destructure the t function (note: $t in template still works).
const { t } = useI18n();

interface Event {
  id: string;
  en_otsikko: string;
  fi_otsikko: string;
  alku_aika: string;
  link: string;
}

let events: Event[] = [];
try {
  const { data } = (await useFetch(`${config.public.API_URL}items/tapahtuma`)) as { data: Data };
  const fetchedEvents = data.value.data as Event[];

  const today = new Date();
  const futureEvents = fetchedEvents.filter((item) => {
    const eventDate = new Date(item?.alku_aika);
    return !isNaN(eventDate.getTime()) && eventDate >= today;
  });

  futureEvents.sort((a, b) => new Date(a.alku_aika).getTime() - new Date(b.alku_aika).getTime());
  events = futureEvents.slice(0, 5);
} catch (error) {
  console.error('Failed to fetch events:', error);
  events = [];
}
</script>
