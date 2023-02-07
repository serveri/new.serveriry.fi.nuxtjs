<template>
   <div>
      <Head>
         <Title>{{ $t('title_news') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_news') }}</h1>
      <div class="news pt-8">
         <NewsCard />
         <NewsCard />
         <NewsCard />
      </div>
   </div>
</template>

<script></script>

<style>
   .news {
      display: flex;
      gap: 2rem;
      grid-auto-rows: 8rem;
   }
</style>
