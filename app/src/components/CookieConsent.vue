<template>
   <div
      v-if="!isDismissed && isPageLoaded"
      class="fixed inset-x-0 bottom-0 z-50 border-t border-zinc-200 bg-white p-4 text-sm dark:border-zinc-700 dark:bg-zinc-900"
   >
      <div class="flex w-full flex-col gap-3 md:flex-row md:items-center md:justify-between">
         <div class="space-y-2 md:max-w-md">
            <p class="text-zinc-800 dark:text-zinc-100">
               {{
                  locale === 'en'
                     ? 'We use essential cookies for preferences (theme and language). Embedded content (e.g. YouTube, Instagram, maps) may set third-party cookies if you allow.'
                     : 'Käytämme välttämättömiä evästeitä asetuksille (teema ja kieli). Upotettu sisältö (esim. YouTube, Instagram, kartat) voi asettaa kolmannen osapuolen evästeitä, jos sallit.'
               }}
            </p>
            <NuxtLink
               to="/gdpr"
               class="text-xs font-medium text-custom-primary underline hover:text-custom-secondary"
            >
               {{
                  locale === 'en'
                     ? 'Read more about cookies and data protection'
                     : 'Lue lisää evästeistä ja tietosuojasta'
               }}
            </NuxtLink>
         </div>
         <div class="mt-1 flex w-full flex-wrap gap-2 md:mt-0 md:w-auto">
            <button
               type="button"
               class="rounded border border-zinc-400 px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:border-zinc-500 dark:text-zinc-300 dark:hover:bg-zinc-800"
               @click="dismissEssentialOnly"
            >
               {{ locale === 'en' ? 'Essential only' : 'Vain välttämättömät' }}
            </button>
            <button
               type="button"
               class="rounded bg-custom-primary px-4 py-2 text-sm font-medium text-white hover:bg-custom-secondary"
               @click="dismissAcceptAll"
            >
               {{ locale === 'en' ? 'Accept all' : 'Hyväksy kaikki' }}
            </button>
         </div>
      </div>
      <div
         v-if="isDev"
         class="mt-3 flex flex-wrap items-center gap-2 border-t border-zinc-300 pt-3 dark:border-zinc-600"
      >
         <span class="text-xs font-medium text-zinc-500 dark:text-zinc-400">Dev: test consent</span>
         <button
            type="button"
            class="rounded border border-amber-500 px-2 py-1 text-xs text-amber-700 hover:bg-amber-100 dark:border-amber-600 dark:text-amber-400 dark:hover:bg-amber-900/40"
            @click="setTrackingOnly(true)"
         >
            Set Accept all (no dismiss)
         </button>
         <button
            type="button"
            class="rounded border border-amber-500 px-2 py-1 text-xs text-amber-700 hover:bg-amber-100 dark:border-amber-600 dark:text-amber-400 dark:hover:bg-amber-900/40"
            @click="setTrackingOnly(false)"
         >
            Set Essential only (no dismiss)
         </button>
         <button
            type="button"
            class="rounded border border-zinc-400 px-2 py-1 text-xs text-zinc-600 hover:bg-zinc-100 dark:text-zinc-400 dark:hover:bg-zinc-800"
            @click="resetAndShowBanner"
         >
            Reset & show banner again
         </button>
      </div>
   </div>
   <div
      v-else-if="isDev && isPageLoaded"
      class="fixed bottom-4 right-4 z-40 flex flex-wrap gap-2 rounded border border-amber-500/70 bg-amber-50/95 px-3 py-2 text-xs dark:border-amber-600 dark:bg-amber-950/90"
   >
      <span class="font-medium text-amber-800 dark:text-amber-200">Cookie test</span>
      <button
         type="button"
         class="rounded border border-amber-600 px-2 py-1 text-amber-800 hover:bg-amber-200 dark:border-amber-500 dark:text-amber-200 dark:hover:bg-amber-800/50"
         @click="setTrackingOnly(true)"
      >
         Accept all
      </button>
      <button
         type="button"
         class="rounded border border-amber-600 px-2 py-1 text-amber-800 hover:bg-amber-200 dark:border-amber-500 dark:text-amber-200 dark:hover:bg-amber-800/50"
         @click="setTrackingOnly(false)"
      >
         Essential only
      </button>
      <button
         type="button"
         class="rounded border border-zinc-500 px-2 py-1 text-zinc-700 hover:bg-zinc-200 dark:text-zinc-300 dark:hover:bg-zinc-700"
         @click="resetAndShowBanner"
      >
         Show banner
      </button>
   </div>
</template>

<script setup lang="ts">
   import { onMounted, ref } from 'vue';
   import { useI18n } from 'vue-i18n';

   const { locale } = useI18n();
   const config = useRuntimeConfig();
   const isDev = config.public.cookieBannerDev as boolean;

   const isDismissed = ref(false);
   const isPageLoaded = ref(false);

   const getCookie = (name: string): string | null => {
      if (typeof document === 'undefined') return null;
      const cookieString = document.cookie || '';
      const cookies = cookieString ? cookieString.split(';') : [];
      for (const raw of cookies) {
         const cookie = (raw || '').trim();
         if (cookie.startsWith(name + '=')) {
            return cookie.substring(name.length + 1);
         }
      }
      return null;
   };

   const setCookie = (name: string, value: string) => {
      if (typeof document === 'undefined') return;
      const expires = new Date('2040-12-18T12:00:00Z').toUTCString();
      document.cookie = `${name}=${value}; expires=${expires}; path=/;`;
   };

   const clearCookie = (name: string) => {
      if (typeof document === 'undefined') return;
      document.cookie = `${name}=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/;`;
   };

   const dismissEssentialOnly = () => {
      setCookie('cookie_notice_dismissed', 'true');
      setCookie('tracking_allowed', 'false');
      isDismissed.value = true;
      if (typeof window !== 'undefined') window.dispatchEvent(new Event('tracking-consent-update'));
   };

   const dismissAcceptAll = () => {
      setCookie('cookie_notice_dismissed', 'true');
      setCookie('tracking_allowed', 'true');
      isDismissed.value = true;
      if (typeof window !== 'undefined') window.dispatchEvent(new Event('tracking-consent-update'));
   };

   const setTrackingOnly = (allow: boolean) => {
      setCookie('tracking_allowed', allow ? 'true' : 'false');
      if (typeof window !== 'undefined') window.dispatchEvent(new Event('tracking-consent-update'));
   };

   const resetAndShowBanner = () => {
      clearCookie('cookie_notice_dismissed');
      clearCookie('tracking_allowed');
      isDismissed.value = false;
      if (typeof window !== 'undefined') window.dispatchEvent(new Event('tracking-consent-update'));
   };

   onMounted(() => {
      if (typeof document !== 'undefined') {
         const dismissed = getCookie('cookie_notice_dismissed');
         if (dismissed === 'true') {
            isDismissed.value = true;
         }
      }
      isPageLoaded.value = true;
   });
</script>
