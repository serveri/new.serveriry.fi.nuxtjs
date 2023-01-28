<template>
   <div id="app">
      <p>
         <!-- use the router-link component for navigation. -->
         <!-- specify the link by passing the `to` prop. -->
         <!-- `<router-link>` will render an `<a>` tag with the correct `href` attribute -->
         <router-link to="/">Etusivu </router-link>
         <router-link to="/yhdistys">Yhdistys</router-link>
      </p>
      <!-- route outlet -->
      <!-- component matched by the route will render here -->
      <router-view />
   </div>
</template>

