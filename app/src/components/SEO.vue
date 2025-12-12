<script setup lang="ts">
   defineProps<{
      seo: object;
   }>();

   const config = useRuntimeConfig();
</script>

<template>
   <Head>
      <!-- Default -->
      <Meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <Meta charset="UTF-8" />
      <Title>Serveri ry</Title>
      <Meta
         name="description"
         content="Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö."
      />
      <Meta
         name="keywords"
         content="Serveri, Serveri ry, Tietojenkäsittelytiede, UEF, Itä-Suomen yliopisto, Ainejärjestö, Kuopio, TKT"
      />
      <Meta name="robots" content="index,follow" />
      <!-- Open Graph-->
      <Meta name="og:title" content="Serveri ry" />
      <Meta
         name="og:description"
         content="Itä-Suomen yliopiston Kuopion kampuksen tietojenkäsittelytieteen opiskelijoiden ainejärjestö."
      />
      <Meta name="og:image" :content="config.public['API_URL'] + 'assets/b3ed6d7f-c124-4136-9234-cbd91fccff0f'" />
      <Meta name="og:url" content="https://serveriry.fi/" />
      <Meta property="og:locale" :content="$i18n.locale" />
      <Meta property="og:type" content="website" />
      <Meta property="og:site_name" content="Serveri ry" />
      <Meta property="og:locale:alternate" :content="$i18n.locale === 'fi' ? 'en_US' : 'fi_FI'" />
      <!-- Icon -->
      <Link rel="icon" href="https://api.serveriry.fi/assets/5404c898-6ac5-485b-bdb8-185ed5e1e374" />

      <!-- From API -->
      <Title v-if="seo.title"> {{ seo.title }} </Title>
      <Meta
         name="robots"
         :content="[seo.no_follow ? 'nofollow' : 'follow', seo.no_index ? 'noindex' : 'index'].join(',')"
      />
      <Meta v-if="seo.description" name="description" :content="seo.meta_description" />
      <Meta v-if="seo.keywords" property="keywords" :content="seo.keywords" />
      <!-- Open Graph-->
      <Meta v-if="seo.title" property="og:title" :content="seo.title" />
      <Meta v-if="seo.description" property="og:description" :content="seo.meta_description" />
      <Meta name="og:image" :content="config.public['API_URL'] + 'assets/' + seo.og_image" />
      <Meta property="og:url" :content="seo.canonical_url" />
      <link rel="canonical" :href="seo.canonical_url" />
      <link rel="alternate" :href="seo.canonical_url" hreflang="fi" />
   </Head>
</template>
