<template>
   <div class="audio-player-container">
      <h1 class="header-text pt-4 text-white">Serveri ❤️ Viinapiru</h1>
      <div class="audio-player">
         <button @click="togglePlay" class="play-pause-btn">
            <span v-if="!isPlaying">▶️</span>
            <span v-else>⏸️</span>
         </button>
         <div class="progress-container" @click="seek($event)">
            <div class="progress-bar" :style="{ width: progress + '%' }"></div>
         </div>
         <span class="time">{{ currentTime }} / {{ duration }}</span>
      </div>
   </div>
</template>

<script setup lang="ts">
   import { ref, onMounted, onUnmounted } from 'vue';

   const isPlaying = ref(false);
   const progress = ref(0);
   const currentTime = ref('0:00');
   const duration = ref('0:00');
   let audio: HTMLAudioElement;

   const togglePlay = () => {
      if (isPlaying.value) {
         audio.pause();
      } else {
         audio.play();
      }
      isPlaying.value = !isPlaying.value;
   };

   const formatTime = (time: number) => {
      const minutes = Math.floor(time / 60);
      const seconds = Math.floor(time % 60)
         .toString()
         .padStart(2, '0');
      return `${minutes}:${seconds}`;
   };

   const updateProgress = () => {
      progress.value = (audio.currentTime / audio.duration) * 100;
      currentTime.value = formatTime(audio.currentTime);
   };

   const seek = (event: MouseEvent) => {
      const container = event.currentTarget as HTMLElement;
      const rect = container.getBoundingClientRect();
      const offsetX = event.clientX - rect.left;
      const seekTime = (offsetX / container.offsetWidth) * audio.duration;
      audio.currentTime = seekTime;
   };

   const setMediaSessionMetadata = () => {
      if ('mediaSession' in navigator) {
         navigator.mediaSession.metadata = new MediaMetadata({
            title: 'Viinapiru',
            artist: 'Unknown',
            album: 'Juomalaulut',
         });

         // Optional: Handle media session actions (e.g., play, pause)
         navigator.mediaSession.setActionHandler('play', () => {
            audio.play();
            isPlaying.value = true;
         });
         navigator.mediaSession.setActionHandler('pause', () => {
            audio.pause();
            isPlaying.value = false;
         });
      }
   };

   onMounted(() => {
      // Instantiate the audio object in a client-only lifecycle hook.
      audio = new Audio('/audio/viinapiru.mp3');
      audio.addEventListener('timeupdate', updateProgress);
      audio.addEventListener('loadedmetadata', () => {
         duration.value = formatTime(audio.duration);
      });
      audio.addEventListener('ended', () => {
         isPlaying.value = false;
         progress.value = 0;
      });
      audio.addEventListener('play', setMediaSessionMetadata);
   });

   onUnmounted(() => {
      if (audio) {
         audio.pause();
         audio.removeEventListener('timeupdate', updateProgress);
      }
      if ('mediaSession' in navigator) {
         navigator.mediaSession.metadata = null;
      }
   });
</script>

<style scoped>
@reference "tailwindcss";
   .audio-player-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: calc(100vh - 4rem);
      text-align: center;
      padding: 1rem;
      background: linear-gradient(135deg, #ff7eb3, #ff758c);
      color: #fff;
   }

   .header-text {
      font-size: 2rem;
      margin-bottom: 1rem;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
   }

   .audio-player {
      display: flex;
      align-items: center;
      gap: 1rem;
      width: 90%;
      max-width: 400px;
      background: rgba(255, 255, 255, 0.2);
      padding: 1rem;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
   }

   .play-pause-btn {
      font-size: 2rem;
      background: none;
      border: none;
      cursor: pointer;
      color: #fff;
      transition: transform 0.2s ease;
   }

   .play-pause-btn:active {
      transform: scale(1.1);
   }

   .progress-container {
      flex: 1;
      height: 8px;
      background: rgba(255, 255, 255, 0.3);
      border-radius: 4px;
      position: relative;
      cursor: pointer;
      overflow: hidden;
   }

   .progress-bar {
      height: 100%;
      background: #fff;
      border-radius: 4px;
      transition: width 0.1s linear;
   }

   .time {
      font-size: 0.9rem;
      color: #fff;
      text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
   }

   @media (max-width: 600px) {
      .header-text {
         font-size: 1.5rem;
      }

      .audio-player {
         flex-direction: column;
         gap: 0.5rem;
      }

      .play-pause-btn {
         font-size: 1.8rem;
      }

      .time {
         font-size: 0.8rem;
      }
   }
</style>
