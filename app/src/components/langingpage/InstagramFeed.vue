<!--suppress HtmlDeprecatedAttribute -->
<template>
   <!-- CSS is static, maybe make it more responsive -->
   <div
      class="flex md:w-1/2 flex-col items-center lg:pl-10 md:pl-5 sm:pl-0 sm:grid sm:grid-cols-2 gap-2 sm:h-[100vw] md:h-[52vw] xl:h-164 md:border-l border-gray-200 dark:border-gray-700"
   >
      <h2 class="custom-page-title sm:hidden">Instagram Feed</h2>
      <iframe
         v-for="post in posts.slice(0, 4)"
         :key="post.postaus_id"
         title="Instagram post"
         class="rounded-lg w-full h-[97vw] sm:h-full"
         :src="`https://www.instagram.com/p/${post.postaus_id}/embed/?utm_source=ig_embed&amp%3Butm_campaign=loading`"
         height="100%"
         scrolling="no"
         allowtransparency="true"
         tabindex="-1"
      ></iframe>
   </div>
</template>

<script setup lang="ts">
   import type { Data } from '@/types';

   const config = useRuntimeConfig();

   let posts;
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/instagram`)) as { data: Data };
      posts = data.value.data;
   } catch (e) {
      posts = ['CqFdw7MBG5N', 'CqC49UgBFpR', 'CpzqO4Ah9HC', 'CphwTQLBho9'];
   }
</script>

<script lang="ts">
   export default {
      name: 'InstagramFeed',
   };
</script>

<style scoped></style>
