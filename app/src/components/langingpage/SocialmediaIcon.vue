<template>
   <div class="some-container">
      <a :href="Socialmedia.url" target="_blank" class="relative w-full group">
         <img
            :src="config.public['API_URL'] + 'assets/' + Socialmedia.img"
            :alt="Socialmedia.name"
            loading="lazy"
            :class="'some-logo scale-100 group-hover:scale-110 ' + custom_style"
         />
         <p class="info group-hover:opacity-100">
            {{ Socialmedia.name }}
            <!--            {{ Socialmedia[$i18n.locale + '_desc'] }}-->
         </p>
      </a>
   </div>
</template>

<script setup lang="ts">
   const config = useRuntimeConfig();
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
         default: 'Oletus Sosiaalinen Media',
      },
      en_desc: {
         type: String,
         required: false,
         default: 'Default Social Media',
      },
      custom_style: {
         type: String,
         required: false,
         default: '',
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
   @reference "tailwindcss";
   .some-container {
      min-height: 180px;
      /*box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);*/
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
   }
   .some-container {
      @apply rounded-2xl py-5 px-6 w-full cursor-pointer;
      /*@apply dark:bg-zinc-900 dark:shadow-lg dark:shadow-zinc-600/50;*/
   }
   .some-logo {
      height: 7rem;
      width: 100%;
      object-fit: contain;
      -o-object-fit: contain;
   }
   .info {
      position: absolute;
      padding: 15px 60px;
      bottom: -100px;
      left: 50%;
      text-align: center;
      transform: translate(-50%, -50px);
      opacity: 0;
      white-space: nowrap;
      transition: all 0.3s;
   }
</style>
