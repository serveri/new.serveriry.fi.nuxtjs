export function useDirectusAsset() {
   const config = useRuntimeConfig();
   const directusUrl = (config.public.DIRECTUS_URL || 'https://api.serveriry.fi/').replace(/\/$/, '') + '/';

   const getAssetUrl = (
      src?: string | { id?: string } | null,
      options: {
         width?: number;
         height?: number;
         quality?: number;
         fit?: 'cover' | 'contain' | 'inside' | 'outside';
      } = {
         width: 800,
         height: 450,
         quality: 80,
         fit: 'cover',
      },
   ): string => {
      if (!src) return '';
      const raw = typeof src === 'object' && src !== null ? src.id : src;
      if (!raw) return '';

      let fullUrl = '';
      if (raw.startsWith('http://') || raw.startsWith('https://')) {
         fullUrl = raw;
      } else if (raw.startsWith('/assets/')) {
         fullUrl = `${directusUrl}assets/${raw.replace(/^\/assets\//, '')}`;
      } else if (raw.startsWith('assets/')) {
         fullUrl = `${directusUrl}assets/${raw.replace(/^assets\//, '')}`;
      } else if (raw.startsWith('/')) {
         fullUrl = raw;
      } else {
         // Directus file UUID
         fullUrl = `${directusUrl}assets/${raw}`;
      }

      // If it points to Directus assets, apply transformation parameters (which triggers server-side focal point cropping)
      if (fullUrl.includes('/assets/')) {
         try {
            const urlObj = new URL(fullUrl, directusUrl);
            if (options.fit) urlObj.searchParams.set('fit', options.fit);
            if (options.width) urlObj.searchParams.set('width', String(options.width));
            if (options.height) urlObj.searchParams.set('height', String(options.height));
            if (options.quality) urlObj.searchParams.set('quality', String(options.quality));
            return urlObj.toString();
         } catch {
            return fullUrl;
         }
      }

      return fullUrl;
   };

   return { getAssetUrl, directusUrl };
}
