<template>

<div class="container">      
      <a href="">
        
        <img class='app/src/public/images/placeholder.jpg' src="" alt="Seppo">

        </a>
    </div>
</template>



<style scoped>

.container{
    -webkit-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      -moz-box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      box-shadow: 0 0 26px -5px rgba(0, 0, 0, 0.27);
      display: flex;
      justify-content: center;
      align-items: center;
}
.container{
    @apply rounded-2xl w-full h-full cursor-pointer dark:bg-zinc-900 dark:shadow-lg dark:shadow-zinc-600/50;
}
.some-logo{
    @apply h-28 w-11/12 p-3 object-contain
}

</style>