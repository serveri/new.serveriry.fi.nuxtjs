<template>
   <ClientOnly>
      <div v-if="revealed" class="inline-flex items-center">
         <font-awesome-icon class="fa-xl mr-1" :icon="['fas', 'envelope']" />
         <a :href="'mailto:' + fullEmail" class="member-email hover:underline">
            {{ fullEmail }}
         </a>
      </div>
      <button
         v-else
         type="button"
         class="inline-flex items-center underline cursor-pointer hover:opacity-80 transition-opacity"
         @click="revealEmail"
      >
         <font-awesome-icon class="fa-xl mr-1" :icon="['fas', 'envelope']" />
         <span>{{ $t('show_email') }}</span>
      </button>

      <template #fallback>
         <span class="inline-flex items-center underline">
            <font-awesome-icon class="fa-xl mr-1" :icon="['fas', 'envelope']" />
            <span>{{ $t('show_email') }}</span>
         </span>
      </template>
   </ClientOnly>
</template>

<script setup lang="ts">
   import { ref, computed } from 'vue';
   import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

   const props = withDefaults(
      defineProps<{
         user?: string;
         domain?: string;
         email?: string;
      }>(),
      {
         user: '',
         domain: 'serveriry.fi',
         email: '',
      },
   );

   const revealed = ref(false);

   const fullEmail = computed(() => {
      if (props.email) {
         return props.email.includes('@') ? props.email : `${props.email}@${props.domain}`;
      }
      return `${props.user}@${props.domain}`;
   });

   const revealEmail = () => {
      revealed.value = true;
   };
</script>

<style scoped></style>
