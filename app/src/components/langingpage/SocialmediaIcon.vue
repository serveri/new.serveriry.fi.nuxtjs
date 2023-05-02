<template>
   <div class="some-container">
      <a :href="Socialmedia.url" class="w-32" @mouseover="hover = true" @mouseleave="hover = false">
         <img
            v-if="hover"
            :src="Socialmedia.img"
            :alt="Socialmedia.name"
            loading="lazy"
            class="some-logo scale-110"
            :title="Socialmedia.name"
         />
         <img v-else :src="Socialmedia.img" :alt="Socialmedia.name" loading="lazy" class="some-logo scale-100" />
         <p v-if="hover" class="pt-2 text-center overflow-hidden">{{ Socialmedia[$i18n.locale + '_desc'] }}</p>
      </a>
   </div>
</template>

<script setup lang="ts">
   const Socialmedia = defineProps({
      url: {
         type: String,
         required: true,
      },
      img: {
         type: String,
         required: true,
      },
      name: {
         type: String,
         default: 'some name',
         required: true,
      },
      fi_desc: {
         type: String,
         required: false,
      },
      en_desc: {
         type: String,
         required: false,
      },
   });
</script>

<script lang="ts">
   export default {
      name: 'SocialmediaIcon',
      data() {
         return {
            hover: false,
         };
      },
   };
</script>

<style scoped>
   .some-container {
      min-height: 180px;
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
   }
   .some-container {
      @apply rounded-2xl py-5 px-6 w-full cursor-pointer dark:bg-zinc-900 dark:shadow-lg dark:shadow-zinc-600/50;
   }
   .some-logo {
      height: 7rem;
      width: 100%;
      object-fit: contain;
      -o-object-fit: contain;
   }
</style>
