import { onMounted, onUnmounted, ref } from 'vue';

const TRACKING_ALLOWED = 'tracking_allowed';
const COOKIE_NOTICE_DISMISSED = 'cookie_notice_dismissed';

function getCookie(name: string): string | null {
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
}

export function useTrackingConsent() {
   const trackingAllowed = ref(false);

   const readConsent = () => {
      const allowed = getCookie(TRACKING_ALLOWED);
      const dismissed = getCookie(COOKIE_NOTICE_DISMISSED);
      if (allowed === 'true') {
         trackingAllowed.value = true;
      } else if (dismissed === 'true' && allowed === null) {
         trackingAllowed.value = true;
      } else {
         trackingAllowed.value = false;
      }
   };

   onMounted(() => {
      readConsent();
      if (typeof window !== 'undefined') {
         window.addEventListener('tracking-consent-update', readConsent);
      }
   });

   onUnmounted(() => {
      if (typeof window !== 'undefined') {
         window.removeEventListener('tracking-consent-update', readConsent);
      }
   });

   return { trackingAllowed };
}
