<template>
   <div class="flex flex-col items-center">
      <div class="card-container flex flex-col sm:min-w-[16.5rem] min-w-full">
         <div class="member-info flex flex-wrap justify-center px-4">
            <div class="w-9/12 sm:w-11/12" @mouseover="hover = true" @mouseleave="hover = false">
               <img
                  :src="hover ? content.hover_img : content.img"
                  class="member-image w-full"
                  alt="Hallituksen jäsenen kuva"
                  role="img"
               />
            </div>
         </div>

         <div class="sm:min-h-[10rem]">
            <div class="member-header text-center py-2">
               <h2 class="member-name font-extrabold pt-1 text-2xl">{{ props.name }}</h2>
               <h2 class="member-role text-md font-bold line-clamp-2">{{ props[$i18n.locale + '_role'] }}</h2>
            </div>
            <div class="member-desc text-center pb-4 text-sm">
               <p v-if="props.email" class="flex justify-center px-2">
                  <client-only>
                     <font-awesome-icon class="fa-xl mr-1" :icon="['fas', 'envelope']" />
                  </client-only>
                  <a :href="'mailto:' + props.email + '@serveriry.fi'" class="member-email hover:underline"
                     >{{ props.email }}@serveriry.fi</a
                  >
               </p>

               <p v-if="props.telegram">
                  <client-only>
                     <font-awesome-icon class="fa-xl mr-1" :icon="['fab', 'telegram']" />
                  </client-only>
                  <a
                     class="member-telegram hover:underline"
                     :href="'https://telegram.me/' + props.telegram"
                     target="_blank"
                     >@{{ props.telegram }}</a
                  >
               </p>
            </div>
         </div>

         <div class="button-container text-center relative flex-grow pt-4">
            <div class="role-desc">
               <p v-if="isExpanded" class="role-text p-3 text-left pb-8">
                  {{ props[$i18n.locale + '_desc'] }}
               </p>
            </div>

            <button class="expandable-button bottom-0 absolute" type="button" @click="isExpanded = !isExpanded">
               <client-only>
                  <button v-if="isExpanded">
                     <font-awesome-icon class="collapse-button fa-xl" :icon="['fas', 'chevron-up']" />
                  </button>
                  <button v-else>
                     <font-awesome-icon class="collapse-button fa-xl" :icon="['fas', 'chevron-down']" />
                  </button>
               </client-only>
            </button>
         </div>
      </div>
   </div>
</template>

<script setup lang="ts">
   import { reactive } from 'vue';
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

   const props = defineProps({
      img: {
         type: String,
         default: '/images/placeholder-square.jpg',
         required: true,
      },
      hover_img: {
         type: String,
         default: '/images/placeholder-square.jpg',
         required: false,
      },
      email: {
         type: String,
         default: 'rooli',
         required: false,
      },
      telegram: {
         type: String,
         default: 'seppotg',
         required: false,
      },
      name: {
         type: String,
         default: 'Seppo Taalasmaa',
         required: false,
      },
      fi_role: {
         type: String,
         required: false,
         default: 'Virhe',
      },
      en_role: {
         type: String,
         required: false,
         default: 'Error',
      },
      fi_desc: {
         type: String,
         required: false,
         default: 'Api virhe',
      },
      en_desc: {
         type: String,
         required: false,
         default: 'Api error',
      },
   });

   const content = reactive({
      img: props.img,
      hover_img: props.hover_img,
   });

   onMounted(() => {
      const imgEl = new Image();
      imgEl.src = props.img;
      const hoverImgEl = new Image();
      hoverImgEl.src = props.hover_img;
   });
</script>

<script lang="ts">
   export default {
      name: 'CommitteeCard',
      data() {
         return {
            hover: false,
            isExpanded: false,
         };
      },
   };
</script>

<style scoped>
   .card-container {
      -webkit-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      -moz-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
   }
   .card-container {
      @apply rounded-2xl w-full overflow-hidden max-w-sm p-4 justify-self-center;
   }
   .card-container {
      @apply dark:shadow-lg dark:shadow-zinc-600/50 dark:bg-zinc-900;
   }

   .collapse-button {
      @apply dark:invert;
   }

   .member-image {
      @apply rounded-full max-w-full align-middle border-none object-cover;
   }
   .member-image {
      @apply dark:shadow-lg dark:shadow-zinc-700 dark:bg-zinc-900;
   }
</style>
