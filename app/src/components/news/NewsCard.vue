<template>
   <a :href="'/news/' + content.url">
      <div class="NewsCard">
         <div class="image-div">
         <img class="news-image" :src="content.img" alt="Cover image for the news card" />
         </div>
         <h2 class="card-header">{{ content.header }}</h2>
         <p class="news-date">
            {{ $t('news_released') }} <span>{{ content.date.toLocaleDateString($i18n.locale, options) }}</span>
         </p>
         <p class="card-content">{{ content.text }}</p>
      </div>
   </a>
</template>

<script setup lang="ts">
   const content = defineProps({
      url: {
         type: Number,
         default: 1,
         required: true,
      },
      img: {
         type: String,
         default: '/_nuxt/assets/images/placeholder.jpg',
         required: true,
      },
      header: {
         type: String,
         default: 'News Header Missing',
         required: false,
      },
      date: {
         type: Date,
         default: new Date("01/01/1970"),
         required: false,
      },
      text: {
         type: String,
         default: 'News Description missing',
         required: false,
      },
   });
   const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
</script>

<style scoped>
   .NewsCard {
      border-radius: 1em;
      width: 100%;
      height: 100%;
      overflow: hidden;
      box-shadow: 0 0 26px -5px #ccc;
      -webkit-box-shadow: 0 0 26px -5px #ccc;
      -moz-box-shadow: 0 0 26px -5px #ccc;
      padding: 1rem;
   }
   
   
   .card-header {
      font-size: 1.4rem;
      font-weight: 800;
      margin-top: 1rem;
   }

   .news-date {
      font-weight: 400;
      text-transform: uppercase;
   }

   .card-content {
      margin-top: 0.5rem;
   }
   .news-image {
      object-fit: cover;
      height: 15rem;
      
   }
   .image-div{
      margin: -1rem;
      border-radius: 1em;
      
   }
</style>
