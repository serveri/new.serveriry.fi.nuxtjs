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
            :desc="member.description"
            :role="member.role"
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
            role: 'Jäsen',
            email: 'email@serveriry.fi',
            telegram: 'telegram',
            name: 'API error',
            description: 'joo joku ongelma vissii serverit tulessa :O',
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
      grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));
   }

   p {
      @apply paragraph;
   }
</style>
