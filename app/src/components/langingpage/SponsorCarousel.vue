<template>
   <Carousel
      class="w-full"
      :wrap-around="true"
      :autoplay="3000"
      :transition="1000"
      :settings="settings"
      :breakpoints="breakpoints"
   >
      <Slide v-for="sponsor in sponsors" :key="sponsor">
         <partner-card
            :key="sponsor.name"
            :url="sponsor.url"
            :img="sponsor.img"
            :alt="'Serverin toimintaa tukee ' + sponsor.name + ' ja tässä heidän logo'"
            :name="sponsor.name"
         />
      </Slide>

      ...
   </Carousel>
</template>

<script setup lang="ts">
   import PartnerCard from '@/components/partners/PartnerCard.vue';
   import { Data } from '@/app.vue';
   const config = useRuntimeConfig();

   let sponsors;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/partners`)) as { data: Data };
      sponsors = data.value.data;
   } catch (e) {
      sponsors = [
         {
            name: 'Yrityksen logo puuttuu',
            url: 'https://serveriry.fi',
            img: 'https://api.serveriry.fi/uploads/large_computerstuffwithlogo_da6b992e47.jpg',
         },
      ];
   }
</script>

<script lang="ts">
   import { defineComponent } from 'vue';
   import { Carousel, Slide } from 'vue3-carousel';

   import 'vue3-carousel/dist/carousel.css';

   export default defineComponent({
      name: 'SponsorCarousel',
      components: {
         Carousel,
         Slide,
      },
      data: () => ({
         // carousel settings
         settings: {
            itemsToShow: 1,
            snapAlign: 'center',
         },
         // breakpoints are mobile first
         // any settings not specified will fall back to the carousel settings
         breakpoints: {
            // 700px and up
            700: {
               itemsToShow: 3,
               snapAlign: 'center',
            },
            // 1024 and up
            1024: {
               itemsToShow: 4,
               snapAlign: 'center',
            },
            // 1440 and up
            1440: {
               itemsToShow: 6,
               snapAlign: 'center',
            },
         },
      }),
   });
</script>

<style scoped>
   .carousel__slide {
      @apply px-3 py-8;
      height: 200px;
   }

   .carousel__viewport {
      perspective: 2000px;
   }

   .carousel__track {
      transform-style: preserve-3d;
   }

   .carousel__slide--sliding {
      transition: 0.5s;
   }

   .carousel__slide {
      opacity: 0.9;
      transform: rotateY(-20deg) scale(0.9);
   }

   .carousel__slide--active ~ .carousel__slide {
      transform: rotateY(20deg) scale(0.9);
   }

   .carousel__slide--prev {
      opacity: 1;
      transform: rotateY(-10deg) scale(0.95);
   }

   .carousel__slide--next {
      opacity: 1;
      transform: rotateY(10deg) scale(0.95);
   }

   .carousel__slide--active {
      opacity: 1;
      transform: rotateY(0) scale(1.1);
      @apply sm:ml-3;
   }
   .carousel__item {
      min-height: 200px;
      width: 100%;
      background-color: var(--vc-clr-primary);
      color: var(--vc-clr-white);
      font-size: 20px;
      border-radius: 8px;
      display: flex;
      justify-content: center;
      align-items: center;
   }
</style>
