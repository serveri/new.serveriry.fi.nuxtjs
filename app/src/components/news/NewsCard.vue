<template>
   <a :href="'/news/' + content.url">
      <div class="uukortti">
         <img :src="content.img" alt="Cover image for the news card" />
         <h1 class="korttiOtsikko">{{ content.header }}</h1>
         <p>
            {{ $t('news_released') }} <span>{{ content.date.toLocaleDateString($i18n.locale, options) }}</span>
         </p>
         <p>{{ content.text }}</p>
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
   .uukortti {
      border-radius: 1em;
      width: 100%;
      height: 100%;
      overflow: hidden;
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
   }
   h2 {
      padding-left: 1rem;
      font-size: 1.6rem;
      font-weight: 800;
      margin-top: 0.8rem;
      margin-bottom: 0.3rem;
   }

   h5 {
      padding-left: 1rem;
      font-weight: 400;
      text-transform: uppercase;
   }

   p {
      padding-left: 1rem;
      margin-top: 0.5rem;
      margin-bottom: 0.8rem;
   }
   img {
      width: 100%;
      object-fit: cover;
      height: 15rem;
   }
</style>
