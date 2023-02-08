<template>
   <a
      :href="partner.url"
      target="_blank"
      class="rounded-2xl w-full h-full cursor-pointer dark:bg-zinc-900 dark:shadow-lg dark:shadow-zinc-600/50"
      @mouseover="hover = true"
      @mouseleave="hover = false"
   >
      <img v-if="hover" :src="partner.img" :alt="partner.name" loading="lazy" class="scale-110" />
      <img v-else :src="partner.img" :alt="partner.name" loading="lazy" class="scale-100" />
   </a>
</template>

<script setup lang="ts">
   const partner = defineProps({
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
     name: {
       type: String,
       default: 'Default',
       required: true,
     },

   });
</script>

<script lang="ts">
   export default {
      name: 'PartnerCard',
      data() {
         return {
            hover: false,
         };
      },
   };
</script>

<style scoped>
   a {
      -webkit-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      -moz-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      display: flex;
      justify-content: center;
      align-items: center;
   }

   img {
      height: 7rem;
      width: 90%;
      padding: 0.8rem;
      object-fit: contain;
      -o-object-fit: contain;
   }
</style>
