<template>
    <div class="uukortti">
        <img src="" alt="ei löyvy">
        <h1 class="korttiOtsikko">uutiskortti?</h1>
        <div>
            <p>Julkaistu:</p>
            <p>111111111111111111111</p>
        </div>
    </div>
</template>

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