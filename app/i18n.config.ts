export default defineI18nConfig(() => ({
   fallbackLocale: { default: ['fi', 'en'] },
   detectBrowserLanguage: {
      useCookie: true,
      cookieKey: 'i18n_redirected',
      redirectOn: 'root',
   },
   locales: [
      {
         code: 'fi',
         iso: 'fi-FI',
         file: 'fi.json',
      },
      {
         code: 'en',
         iso: 'en-US',
         file: 'en.json',
      },
   ],
   lazy: true,
   langDir: 'lang',
   defaultLocale: 'fi',
}));
