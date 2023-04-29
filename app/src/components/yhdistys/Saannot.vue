<template>
   <div class="py-8 pt-8">
      <vue-markdown class="rich-text" :source="content['rules_' + $i18n.locale]" />
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
      rules_fi: {
         type: String,
         default:
            '# Serveri ry:n järjestyssäännöt\n\n## Sääntöjen löytämisessä ongelmia, serverit liekeissä?\n\nyritä uudelleen myöhemmin',
         required: true,
      },
      rules_en: {
         type: String,
         default: "# Serveri ry's rules of order\n\n## Error finding rules, servers on fire?\n\ntry again later",
         required: true,
      },
      updated_at: {
         type: Date,
         default: new Date('01/01/1970'),
         required: true,
      },
   });
</script>
