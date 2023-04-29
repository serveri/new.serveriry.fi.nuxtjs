<template>
   <div class="py-8">
      <vue-markdown class="rich-text" :source="content['safe_space_' + $i18n.locale]" />
      <p class="py-4">
         {{
            $t('updated_last_time') +
            content.updated_at.toLocaleDateString($i18n.locale, {
               weekday: 'long',
               year: 'numeric',
               month: 'long',
               day: 'numeric',
            })
         }}
      </p>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';

   const content = defineProps({
      safe_space_fi: {
         type: String,
         default:
            '# Turvallisemman tilan periaatteet\n\n ## Sääntöjen löytämisessä ongelmia, serverit liekeissä?\n\nyritä uudelleen myöhemmin',
         required: true,
      },
      safe_space_en: {
         type: String,
         default: '# Consepts of Safer Space\n\n## Error finding rules, servers on fire?\n\ntry again later',
         required: true,
      },
      updated_at: {
         type: Date,
         default: new Date('01/01/1970'),
         required: true,
      },
   });
</script>
