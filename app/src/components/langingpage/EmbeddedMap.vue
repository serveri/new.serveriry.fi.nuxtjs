<template>
   <section class="relative w-[100vw]">
      <div class="absolute w-[100vw] h-full bg-gray-300 dark:bg-gray-600">
         <client-only>
            <iframe
               width="100%"
               height="100%"
               frameborder="0"
               marginheight="0"
               marginwidth="0"
               title="map"
               scrolling="no"
               src="https://www.openstreetmap.org/export/embed.html?bbox=27.61370658874512%2C62.88430491020435%2C27.642030715942386%2C62.89283197511212&amp;layer=mapnik&amp;marker=62.888568752496816%2C27.62786865234375"
               style="filter: grayscale(0.5) contrast(1.2) opacity(0.4)"
            ></iframe>
         </client-only>
      </div>
      <div class="container px-5 py-24 mx-auto flex">
         <div class="bg-white dark:bg-black rounded-lg p-8 flex flex-col ml-auto mt-10 md:mt-0 relative">
            <h2 class="text-2xl mb-2 font-medium title-font">Osoite</h2>
            <div class="leading-relaxed mb-5">
               <p>Microkatu 1</p>
               <p>PL 1627</p>
               <p>70211 Kuopio</p>
            </div>
         </div>
      </div>
   </section>
</template>

<script>
   export default {
      name: 'EmbeddedMap',
   };
</script>

<style scoped></style>
