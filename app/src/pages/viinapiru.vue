<template>
   <div class="audio-player-container">
      <h1 class="header-text pt-4">Serveri ❤️ Viinapiru</h1>
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

const audio = new Audio('/audio/viinapiru.mp3');
const isPlaying = ref(false);
const progress = ref(0);
const currentTime = ref('0:00');
const duration = ref('0:00');

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
   const seconds = Math.floor(time % 60).toString().padStart(2, '0');
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

onMounted(() => {
   audio.addEventListener('timeupdate', updateProgress);
   audio.addEventListener('loadedmetadata', () => {
      duration.value = formatTime(audio.duration);
   });
   audio.addEventListener('ended', () => {
      isPlaying.value = false;
      progress.value = 0;
   });
});

onUnmounted(() => {
   audio.pause();
   audio.removeEventListener('timeupdate', updateProgress);
});
</script>

<style scoped>
.audio-player-container {
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: center;
   height: 100vh;
   text-align: center;
}

.header-text {
   font-size: 2rem;
   margin-bottom: 1rem;
}

.audio-player {
   display: flex;
   align-items: center;
   gap: 1rem;
   width: 80%;
   max-width: 500px;
}

.play-pause-btn {
   font-size: 1.5rem;
   background: none;
   border: none;
   cursor: pointer;
}

.progress-container {
   flex: 1;
   height: 10px;
   background: #ddd;
   border-radius: 5px;
   position: relative;
   cursor: pointer;
}

.progress-bar {
   height: 100%;
   background: #007bff;
   border-radius: 5px;
   transition: width 0.1s linear;
}

.time {
   font-size: 0.9rem;
   color: #555;
}
</style>
