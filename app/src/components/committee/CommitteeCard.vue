<template>


<div class="card-container max-w-sm p-4">
<div class="member-info flex flex-wrap justify-center" @mouseover="hover = true"
      @mouseleave="hover = false">
      <div class="w-9/12 sm:w-11/12 px-4">

      <img class="member-image shadow rounded-full max-w-full h-auto align-middle border-none" v-if="hover" :src="content.img2" :alt="content.img" loading="lazy"/>
      <img class="member-image shadow rounded-full max-w-full h-auto align-middle border-none" v-else :src="content.img" :alt="content.img2" loading="lazy" />
</div>
</div>

<div class="member-header text-center p-2">

<h2 class="member-role font-extrabold text-2xl">Hallitusrooli</h2>

<h2 class="member-name font-extrabold text-2xl">Seppo Taalasmaa</h2>

</div>

<div class="member-desc text-center">

<a href="" target="_blank" class="member-email">seppo.teelasmuu@serveri.ry</a>   

<p>Telegram: <a class="member-telegram" href="" target="_blank">@seppo</a></p>

</div>

<div class="button-container text-center"> 

<div class="role-desc">
    <p class="role-text p-3" v-if="isExpanded" >Lorem ipsum on 1500-luvulta lähtien olemassa ollut teksti, 
    jota käytetään usein täytetekstinä ulkoasun testaamiseen graafisessa suunnittelussa, kun oikeata tekstisisältöä ei vielä ole. Lorem ipsumia käytetään näyttämään, 
    miltä esimerkiksi kirjasin tai julkaisun tekstin asettelu näyttävät. </p>
</div>


<button v-on:click="isExpanded = !isExpanded"  type="button" class="expandable-button">
<button v-if="isExpanded" class="collapse-button"> <font-awesome-icon icon="fa-solid fa-chevron-up"/> </button>
<button v-else class="expand-button"> <font-awesome-icon icon="fa-solid fa-chevron-down"/> </button>
</button>
</div>
</div>
</template>

<script setup lang="ts">
   const content = defineProps({

      img: {
         type: String,
         default: '/_nuxt/assets/images/jäsenkuva.jpeg',
         required: true,
      },
      
      img2: {
        type: String,
        default:'/_nuxt/assets/images/jäsenkuva2.jpeg',
        required: true,
      }
   });
</script>

<style scoped>
.card-container{
    border-radius: 1em;
    box-shadow: 0 0px 5px 0.27px #d3d3d3;
      -webkit-box-shadow: 0 0px 5px 0.27px #d3d3d3;
      -moz-box-shadow: 0 0px 5px 0 0.27px #d3d3d3;
    overflow: hidden;

}
</style>

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