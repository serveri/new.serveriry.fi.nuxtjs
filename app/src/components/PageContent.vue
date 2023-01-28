<template>
   <div
      style="height: 56.4vh"
      class="bg-gradient-to-r from-[#ADA996] to-[#8e9eab] dark:from-zinc-700 dark:to-[#414345]"
   >
      <router-view />
   </div>
</template>

<script>
   export default {
      name: 'PageContent',
   };
</script>

<style scoped lang="css">
   p {
      color: black;
   }
</style>
