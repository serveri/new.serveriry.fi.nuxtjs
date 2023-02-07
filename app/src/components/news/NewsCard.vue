<template>
   <div class="uukortti">
      <img :src="content.img" alt="Cover image for the news card" />
      <h1 class="korttiOtsikko">{{ content.header }}</h1>
      <div>
         <p>{{ $t('news_released') }}</p>
         <p>{{ content.date }}</p>
      </div>
   </div>
</template>

<script setup lang="ts">
   const content = defineProps({
      url: {
         type: String,
         default: 'Default',
         required: true,
      },
      img: {
         type: String,
         default: 'Default',
         required: true,
      },
      header: {
         type: String,
         default: 'Default',
         required: true,
      },
      date: {
         type: String,
         default: 'Default',
         required: true,
      },
      text: {
         type: String,
         default: 'Default',
         required: true,
      },
   });
</script>
<script lang="ts">
   export default {
      name: 'newsCard',
      data() {
         return {
            hover: false,
         };
      },
   };
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
