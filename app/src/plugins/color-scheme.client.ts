// Ensures the initial color scheme is applied before the app mounts to avoid SSR/CSR mismatch
export default defineNuxtPlugin(() => {
  if (process.server) return;

  try {
    const cookieVal = (() => {
      const match = document.cookie.match(/(?:^|; )color-scheme=([^;]+)/);
      const group = match?.[1];
      return typeof group === 'string' ? decodeURIComponent(group) : null;
    })();

    const prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;

    // Decide initial value: cookie > localStorage > system preference > light
    const lsVal = localStorage.getItem('color-scheme');
    const initial = (cookieVal === 'dark' || cookieVal === 'light')
      ? cookieVal
      : (lsVal === 'dark' || lsVal === 'light')
        ? lsVal
        : prefersDark ? 'dark' : 'light';

    // Apply to <html>
    const html = document.documentElement;
    if (initial === 'dark') {
      html.classList.add('dark');
    } else {
      html.classList.remove('dark');
    }

    // Sync storage so useDark picks the same value
    localStorage.setItem('color-scheme', initial);
    document.cookie = `color-scheme=${initial}; expires=${new Date('2040-01-01T12:00:00Z').toUTCString()}; path=/;`;
  } catch (e) {
    // No-op: if anything fails, default to light to keep UI usable
  }
});
