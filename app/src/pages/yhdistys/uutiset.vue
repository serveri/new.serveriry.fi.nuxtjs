<template>
   <div>
      <Head>
         <Title>{{ $t('title_news') }} - Serveri ry</Title>
      </Head>

      <h1 class="custom-page-title">{{ $t('h1_news') }}</h1>

      <div class="news p-8 sm:px-0">
         <div class="grid grid-cols-1 gap-8 md:grid-cols-2 md:gap-8 lg:grid-cols-3 lg:gap-7">
            <NewsCard
               v-for="item in news"
               :id="item.id"
               :key="item.id"
               :url="item.id"
               :img="item.image"
               :fi_title="item.fi_title"
               :en_title="item.en_title"
               :date="new Date(item.date_created)"
               :fi_text="item.fi_text"
               :en_text="item.en_text"
            />
         </div>
      </div>
   </div>
</template>

<script setup>
   // This hard coded data will be replaced with data from directus
   let news;
   try {
      const response = await useFetch('https://api.serveri.jeb4.dev/items/uutiset');
      news = response.data.value.data;
   } catch (error) {
      news = [
         {
            img: '/images/uutiset-placeholder.png',
            id: '1',
            header: 'Serveri ry:n 35-vuotis vuosijuhlat',
            date: new Date('09/25/2022'),
            text: 'Toivotamme Teidät mitä lämpimimmin tervetulleeksi viettämään Serveri ry:n 35-vuotis vuosijuhlaa pitkän odotuksen jälkeen!',
         },
      ];
   }
</script>
