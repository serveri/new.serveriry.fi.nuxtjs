<template>
    <div class="uukortti">  
        <img src="@/assets/images/kokeilu.jpg" alt="">
        <div>
            <h2>Uutiskortin otsikko</h2>
            <h5>Julkaistu: xx.xx.xxxx</h5>
            <p> Lorem ipsum on 1500-luvulta lähtien olemassa ollut teksti, jota käytetään usein täytetekstinä ulkoasun testaamiseen graafisessa suunnittelussa, kun oikeata tekstisisältöä ei vielä ole.  </p>
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

<style scoped>
    .uukortti{
    border-radius: 1em;
    width: 100%;
    height: 100%;
    overflow: hidden;
    box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
}
h2{
    padding-left: 1rem;
    font-size: 1.6rem;
    font-weight: 800;
    margin-top: 0.8rem;
    margin-bottom: 0.3rem;
}

h5{
    padding-left: 1rem;
    font-weight: 400;
    text-transform: uppercase;
}

p{
    padding-left: 1rem  ;
    margin-top: 0.5rem;
    margin-bottom: 0.8rem;
}
img{
    width: 100%;
    object-fit: cover;
    height: 15rem;
}
</style>