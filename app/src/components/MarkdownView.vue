<template>
   <vue-markdown-render :source="processedContent" :options="{ html: true }" />
</template>

<script setup lang="ts">
   import VueMarkdownRender from 'vue-markdown-render';
   import { computed } from 'vue';
   import { processMarkdown } from '@/composables/useMarkdownProcessor';

   const props = defineProps<{
      source?: string;
   }>();

   const processedContent = computed(() => processMarkdown(props.source || ''));
</script>
