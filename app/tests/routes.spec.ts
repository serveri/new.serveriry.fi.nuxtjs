import { test, expect } from '@playwright/test';

type RouteCheck = { path: string; selector: string; description?: string; notText?: string; expectText?: string; expectFail?: boolean };

const routes: RouteCheck[] = [
  // Home
  { path: '/', selector: 'h2.custom-page-title', description: 'Home' },
  { path: '/en', selector: 'h2.custom-page-title', description: 'English Home' },

  // Organization pages
  { path: '/yhdistys/historia', selector: 'h2.custom-page-title', description: 'Org: History' },
  { path: '/yhdistys/hallitus', selector: '.rich-text', description: 'Org: Board' },
  { path: '/yhdistys/toimikunta', selector: '.rich-text', description: 'Org: Committee' },
  { path: '/yhdistys/uutiset', selector: '.custom-gridi', description: 'Org: News' },
  { path: '/yhdistys/tapahtumat', selector: 'h1.custom-page-title', description: 'Org: Events' },
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

   // calendar
   { path: '/api/calendar.ics', selector: '', description: 'Calendar file' },
   // Events
   { path: '/yhdistys/tapahtuma/1', selector: 'h2.card-header', description: 'Single event success', notText: 'Tapahtuman nimeä ei löytynyt' },
   { path: '/yhdistys/tapahtuma/0', selector: 'h2.card-header', description: 'Single event failed', expectFail: true, expectText: 'Tapahtuman nimeä ei löytynyt' },
   // Blogs
   { path: '/yhdistys/uutinen/8fdc5a57-db2f-4df4-8b8d-a936eab7f60c', selector: 'h2.card-header', description: 'Single blog success', notText: 'Uutisen otsikon pitäisi olla tässä' },
   { path: '/yhdistys/uutinen/0', selector: 'h2.card-header', description: 'Single blog failed', expectFail: true, expectText: 'Uutisen otsikon pitäisi olla tässä' },

   // 404 error page: assert status code heading renders "404"
   { path: '/404', selector: 'h1.font-bold', description: '404 error page', expectFail: true, expectText: '404' },
];

test.describe('Route smoke tests', () => {
  for (const route of routes) {
    test(`GET ${route.path} renders ${route.description ?? route.selector}`, async ({ page, request }) => {
      // Special-case API file download: verify status and headers
      if (route.path === '/api/calendar.ics') {
        const response = await request.get(route.path);
        expect(response.status()).toBe(200);
        const contentType = response.headers()['content-type'] || '';
        expect(contentType.toLowerCase()).toContain('text/calendar');
        const disposition = response.headers()['content-disposition'] || '';
        const dispLower = disposition.toLowerCase();
        expect(dispLower).toContain('attachment');
        // Allow either explicit tapahtumat-fi.ics or any *.ics filename
        expect(dispLower).toMatch(/filename=.*\.ics/);
        const body = await response.body();
        // Minimal sanity check: .ics should contain BEGIN:VCALENDAR
        expect(body.toString('utf-8')).toMatch(/BEGIN:VCALENDAR/);
        return;
      }

      await page.goto(route.path, { waitUntil: 'domcontentloaded' });
      // If not expecting failure, assert title; for expected failure pages, we may still render with 200
      if (!route.expectFail) {
        await expect(page).toHaveTitle(/Serveri ry|Serveri/);
      }

      // Assert presence or absence of expected DOM element(s)
      const isNegated = route.selector.startsWith('!');
      const sel = isNegated ? route.selector.slice(1) : route.selector;
      const locator = page.locator(sel);
      if (isNegated) {
        await expect(locator).toHaveCount(0);
      } else {
        await expect(locator.first()).toBeVisible();
        const text = (await locator.first().innerText()).trim();
        if (route.notText) {
          expect(text.toLowerCase()).not.toBe(route.notText.toLowerCase());
        }
        if (route.expectText) {
          expect(text.trim()).toBe(route.expectText.trim());
        }
      }
    });
  }
});
