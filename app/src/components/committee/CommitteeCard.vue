<template>
   <div>
      <div class="card-container">
         <div class="member-info flex flex-wrap justify-center px-4">
            <div class="w-9/12 sm:w-11/12" @mouseover="hover = true" @mouseleave="hover = false">
               <img
                  v-if="hover"
                  :src="content.hover_img"
                  class="member-image"
                  alt="Toinen kuva hallituksen jäsenestä"
                  role="img"
                  loading="lazy"
               />
               <img
                  v-else
                  class="member-image"
                  :src="content.img"
                  alt="Hallituksen jäsenen kuva"
                  role="img"
                  loading="lazy"
               />
            </div>
         </div>

         <div class="member-header text-center py-2">
            <h2 class="member-role font-extrabold text-2xl">{{ content.role }}</h2>

            <h2 class="member-name font-extrabold text-2xl">{{ content.name }}</h2>
         </div>

         <div class="member-desc text-center">
            <a :href="'mailto:' + content.email + '@serveriry.fi'" class="member-email hover:underline"
               >{{ content.email }}@serveriry.fi</a
            >

            <p>
               Telegram:
               <a
                  class="member-telegram hover:underline"
                  :href="'https://telegram.me/' + content.telegram"
                  target="_blank"
                  >@{{ content.telegram }}</a
               >
            </p>
         </div>

         <div class="button-container text-center">
            <div class="role-desc">
               <p v-if="isExpanded" class="role-text p-3 text-left">
                  {{ content.desc }}
               </p>
            </div>

            <button class="expandable-button pt-1" type="button" @click="isExpanded = !isExpanded">
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
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

   const content = defineProps({
      img: {
         type: String,
         default: '/images/member.jpeg',
         required: true,
      },
      hover_img: {
         type: String,
         required: true,
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
      role: {
         type: String,
         default: 'Puheenjohtaja',
         required: false,
      },
      desc: {
         type: String,
         default:
            'Puheenjohtajan tehtävänä on pähkinänkuoressa johtaa kokouksia, pitää huoli, että hallitus toimii ja asiat pelittävät, sekä hoitaa erinäisiä edustustehtäviä.',
         required: false,
      },
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
      @apply dark:shadow-lg dark:shadow-zinc-600/50;
   }
   .collapse-button {
      @apply dark:invert;
   }

   .member-image {
      @apply shadow rounded-full max-w-full h-auto align-middle border-none;
   }
</style>
