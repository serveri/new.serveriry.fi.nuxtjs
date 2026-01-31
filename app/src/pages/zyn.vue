<template>
   <div class="iframe-container bg-black">
      <h1 class="header-text pt-4 text-white px-4">Serveri ❤️ ZynZyn</h1>
      <h2 class="text-center mb-4 text-white px-4">
         The video below is iframe to
         <a class="underline text-white" href="https://zyn.pilipali.io/">zyn.pilipali.io</a>. It might take a little
         time to start working, if no one has used it for a while.
      </h2>
      <client-only>
         <iframe
            v-if="trackingAllowed"
            src="https://zyn.pilipali.io/"
            frameborder="0"
            allow="autoplay"
            allowfullscreen
            class="full-size-iframe"
            sandbox="allow-scripts"
         >
         </iframe>
         <div v-else class="flex h-full min-h-[50vh] flex-col items-center justify-center gap-4 px-4 text-white">
            <p class="text-center">{{ $t('embed_cookies_required') }}</p>
            <p class="text-center text-sm opacity-90">{{ $t('tracking_disabled_embed') }}</p>
            <a
               href="https://zyn.pilipali.io/"
               target="_blank"
               rel="noopener noreferrer"
               class="rounded bg-custom-primary px-4 py-2 font-medium hover:bg-custom-secondary"
            >
               zyn.pilipali.io
            </a>
         </div>
      </client-only>
   </div>
</template>

<script setup lang="ts">
   const { trackingAllowed } = useTrackingConsent();

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
   @reference "tailwindcss";
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
