<template>
   <div class="iframe-container bg-black">
      <h1 class="header-text pt-4 text-white px-4">Serveri ❤️ ZynZyn</h1>
      <h2 class="text-center mb-4 text-white px-4">
         The video below is iframe to
         <a class="underline text-white" href="https://zyn.pilipali.io/"
            >zyn.pilipali.io</a
         >. It might take a little time to start working, if no one has used it for a while.
      </h2>
      <iframe
         src="https://zyn.pilipali.io/"
         frameborder="0"
         allow="autoplay"
         allowfullscreen
         class="full-size-iframe"
      >
      </iframe>
   </div>
</template>

<script setup lang="ts">
   // No script logic is needed for this page.

   const setMediaSessionMetadata = () => {
      if ('mediaSession' in navigator) {
         navigator.mediaSession.metadata = new MediaMetadata({
            title: 'ZynZyn',
            artist: 'Unknown',
            album: 'Party',
         });
      }
   };

   onMounted(() => {
      setMediaSessionMetadata();
   });

   onUnmounted(() => {
      if ('mediaSession' in navigator) {
         navigator.mediaSession.metadata = null;
      }
   });
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
