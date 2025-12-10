import { test, expect } from '@playwright/test';

type RouteCheck = { path: string; selector: string; description?: string };

const routes: RouteCheck[] = [
  // Home
  { path: '/', selector: 'h2.custom-page-title', description: 'Home' },
  { path: '/en', selector: 'h2.custom-page-title', description: 'English Home' },

  // Organization pages
  { path: '/yhdistys/historia', selector: 'h2.custom-page-title', description: 'Org: History' },
  { path: '/yhdistys/hallitus', selector: '.rich-text', description: 'Org: Board' },
  { path: '/yhdistys/toimikunta', selector: '.rich-text', description: 'Org: Committee' },
  { path: '/yhdistys/uutiset', selector: '.custom-gridi', description: 'Org: News' },
  { path: '/yhdistys/tapahtumat', selector: '.custom-grid', description: 'Org: Events' },
  { path: '/yhdistys/merch', selector: '.merch-content', description: 'Org: Merch' },
  { path: '/yhdistys/dokumentit', selector: 'h2.custom-page-title', description: 'Org: Documents' },
  { path: '/yhdistys/saannot', selector: 'h2.custom-page-title, .rich-text', description: 'Org: Rules' },
  { path: '/yhdistys/turvallinen-tila', selector: '.rich-text', description: 'Org: Safe Space' },

  // Join/GDPR/Info
  { path: '/jaseneksi', selector: '.rich-text', description: 'Join Us' },
  { path: '/gdpr', selector: '.rich-text', description: 'GDPR' },
  { path: '/tietoa-sivusta', selector: '.rich-text', description: 'About Site' },

  // Business section
  { path: '/yrityksille/it-rekry', selector: '.rekry-content', description: 'Business: IT Recruitment' },
  { path: '/yrityksille/yhteistyo', selector: 'h2.custom-page-title', description: 'Business: Collaboration' },
  { path: '/yrityksille/kumppanit', selector: 'h1.custom-page-title', description: 'Business: Partners' },
  { path: '/yrityksille/yritykset', selector: '.grid.grid-cols-4, .rich-text', description: 'Business: Companies' },

  // Study section
  { path: '/opiskelu/tkt', selector: 'table.course-table', description: 'Study: What is CS' },
  { path: '/opiskelu/fuksille', selector: '.rich-text', description: 'Study: New Student' },
  { path: '/opiskelu/laksykerho', selector: '.rich-text', description: 'Study: Study Club' },
  { path: '/opiskelu/palaute', selector: '.rich-text', description: 'Study: Feedback' },
  { path: '/opiskelu/linkit', selector: '.rich-text, a.btn-custom-primary', description: 'Study: Links' },

  // Misc pages
  { path: '/zyn', selector: '.iframe-container', description: 'Zyn' },
  { path: '/viinapiru', selector: '.audio-player-container', description: 'Viinapiru' },
];

test.describe('Route smoke tests', () => {
  for (const route of routes) {
    test(`GET ${route.path} renders ${route.description ?? route.selector}`, async ({ page }) => {
      await page.goto(route.path, { waitUntil: 'domcontentloaded' });
      await expect(page).toHaveTitle(/Serveri ry|Serveri/);
      // Assert presence of expected DOM element(s)
      const locator = page.locator(route.selector);
      await expect(locator.first()).toBeVisible();
    });
  }
});
