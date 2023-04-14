<template>
     <div class="some-container">            
     <a :href="socialmedias.url" target="_blank" @mouseover="hover = true" @mouseleave="hover = false">
      <img v-if="hover" :src="socialmedias.img" :alt="socialmedias.name" loading="lazy" class="some-logo scale-110" :title="socialmedias.name" />
      <img v-else :src="socialmedias.img" :alt="socialmedias.name" loading="lazy" class="some-logo scale-100" />
     </a>
    </div>
</template>
    
    
    <script setup lang="ts">
    const socialmedias = defineProps({
       url: {
          type: String,
          default: 'Default',
          required: true,
       },
       img: {
          type: String,
          default: 'https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0a6a49cf127bf92de1e2_icon_clyde_blurple_RGB.png',
          required: true,
       },
       name: {
          type: String,
          default: 'öööh',
          required: true,
       },
    });
 </script>
    

    <script lang="ts">
    export default {
       name: 'socialmediasCard',
       data() {
          return {
             hover: false,
          };
       },
    };
 </script>   
    
    <style scoped>
    
    .some-container{
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .some-container{
        @apply rounded-2xl w-full h-full cursor-pointer dark:bg-zinc-900 dark:shadow-lg dark:shadow-zinc-600/50;
    }
    .some-logo{
        height: 7rem;
      width: 90%;
      padding: 0.8rem;
      object-fit: contain;
      -o-object-fit: contain;
    }
    
    </style>