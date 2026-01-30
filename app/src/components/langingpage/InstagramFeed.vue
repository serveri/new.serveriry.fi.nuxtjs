<!--suppress HtmlDeprecatedAttribute -->
<template>
   <!-- CSS is static, maybe make it more responsive -->
   <div
      class="flex md:w-1/2 flex-col items-center lg:pl-10 md:pl-5 sm:pl-0 sm:grid sm:grid-cols-2 gap-2 sm:h-[100vw] md:h-[52vw] xl:h-[41rem] md:border-l border-gray-200 dark:border-gray-700"
   >
      <h2 class="custom-page-title sm:hidden">Instagram Feed</h2>
      <client-only>
         <template v-if="trackingAllowed">
            <iframe
               v-for="post in posts?.slice(0, 4)"
               :key="post.postaus_id"
               title="Instagram post"
               class="rounded-lg w-full h-[97vw] sm:h-full"
               :src="`https://www.instagram.com/p/${post.postaus_id}/embed/?utm_source=ig_embed&amp%3Butm_campaign=loading`"
               height="100%"
               scrolling="no"
               allowtransparency="true"
               tabindex="-1"
               sandbox="allow-scripts"
            ></iframe>
         </template>
         <div v-else class="flex flex-col items-center gap-2 rounded-lg bg-zinc-200 p-6 dark:bg-zinc-700">
            <p class="text-center text-sm">{{ $t('embed_cookies_required') }}</p>
            <p class="text-center text-xs opacity-90">{{ $t('tracking_disabled_embed') }}</p>
            <a
               href="https://www.instagram.com/serveriry/"
               target="_blank"
               rel="noopener noreferrer"
               class="text-custom-primary underline"
            >
               Instagram @serveriry
            </a>
         </div>
      </client-only>
   </div>
</template>

<script setup lang="ts">
   import type { Data } from '@/types';

   interface InstagramPost {
      postaus_id: string;
   }

   const config = useRuntimeConfig();
   const { trackingAllowed } = useTrackingConsent();

   let posts: InstagramPost[] = [];
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/instagram`)) as {
         data: { value: { data: InstagramPost[] } };
      };
      posts = Array.isArray(data.value?.data) ? data.value.data : [];
   } catch (e) {
      posts = [
         { postaus_id: 'CqFdw7MBG5N' },
         { postaus_id: 'CqC49UgBFpR' },
         { postaus_id: 'CpzqO4Ah9HC' },
         { postaus_id: 'CphwTQLBho9' },
      ];
   }
</script>

<script lang="ts">
   export default {
      name: 'InstagramFeed',
   };
</script>

<style scoped></style>
