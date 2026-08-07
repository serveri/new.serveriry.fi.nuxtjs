<!--suppress HtmlDeprecatedAttribute -->
<template>
   <div class="flex w-full flex-col mt-6">
      <ClientOnly>
         <div v-if="trackingAllowed" class="grid grid-cols-1 sm:grid-cols-2 gap-3 w-full">
            <iframe
               v-for="post in posts.slice(0, 2)"
               :key="post.postaus_id"
               title="Instagram post"
               class="rounded-lg w-full h-[310px] border-0"
               :src="`https://www.instagram.com/p/${post.postaus_id}/embed/`"
               height="100%"
               scrolling="no"
               allowtransparency="true"
               tabindex="-1"
            ></iframe>
         </div>
         <div
            v-else
            class="flex flex-col items-center justify-center gap-3 rounded-lg bg-zinc-100 p-6 text-center dark:bg-zinc-800 w-full min-h-[180px] border border-gray-200 dark:border-gray-700"
         >
            <p class="text-sm font-semibold text-zinc-800 dark:text-zinc-100">{{ $t('embed_cookies_required') }}</p>
            <p class="text-xs text-zinc-600 dark:text-zinc-400 max-w-xs">{{ $t('tracking_disabled_embed') }}</p>
            <button
               type="button"
               class="rounded bg-custom-primary px-4 py-2 text-xs font-medium text-white hover:bg-custom-secondary transition-colors"
               @click="enableEmbeds"
            >
               {{ $i18n.locale === 'fi' ? 'Salli upotukset' : 'Enable embeds' }}
            </button>
            <a
               href="https://www.instagram.com/serveriry/"
               target="_blank"
               rel="noopener noreferrer"
               class="text-xs text-custom-primary underline hover:text-custom-secondary"
            >
               Instagram @serveriry
            </a>
         </div>
      </ClientOnly>
   </div>
</template>

<script setup lang="ts">
   import { useTrackingConsent } from '@/composables/useTrackingConsent';

   interface InstagramPost {
      postaus_id: string;
      sort?: number;
   }

   const config = useRuntimeConfig();
   const { trackingAllowed } = useTrackingConsent();

   const fallbackPosts: InstagramPost[] = [{ postaus_id: 'Dbl4exTo7W0' }, { postaus_id: 'DbkniSACCZS' }];

   // Fetch server-side via useFetch to avoid CORS issues
   const { data: apiResponse } = await useFetch<{ data: InstagramPost[] }>(
      `${config.public['API_URL']}items/instagram?sort=-sort&limit=2`,
      { default: () => ({ data: fallbackPosts }) },
   );

   const posts = computed(() => {
      const raw = apiResponse.value?.data;
      if (Array.isArray(raw) && raw.length > 0) {
         return raw.map((item) => ({
            ...item,
            postaus_id: item.postaus_id ? item.postaus_id.replace(/\/+$/, '') : '',
         }));
      }
      return fallbackPosts;
   });

   const enableEmbeds = () => {
      if (typeof document !== 'undefined') {
         const expires = new Date('2040-12-18T12:00:00Z').toUTCString();
         document.cookie = `cookie_notice_dismissed=true; expires=${expires}; path=/;`;
         document.cookie = `tracking_allowed=true; expires=${expires}; path=/;`;
         if (typeof window !== 'undefined') {
            window.dispatchEvent(new Event('tracking-consent-update'));
         }
      }
   };
</script>
