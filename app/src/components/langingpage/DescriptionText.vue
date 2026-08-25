<template>
   <div class="flex items-start lg:max-w-[60%] pb-6">
      <MarkdownView class="rich-text py-2" :source="data[$i18n.locale + '_description']" />
   </div>
</template>

<script setup>
   const data = defineProps({
      en_description: {
         type: String,
         default: 'Why are the servers so hot? Because no one can resist white overalls! BTW API does not respond.',
         required: true,
      },
      fi_description: {
         type: String,
         default:
            'Miksi serverit on niin kuumia? Koska kukaan ei voi vastustaa valkoisia haalareita! API ei muuten vastaa.',
         required: true,
      },
   });
</script>
