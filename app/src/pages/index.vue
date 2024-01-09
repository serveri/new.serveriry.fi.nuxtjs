<template>
   <div class="flex flex-col justify-center items-center">
      <Head>
         <Title>{{ $t('title_front-page') }} - Serveri ry</Title>
      </Head>
      <section>
         <HeroSection class="w-screen" :content="content" />
      </section>

      <section class="sm:my-[-3rem] xl:sm:my-[-6rem] 2xl:sm:my-[-8rem] flex flex-col lg:flex-row md:gap-8">
         <DescriptionText :en_description="content.en_long_desc" :fi_description="content.fi_long_desc" />
         <TopNews />
      </section>

      <section class="py-8 w-screen sm:mt-12 xl:mt-28 2xl:mt-32">
         <div class="flex self-center justify-center">
            <SponsorCarousel />
         </div>
      </section>

      <section v-if="!showDiv" class="py-8 flex flex-col md:flex-row w-full gap-8">
         <LastNews
            class="md:w-1/2"
            v-if="article"
            :url="article?.id"
            :img="article.image"
            :fi_title="article.fi_title"
            :en_title="article.en_title"
            :date="article.date_created"
            :fi_text="article.fi_text"
            :en_text="article.en_text"
         />
         <InstagramFeed />
      </section>

      <section v-else class="py-8 flex flex-col md:flex-row items-center w-full gap-8">
         <LastNews
            v-if="article"
            :url="article.id"
            :img="article.image"
            :fi_title="article.fi_title"
            :en_title="article.en_title"
            :date="article.date_created"
            :fi_text="article.fi_text"
            :en_text="article.en_text"
         />
      </section>

      <section class="pt-8">
         <EmbeddedMap />
      </section>

      <section>
         <h2 class="custom-page-title my-7">Löydät Serverin myös täältä!</h2>

         <div class="grid grid-cols-2 gap-8 mb-8 sm:grid-cols-3 md:grid-cols-4 md:gap-8 lg:grid-cols-6 lg:gap-7">
            <SocialmediaIcon
               v-for="some in SoMes"
               :key="some.nimi"
               :url="some.url"
               :img="some.img"
               :alt="'Serverin' + some.nimi"
               :name="some.nimi"
               :fi_desc="some.fi_kuvaus"
               :en_desc="some.en_kuvaus"
               :custom_style="some.custom_css"
            />
         </div>
      </section>
   </div>
</template>

<script setup lang="ts">
   import InstagramFeed from '@/components/langingpage/InstagramFeed.vue';
   import LastNews from '@/components/langingpage/LastNews.vue';
   import EmbeddedMap from '@/components/langingpage/EmbeddedMap.vue';
   import HeroSection from '@/components/langingpage/HeroSection.vue';
   import DescriptionText from '@/components/langingpage/DescriptionText.vue';
   import TopNews from '@/components/langingpage/TopNews.vue';
   import SponsorCarousel from '@/components/langingpage/SponsorCarousel.vue';
   import SocialmediaIcon from '@/components/langingpage/SocialmediaIcon.vue';
   import type { Data } from '@/types';
   const config = useRuntimeConfig();

   interface Content {
      fi_title: string;
      en_title: string;
      fi_description: string;
      en_description: string;
      fi_button_text: string;
      en_button_text: string;
      fi_button_url: string;
      en_button_url: string;
      custom_css: string;
      en_long_desc: string;
      fi_long_desc: string;
   }
   let content: Content = {
      fi_title: 'Serveri ry',
      en_title: 'Serveri ry',
      fi_description: 'Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö',
      en_description:
         "The computer science students' subject organization of the Kuopio campus of the University of Eastern Finland",
      fi_button_text: 'Millaista tietojenkäsittelytiede on?',
      en_button_text: 'What is computer science like?',
      fi_button_url: '/opiskelu/tkt',
      en_button_url: '/opiskelu/tkt',
      custom_css: '',
      en_long_desc: '',
      fi_long_desc: '',
   };
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/LandingPage`)) as { data: Data };
      content = {
         ...content,
         ...data.value.data,
      };
   } catch (e) {
      console.log('Error fetching LandingPage');
   }
   interface Article {
      id: string;
      image: string;
      fi_title: string;
      en_title: string;
      date_created: string;
      fi_text: string;
      en_text: string;
   }
   let articles: Article[] = [
      {
         id: 'f4d13a49-0539-442f-a5e9-6f486ff4d5d7',
         image: config.public['API_URL'] + '/assets/231aba36-a03b-47c6-811a-b6dfe14ccddb',
         fi_title: 'Api Error',
         en_title: 'Api Error',
         date_created: '09/25/2022',
         fi_text: 'Api Error',
         en_text: 'Api Error',
      },
   ];
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/uutiset`)) as { data: Data };
      articles = {
         ...articles,
         ...data.value.data,
      };
   } catch (e) {
      console.log('Error fetching articles');
   }
   const article: Article = articles[articles.length - 1]; // Get the last article

   interface SoMe {
      nimi: string;
      url: string;
      img: string;
      fi_kuvaus: string;
      en_kuvaus: string;
      custom_css: string;
   }
   let SoMes: SoMe[] = [
      {
         nimi: 'Telegram',
         url: 'https://example.com/',
         img: '/images/placeholder-square.jpg',
         fi_kuvaus: '',
         en_kuvaus: '',
         custom_css: '',
      },
   ];
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/sosiaaliset_mediat`)) as { data: Data };
      SoMes = {
         ...SoMes,
         ...data.value.data,
      };
   } catch (e) {
      console.log('Error fetching Social Medias');
   }
</script>

<script lang="ts">
   export default {
      computed: {
         showDiv() {
            if (process.client) {
               // Check the cookie value and return a boolean
               const cookieValue = this.getCookieValue('cookieconsent_status');
               return cookieValue === 'deny'; // if cookie value is not allow, return true
            }
         },
      },
      methods: {
         getCookieValue(cookieName: string) {
            if (process.client) {
               const name = cookieName + '=';
               const decodedCookie = decodeURIComponent(document.cookie);
               const cookieArray = decodedCookie.split(';');

               for (let i = 0; i < cookieArray.length; i++) {
                  let cookie = cookieArray[i];
                  while (cookie.charAt(0) === ' ') {
                     cookie = cookie.substring(1);
                  }
                  if (cookie.indexOf(name) === 0) {
                     return cookie.substring(name.length, cookie.length);
                  }
               }
               return '';
            }
         },
         setCookieValue(cookieName: string, value: string) {
            if (process.client) {
               document.cookie = `${cookieName}=${value}; path=/`;
            }
         },
      },
   };
</script>

<style>
   p {
      @apply tracking-wide;
   }
</style>
