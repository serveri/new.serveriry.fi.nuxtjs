<template>
   <div class="flex flex-col justify-center items-center">
      <section>
         <HeroSection class="w-screen" :content="content" />
      </section>

      <section class="sm:-mt-12 xl:sm:-mt-24 2xl:sm:-mt-32 flex flex-col lg:flex-row md:gap-8">
         <DescriptionText :en_description="content.en_long_desc" :fi_description="content.fi_long_desc" />
         <TopNews />
      </section>

      <section class="w-full container mx-auto mt-8">
         <LastNews
            v-if="lastArticle"
            :url="lastArticle.id"
            :img="lastArticle.image"
            :fi_title="lastArticle.fi_title"
            :en_title="lastArticle.en_title"
            :date="lastArticle.date_created"
            :fi_text="lastArticle.fi_text"
            :en_text="lastArticle.en_text"
         />
      </section>

      <section class="w-full">
         <partner-page-section />
      </section>

      <section class="pt-8">
         <EmbeddedMap />
      </section>

      <section>
         <h2 class="custom-page-title my-7">
            {{ locale === 'en' ? 'You can also find Serveri here!' : 'Löydät Serverin myös täältä!' }}
         </h2>

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
   import LastNews from '@/components/langingpage/LastNews.vue';
   import EmbeddedMap from '@/components/langingpage/EmbeddedMap.vue';
   import HeroSection from '@/components/langingpage/HeroSection.vue';
   import DescriptionText from '@/components/langingpage/DescriptionText.vue';
   import TopNews from '@/components/langingpage/TopNews.vue';
   import SocialmediaIcon from '@/components/langingpage/SocialmediaIcon.vue';
   import type { Data } from '@/types';
   import { toRaw, computed, watchEffect } from 'vue';
   import PartnerPageSection from '@/components/partners/PartnerPageSection.vue';
   import { useI18n } from 'vue-i18n';
   const { t, locale } = useI18n();
   const config = useRuntimeConfig();

   // Page title via head
   const pageTitle = computed(() => `${t('title_front-page')} - Serveri ry`);
   watchEffect(() => {
      useHead({ title: pageTitle.value });
   });

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
   const articles = ref<Article[]>([
      {
         id: 'f4d13a49-0539-442f-a5e9-6f486ff4d5d7',
         image: config.public['API_URL'] + '/assets/231aba36-a03b-47c6-811a-b6dfe14ccddb',
         fi_title: 'Api Error',
         en_title: 'Api Error',
         date_created: '09/25/2022',
         fi_text: 'Api Error',
         en_text: 'Api Error',
      },
   ]);

   try {
      const { data } = (await useFetch(
         `${config.public['API_URL']}items/uutiset?filter[status][_eq]=published&sort=sort&limit=1`,
      )) as { data: Data };
      const list = data?.value?.data;
      if (Array.isArray(list) && list.length > 0) {
         const _article = toRaw(list[0]) as Article;
         articles.value.push(_article);
      }
   } catch (e) {
      console.log('Error fetching articles: ', e);
   }
   const lastArticle = computed<Article | null>(() =>
      articles.value.length > 0 ? (articles.value[articles.value.length - 1] as Article) : null,
   );

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
         img: 'https://api.serveriry.fi/assets/3e47b669-5e97-4a9d-b48e-f3161e669551',
         fi_kuvaus: '',
         en_kuvaus: '',
         custom_css: '',
      },
   ];
   try {
      const { data } = (await useFetch(`${config.public['API_URL']}items/sosiaaliset_mediat`)) as { data: Data };
      SoMes = Array.isArray(data.value.data) ? (data.value.data as SoMe[]) : SoMes;
   } catch (e) {
      console.log('Error fetching Social Medias');
   }
</script>

<style scoped>
   p {
      letter-spacing: 0.025em;
   }
</style>
