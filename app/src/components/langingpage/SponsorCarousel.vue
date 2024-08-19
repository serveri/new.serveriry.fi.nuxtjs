<template>
<!--   <Carousel-->
<!--      class="w-full"-->
<!--      :wrap-around="true"-->
<!--      :autoplay="3000"-->
<!--      :transition="1000"-->
<!--      :settings="settings"-->
<!--      :breakpoints="breakpoints"-->
<!--   >-->
<!--      <Slide v-for="sponsor in sponsors" :key="sponsor.name">-->
<!--         <partner-card-->
<!--            :url="sponsor.url"-->
<!--            :img="sponsor.img"-->
<!--            :img_dark="sponsor.img_dark"-->
<!--            :alt="'Serverin toimintaa tukee ' + sponsor.name + ' ja tässä heidän logo'"-->
<!--            :name="sponsor.name"-->
<!--            :fi_text="sponsor.fi_text"-->
<!--            :en_text="sponsor.en_text"-->
<!--         />-->
<!--      </Slide>-->
<!--   </Carousel>-->
</template>

<script setup lang="ts">
   // import { ref } from 'vue';
   // import { Carousel, Slide } from 'vue3-carousel';
   // import PartnerCard from '@/components/partners/PartnerCard.vue';
   // import 'vue3-carousel/dist/carousel.css';
   // import type { Data } from '@/types';
   //
   // const config = useRuntimeConfig();
   //
   // // Fetch sponsors data
   // let sponsors = ref([]);
   // try {
   //    const { data } = (await useFetch(`${config.public['API_URL']}items/partners`)) as { data: Data };
   //    sponsors.value = data.value.data;
   // } catch (e) {
   //    sponsors.value = [
   //       {
   //          name: 'Yrityksen logo puuttuu',
   //          url: 'https://serveriry.fi',
   //          img: 'https://cloud.serveriry.fi/s/rRJL8CTTSg9KDYK/download/Tapahtumat-placeholder.png',
   //       },
   //    ];
   // }
   //
   // // Carousel settings
   // const settings = ref({
   //    itemsToShow: 1,
   //    snapAlign: 'center',
   // });
   //
   // // Breakpoints for responsive design
   // const breakpoints = ref({
   //    700: { itemsToShow: 3, snapAlign: 'center' },
   //    1024: { itemsToShow: 4, snapAlign: 'center' },
   //    1440: { itemsToShow: 6, snapAlign: 'center' },
   // });

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
