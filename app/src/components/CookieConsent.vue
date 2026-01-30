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
                     ? 'We only use essential cookies to remember your preferences (theme and language). No tracking or analytics cookies are used.'
                     : 'Käytämme vain välttämättömiä evästeitä asetustesi muistamiseen (teema ja kieli). Emme käytä seuranta- tai analytiikkaevästeitä.'
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
         <button
            type="button"
            class="mt-1 w-full rounded bg-custom-primary px-4 py-2 text-sm font-medium text-white hover:bg-custom-secondary md:mt-0 md:w-auto"
            @click="dismiss"
         >
            {{ locale === 'en' ? 'OK' : 'Selvä' }}
         </button>
      </div>
   </div>
</template>

<script setup lang="ts">
   import { onMounted, ref } from 'vue';
   import { useI18n } from 'vue-i18n';

   const { locale } = useI18n();

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

   const dismiss = () => {
      if (typeof document === 'undefined') return;
      const expires = new Date('2040-12-18T12:00:00Z').toUTCString();
      document.cookie = `cookie_notice_dismissed=true; expires=${expires}; path=/;`;
      isDismissed.value = true;
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
