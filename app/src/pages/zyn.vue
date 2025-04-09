<template>
   <div class="iframe-container">
      <h1 class="header-text pt-4">Serveri ❤️ ZynZyn</h1>
      <h2 class="text-center mb-4">The video below is iframe to <a class="underline" href="https://web.archive.org/web/20241121032847/https://zyn.pilipali.io/">web.archive.org</a>. It might take a little time to start working, if no one has used it for a while.</h2>
      <iframe 
         src="https://web.archive.org/web/20241121032847/https://zyn.pilipali.io/" 
         frameborder="0" 
         allow="autoplay" 
         allowfullscreen 
         class="full-size-iframe">
      </iframe>
   </div>
</template>

<script setup lang="ts">
// No script logic is needed for this page.
</script>

<style scoped>
.iframe-container {
   width: 100%;
   height: 100vh;
   margin: 0;
   padding: 0;
   overflow: hidden;
}

.full-size-iframe {
   width: 100%;
   height: 100%;
   border: none;
}

.header-text {
   font-size: 2rem;
   text-align: center;
}
</style>
