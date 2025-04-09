import { defineConfig } from 'eslint/config';
import security from 'eslint-plugin-security';
import jsxA11Y from 'eslint-plugin-jsx-a11y';
import prettier from 'eslint-plugin-prettier';
import globals from 'globals';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import js from '@eslint/js';
import { FlatCompat } from '@eslint/eslintrc';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const compat = new FlatCompat({
   baseDirectory: __dirname,
   recommendedConfig: js.configs.recommended,
   allConfig: js.configs.all,
});

export default defineConfig([
   {
      // Extend Vue, jsx-a11y and Prettier configurations.
      extends: compat.extends('plugin:vue/recommended', 'plugin:jsx-a11y/recommended', 'plugin:prettier/recommended'),

      plugins: {
         security,
         'jsx-a11y': jsxA11Y,
         prettier,
      },

      languageOptions: {
         globals: {
            ...globals.browser,
            ...globals.node,
         },
         ecmaVersion: 2021,
         sourceType: 'commonjs',
         parserOptions: {
            project: './tsconfig.json',
            parser: '@typescript-eslint/parser',
            extraFileExtensions: ['.vue'],
         },
      },

      rules: {
         'vue/prop-name-casing': 'off',
         'vue/multi-word-component-names': 'off',
         'prettier/prettier': 'error',
      },
   },
   {
      files: ['src/pages/**/*.vue', 'src/pages/*.vue', 'src/*.vue'],
      rules: {
         'vue/multi-word-component-names': 0,
      },
   },
]);
