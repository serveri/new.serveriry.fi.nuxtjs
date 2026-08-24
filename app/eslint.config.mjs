import pluginVue from 'eslint-plugin-vue';
import pluginSecurity from 'eslint-plugin-security';
import pluginJsxA11y from 'eslint-plugin-jsx-a11y';
import pluginPrettierRecommended from 'eslint-plugin-prettier/recommended';
import globals from 'globals';
import js from '@eslint/js';
import tsParser from '@typescript-eslint/parser';

export default [
   js.configs.recommended,
   ...pluginVue.configs['flat/recommended'],
   pluginPrettierRecommended,
   {
      plugins: {
         security: pluginSecurity,
         'jsx-a11y': pluginJsxA11y,
      },
      languageOptions: {
         globals: {
            ...globals.browser,
            ...globals.node,
            useRuntimeConfig: 'readonly',
            useFetch: 'readonly',
            useLocalePath: 'readonly',
            useI18n: 'readonly',
            defineNuxtConfig: 'readonly',
            definePageMeta: 'readonly',
            useRoute: 'readonly',
            useRouter: 'readonly',
            navigateTo: 'readonly',
            ref: 'readonly',
            computed: 'readonly',
            watch: 'readonly',
            onMounted: 'readonly',
            useTrackingConsent: 'readonly',
            useHead: 'readonly',
            useRequestHeaders: 'readonly',
            $fetch: 'readonly',
         },
         ecmaVersion: 2021,
         sourceType: 'module',
         parserOptions: {
            parser: tsParser,
            extraFileExtensions: ['.vue'],
         },
      },
      rules: {
         'vue/prop-name-casing': 'off',
         'vue/multi-word-component-names': 'off',
         'security/detect-object-injection': 'off',
      },
   },
   {
      files: ['src/pages/**/*.vue', 'src/pages/*.vue', 'src/*.vue'],
      rules: {
         'vue/multi-word-component-names': 'off',
      },
   },
];
