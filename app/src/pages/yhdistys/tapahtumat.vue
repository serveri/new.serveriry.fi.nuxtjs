<template>
   <div>
      <Head>
         <Title>{{ $t('title_events') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_events') }}</h1>

      <div class="news p-8 sm:px-0">
         <div class="grid grid-cols-1 gap-8 md:grid-cols-2 md:gap-8 lg:grid-cols-3 lg:gap-7">
            <EvetsCard
               v-for="item in news"
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
   let news;
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/tapahtuma');
      news = response.data.value.data;
   } catch (error) {
      news = [
         {
            img: '/images/placeholder.jpg',
            id: '1',
            header: 'Serveri ry:n 35-vuotis vuosijuhlat',
            date: new Date('09/25/2022'),
            text: 'Toivotamme Teidät mitä lämpimimmin tervetulleeksi viettämään Serveri ry:n 35-vuotis vuosijuhlaa pitkän odotuksen jälkeen!',
         },
      ];
   }
</script>
