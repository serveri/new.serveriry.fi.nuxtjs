<template>
    <div class="uukortti">
        <img :src="content.img" alt="Cover image for the news card">
        <h1 class="korttiOtsikko">{{content.header}}</h1>
        <div>
            <p>{{ $t('news_released') }}</p>
            <p>{{content.date}}</p>
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

<style>
    .uukortti{
     -webkit-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      -moz-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      border-radius: 15px;
      padding: 0.8rem;   
}
.korttiOtsikko{
    font-size: x-large;
}

p{
    font-size: larger;
}
</style>