<template>
   <Head>
      <Title>{{ $t('title_board') }} - Serveri ry</Title>
   </Head>
   <div>
      <vue-markdown class="rich-text py-2" :source="text[$i18n.locale + '_text']" />

      <h2 class="board-header font-extrabold mt-8 mb-1 text-3xl text-center">Kokoonpano</h2>

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
   let members;
   let text;
   try {
      let response = await useFetch('https://api.serveri.jeb4.dev/items/board_members');
      members = response.data.value.data;
      response = await useFetch('https://api.serveri.jeb4.dev/items/hallitus_page');
      text = response.data.value.data;
   } catch (e) {
      members = [
         {
            img: '/images/member.jpeg',
            hover_img: '/images/member2.jpeg',
            fi_role: 'Jäsen',
            en_role: 'Member',
            email: 'email@serveriry.fi',
            telegram: 'telegram',
            name: 'API error',
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
   .custom-grid {
      display: grid;
      gap: 2rem;
      grid-template-columns: repeat(auto-fit, minmax(16.5rem, 1fr));
   }

   p {
      @apply font-light tracking-wide text-gray-500 dark:text-gray-400 sm:text-xl;
   }
</style>
