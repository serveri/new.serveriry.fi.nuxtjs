<template>
   <div>
      <!--  news article with image header and content   -->
      <div class="NewsCard">
         <article class="py-8">
            <h2 class="card-header py-6 text-2xl font-extrabold">{{ news[$i18n.locale + '_title'] }}</h2>

            <img class="object-cover md:h-[35rem] w-full p-0 m-0" :src="news.image" alt="Photo related to the news article." />

            <p class="news-date font-normal uppercase py-2 text-xs">
               {{ $t('news_released') }}
               <span>
                  {{
                     released_date.toLocaleDateString($i18n.locale, {
                        weekday: 'long',
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        hour: 'numeric',
                        minute: 'numeric',
                     })
                  }}
               </span>
            </p>

            <vue-markdown class="rich-text py-2" :source="news[$i18n.locale + '_text']" />
         </article>
      </div>
   </div>
</template>

<script>
   export default {
      name: '[id].vue',
   };
</script>

<script setup>
   import VueMarkdown from 'vue-markdown-render';
   // This hard coded data will be replaced with data from directus
   let news;
   const route = useRoute();
   let released_date = new Date();
   try {
      // TODO: FIX THIS BUG
      const response = await useFetch('http://127.0.0.1:8081/items/news/' + route.params.id);
      if (response?.data?.value?.data) {
         news = response.data.value.data;
         released_date = new Date(news.date_created);
      } else {
         news = {
            image: 'https://api.serveriry.fi/uploads/large_computerstuffwithlogo_da6b992e47.jpg',
            id: route.params.id,
            fi_title: 'Uutisen otsikon pitäisi olla tässä',
            en_title: 'The news title should be here',
            fi_text: 'Valitettavasti rest rajapintaan ei saada yhteyttä, ovatkohan serverit liekeissä?',
            en_text: 'But unfortunately we cannot connect to the rest interface, maybe the servers are on fire?',
            date: new Date(),
         };
      }
   } catch (error) {
      news = {
         image: 'https://api.serveriry.fi/uploads/large_computerstuffwithlogo_da6b992e47.jpg',
         id: route.params.id,
         fi_title: 'Uutisen otsikon pitäisi olla tässä',
         en_title: 'The news title should be here',
         fi_text: 'Mutta valitettavasti rest rajapintaan ei saada yhteyttä, onkohan serverit liekeissä?',
         en_text: 'But unfortunately we cannot connect to the rest interface, maybe the servers are on fire?',
         date: new Date(),
      };
   }
</script>

<style scoped></style>
