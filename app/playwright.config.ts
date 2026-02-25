import { defineConfig } from '@playwright/test';
import os from 'os';

const isCI = !!process.env.CI;

export default defineConfig({
  testDir: './tests',
  timeout: 30_000,
  retries: 0,
  use: {
    baseURL: process.env.BASE_URL || 'http://localhost:3000',
    trace: 'retain-on-failure',
    screenshot: 'only-on-failure',
    video: 'retain-on-failure',
    headless: true,
  },
  reporter: isCI ? [['list'], ['html', { outputFolder: 'playwright-report', open: 'never' }]] : [['list']],
  webServer: {
    command: 'npm run dev',
    url: 'http://localhost:3000',
    reuseExistingServer: true,
    timeout: 120_000,
  },
  fullyParallel: true,
  workers: process.env.PW_WORKERS ? Number(process.env.PW_WORKERS) : Math.max(2, os.cpus().length),
});
