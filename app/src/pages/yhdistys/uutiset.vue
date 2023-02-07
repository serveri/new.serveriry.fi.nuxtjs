<template>
   <div>
      <Head>
         <Title>{{ $t('title_news') }} - Serveri ry</Title>
      </Head>

      <h1 class="custom-page-title">{{ $t('h1_news') }}</h1>

      <div class="news pt-8">
         <NewsCard
            v-for="item in news"
            :id="item.id"
            :img="item.img"
            :url="item.url"
            :header="item.header"
            :date="item.date"
            :text="item.text"
         />
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

<style>
   .news {
      padding-bottom: 3rem;
      display: grid;
      gap: 2rem;
      grid-template-columns: auto auto auto;
   }
</style>
