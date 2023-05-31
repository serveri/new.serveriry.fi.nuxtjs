<template>
   <div>
      <Head>
         <Title>{{ $t('title_events') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_events') }}</h1>

      <h1 class="custom-page-title text-left font-bold">{{ $t('h1_events_coming') }}</h1>

      <div class="news p-8 sm:px-0">
         <div class="grid grid-cols-1 gap-8 md:grid-cols-2 md:gap-8 lg:grid-cols-3 lg:gap-7">
            <EvetsCard
               v-for="item in events.futureData"
               :id="item.id"
               :key="item.id"
               :url="item.id"
               :img="item.image"
               :fi_title="item.fi_otsikko"
               :en_title="item.en_otsikko"
               :start_time="new Date(item.alku_aika)"
               :fi_text="item.fi_kuvaus"
               :en_text="item.en_kuvaus"
            />
         </div>
      </div>

      <h1 class="custom-page-title text-left font-bold">{{ $t('h1_events_past') }}</h1>

      <div class="news p-8 sm:px-0">
         <div class="grid grid-cols-1 gap-8 md:grid-cols-2 md:gap-8 lg:grid-cols-3 lg:gap-7">
            <EvetsCard
               v-for="item in events.pastData"
               :id="item.id"
               :key="item.id"
               :url="item.id"
               :img="item.image"
               :fi_title="item.fi_otsikko"
               :en_title="item.en_otsikko"
               :start_time="new Date(item.alku_aika)"
               :fi_text="item.fi_kuvaus"
               :en_text="item.en_kuvaus"
            />
         </div>
      </div>
   </div>
</template>

<script setup>
   // This hard coded data will be replaced with data from directus
   let events;
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/tapahtuma');
      events = response.data.value.data;
      // filter
      const today = new Date();
      events.pastData = events.filter((item) => new Date(item.alku_aika) < today);
      events.futureData = events.filter((item) => new Date(item.alku_aika) >= today);

      // order by first by date
      events.pastData.sort((a, b) => new Date(b.alku_aika).getTime() - new Date(a.alku_aika).getTime());
      events.futureData.sort((a, b) => new Date(a.alku_aika).getTime() - new Date(b.alku_aika).getTime());
   } catch (error) {
      events = [
         {
            img: '/images/tapahtumat-placeholder.png',
            id: '1',
            header: 'Serveri ry:n 35-vuotis vuosijuhlat',
            date: new Date('09/25/2022'),
            text: 'Toivotamme Teidät mitä lämpimimmin tervetulleeksi viettämään Serveri ry:n 35-vuotis vuosijuhlaa pitkän odotuksen jälkeen!',
         },
      ];
   }
</script>