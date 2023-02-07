<template>
   <div>
      <Head>
         <Title>{{ $t('title_news') }} - Serveri ry</Title>
      </Head>
      <h1 class="custom-page-title">{{ $t('h1_news') }}</h1>
         <div class="news pt-8">
            <NewsCard/>      
            <NewsCard/>  
            <NewsCard/>
            <NewsCard/>
            <NewsCard/>
         </div>
   </div>
   
   

</template>

<script>

</script>


<style>
.news{
   padding-bottom: 3rem;
   display: grid;
   gap: 2rem;
   grid-template-columns:auto auto auto;
}
</style>
