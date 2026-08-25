/**
 * Escape HTML special characters to prevent XSS when injecting into attributes.
 */
function escapeHtml(str: string): string {
   return str
      .replace(/&/g, '&amp;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#39;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;');
}

/**
 * Pre-process markdown content to transform extended image syntax
 * (pipe-based sizing/alignment) into HTML img tags.
 *
 * Supported syntaxes:
 *   ![alt|50%](url)              - scale by percentage
 *   ![alt|400px|center](url)     - scale by pixels and center
 *   ![alt](url =300x)            - trailing dimension
 *   ![alt](url#50%)              - hash sizing
 *   ![alt](url?width=400)        - query param sizing
 */
export function processMarkdown(content?: string): string {
   if (!content) return '';

   // Protect code blocks and inline code from being transformed.
   // Replace them with placeholders, run the image regex, then restore.
   const codeBlocks: string[] = [];
   const placeholder = (i: number) => `\x00CODE_BLOCK_${i}\x00`;

   let safe = content.replace(/```[\s\S]*?```|`[^`]+`/g, (match) => {
      codeBlocks.push(match);
      return placeholder(codeBlocks.length - 1);
   });

   // Match markdown images: ![alt](url) with optional attributes
   safe = safe.replace(
      /!\[([^\]]*)\]\(([^)\s]+)(?:\s+(=?\d+x?\d*|"[^"]*"|'[^']*'))?\)/g,
      (match, altText, rawUrl, extra) => {
         let alt = (altText || '').trim();
         let url = rawUrl;
         let size = '';
         let align = '';

         // 1. Check if alt has pipe-separated syntax: ![alt|50%|center](url) or ![alt|300px](url)
         if (alt.includes('|')) {
            const parts = alt.split('|').map((p: string) => p.trim());
            alt = parts[0];
            for (let i = 1; i < parts.length; i++) {
               const p = parts[i].toLowerCase();
               if (p === 'center' || p === 'left' || p === 'right') {
                  align = p;
               } else if (/^\d+(?:px|%|rem|em|vw)$/.test(p) || /^\d+$/.test(p)) {
                  size =
                     p.endsWith('px') || p.endsWith('%') || p.endsWith('rem') || p.endsWith('em') || p.endsWith('vw')
                        ? p
                        : `${p}px`;
               }
            }
         }

         // 2. Check trailing sizing parameter like =300x or =300x200
         if (!size && extra && extra.startsWith('=')) {
            const dim = extra.replace(/^=/, '').replace(/x\d*$/, '');
            if (dim && /^\d+$/.test(dim)) {
               size = `${dim}px`;
            }
         }

         // 3. Check hash in URL like url#50% or url#400px
         if (!size && url.includes('#')) {
            const [cleanUrl, hash] = url.split('#');
            if (hash && (/^\d+(?:px|%|rem|em|vw)$/.test(hash) || /^\d+$/.test(hash))) {
               size =
                  hash.endsWith('px') ||
                  hash.endsWith('%') ||
                  hash.endsWith('rem') ||
                  hash.endsWith('em') ||
                  hash.endsWith('vw')
                     ? hash
                     : `${hash}px`;
               url = cleanUrl;
            }
         }

         // 4. Check query param in URL like ?width=400 or ?w=50%
         if (!size && url.includes('?')) {
            try {
               const parsedUrl = new URL(url, 'https://dummy.local');
               const widthParam = parsedUrl.searchParams.get('width') || parsedUrl.searchParams.get('w');
               if (widthParam) {
                  size = widthParam.endsWith('%') || widthParam.endsWith('px') ? widthParam : `${widthParam}px`;
               }
            } catch {
               // Fallback if URL parsing fails
            }
         }

         if (size || align) {
            let style = 'height: auto;';
            if (size) {
               style += ` max-width: ${size}; width: 100%;`;
            }
            if (align === 'center') {
               style += ' margin: 1rem auto; display: block;';
            } else if (align === 'right') {
               style += ' margin-left: auto; margin-right: 0; display: block;';
            } else if (align === 'left') {
               style += ' margin-right: auto; margin-left: 0; display: block;';
            } else {
               style += ' display: block; margin: 1rem 0;';
            }

            const safeAlt = escapeHtml(alt);
            const safeUrl = escapeHtml(url);
            const titleAttr =
               extra && (extra.startsWith('"') || extra.startsWith("'"))
                  ? ` title="${escapeHtml(extra.slice(1, -1))}"`
                  : '';
            return `<img src="${safeUrl}" alt="${safeAlt}" style="${style}" class="my-4"${titleAttr} />`;
         }

         return match;
      },
   );

   // Restore code blocks from placeholders
   for (let i = 0; i < codeBlocks.length; i++) {
      safe = safe.replace(placeholder(i), codeBlocks[i]);
   }

   return safe;
}
