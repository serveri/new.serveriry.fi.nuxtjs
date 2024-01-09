// unlighthouse.config.ts
export default {
   // show the browser window
   puppeteerOptions: {
      headless: true,
   },
   // limit the number of concurrent tabs
   puppeteerClusterOptions: {
      maxConcurrency: 10,
   },
};
