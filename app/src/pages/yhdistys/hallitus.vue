<template>
   <Head>
      <Title>{{ $t('title_board') }} - Serveri ry</Title>
   </Head>
   <div>
      <vue-markdown class="rich-text py-2" :source="text[$i18n.locale + '_text']" />

      <h2 class="board-header font-extrabold mt-8 mb-1 text-3xl text-center">
         {{ $i18n.locale === 'fi' ? 'Kokoonpano' : 'Composition of the board' }}
      </h2>

      <div class="board-members py-8 custom-grid">
         <CommitteeCard
            v-for="member in members"
            :id="member.name"
            :key="member.name"
            :img="member.img"
            :hover_img="member.hover_img"
            :name="member.name"
            :email="member.email"
            :telegram="member.telegram"
            :fi_desc="member.fi_desc"
            :en_desc="member.en_desc"
            :fi_role="member.fi_role"
            :en_role="member.en_role"
         />
      </div>
   </div>
</template>

<script setup lang="ts">
   import VueMarkdown from 'vue-markdown-render';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   let members;
   let text;
   try {
      const { data: membersData } = (await useFetch(`${config.public['API_URL']}items/board_members`)) as {
         data: Data;
      };
      members = membersData.value.data;
      const { data: textData } = (await useFetch(`${config.public['API_URL']}items/hallitus_page`)) as { data: Data };
      text = textData.value.data;
   } catch (e) {
      members = [
         {
            img: '/images/hallitus-placeholder.png',
            hover_img: '/images/hallitus-placeholder.png',
            fi_role: 'Jäsen',
            en_role: 'Member',
            email: 'email@serveriry.fi',
            telegram: 'telegram',
            name: 'API Error',
            fi_description: 'joo joku ongelma vissii serverit tulessa :O',
            en_description: 'Api error',
         },
      ];
      text = {
         fi_text: 'API error',
         en_text: 'API error',
      };
   }
</script>

<style scoped>
   @import 'tailwindcss';
   .custom-grid {
      display: grid;
      gap: 2rem;
      grid-template-columns: repeat(auto-fit, minmax(16.5rem, 1fr));
   }

   p {
      @apply font-light tracking-wide text-gray-500 dark:text-gray-400 sm:text-xl;
   }
</style>
