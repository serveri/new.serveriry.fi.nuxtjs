<template>
   <div>
      <Head>
         <Title>{{ $t('title_news') }} - Serveri ry</Title>
      </Head>

      <h1 class="custom-page-title">{{ $t('h1_news') }}</h1>

      <div class="news p-8">
         <div class="grid grid-cols-1 gap-8 md:grid-cols-2 md:gap-8 lg:grid-cols-3 lg:gap-7">
            <NewsCard
               v-for="item in news"
               :id="item.id"
               :key="item.id"
               :img="item.img"
               :url="item.url"
               :header="item.header"
               :date="item.date"
               :text="item.text"
            />
         </div>
      </div>
   </div>
</template>

<script setup>
   // This hard coded data will be replaced with data from directus
   const news = [
      {
         img: '/_nuxt/assets/images/placeholder.jpg',
         id: '1',
         header: 'Serveri ry:n 35-vuotis vuosijuhlat',
         date: new Date('09/25/2022'),
         text: 'Toivotamme Teidät mitä lämpimimmin tervetulleeksi viettämään Serveri ry:n 35-vuotis vuosijuhlaa pitkän odotuksen jälkeen!',
      },
      {
         img: '/_nuxt/assets/images/placeholder.jpg',
         id: '2',
         header: 'Serveri ry:n 35-vuotis vuosijuhlat',
         date: new Date(),
         text: 'Toivotamme Teidät mitä lämpimimmin tervetulleeksi viettämään Serveri ry:n 35-vuotis vuosijuhlaa pitkän odotuksen jälkeen!',
      },
      {
         img: '/_nuxt/assets/images/placeholder.jpg',
         header: 'THIS IS NEWS HEADER',
         id: '2',
      },
      {
         img: '/_nuxt/assets/images/placeholder.jpg',
      },
      {
         img: '/_nuxt/assets/images/placeholder.jpg',
      },
   ];
</script>
