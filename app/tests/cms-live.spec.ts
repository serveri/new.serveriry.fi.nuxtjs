import { test, expect } from '@playwright/test';

const CMS_BASE_URL = process.env.CMS_BASE_URL || process.env.NUXT_API_URL || 'https://api.serveriry.fi/';
const DIRECTUS_EVENTS_PATH = '/items/tapahtuma';
const FALLBACK_EVENT_TITLE = 'Serveri ry:n 35-vuotis vuosijuhlat';
const APP_BASE_URL = process.env.BASE_URL || 'http://localhost:3000';

type DirectusEvent = {
  id?: string | number;
  fi_otsikko?: string;
  en_otsikko?: string;
};

type LandingPageContent = {
  fi_long_desc?: string;
  en_long_desc?: string;
};

function normalizeText(value: string): string {
  return value.replace(/\s+/g, ' ').trim();
}

function getAnchorSnippet(value: string, marker: string): string {
  const normalized = normalizeText(value);
  const markerIndex = normalized.indexOf(marker);
  if (markerIndex === -1) {
    return marker;
  }
  return normalized.slice(markerIndex, markerIndex + 80).trim();
}

async function setLocaleCookie(page: import('@playwright/test').Page, locale: 'fi' | 'en') {
  await page.context().addCookies([
    {
      name: 'i18n_redirected',
      value: locale,
      url: APP_BASE_URL,
    },
  ]);
}

test.describe('@cms Directus live CMS integration', () => {
  test('Directus events endpoint responds', async ({ request }) => {
    test.setTimeout(90_000);

    const endpoint = new URL(`${DIRECTUS_EVENTS_PATH}?limit=1`, CMS_BASE_URL).toString();
    const response = await request.get(endpoint);
    expect(response.ok()).toBeTruthy();

    const payload = await response.json();
    expect(payload).toHaveProperty('data');
    expect(Array.isArray(payload.data)).toBeTruthy();
  });

  test('events page renders content from live CMS', async ({ page }) => {
    test.setTimeout(90_000);

    const endpoint = new URL(`${DIRECTUS_EVENTS_PATH}?limit=20`, CMS_BASE_URL).toString();
    const response = await page.request.get(endpoint);
    expect(response.ok()).toBeTruthy();

    const payload = (await response.json()) as { data?: DirectusEvent[] };
    const cmsEvents = payload.data ?? [];
    expect(cmsEvents.length).toBeGreaterThan(0);

    const sampleEvent = cmsEvents.find((item) => item.id !== undefined && (item.fi_otsikko?.trim() || item.en_otsikko?.trim()));
    expect(sampleEvent).toBeDefined();

    const expectedId = String(sampleEvent!.id);
    const expectedTitle = (sampleEvent!.fi_otsikko?.trim() || sampleEvent!.en_otsikko?.trim()) as string;

    await page.goto('/yhdistys/tapahtumat', { waitUntil: 'networkidle' });
    await expect(page.locator('h1.custom-page-title').first()).toBeVisible();

    await expect(page.getByText(FALLBACK_EVENT_TITLE)).toHaveCount(0);

    const eventLink = page.locator(`a[href="/yhdistys/tapahtuma/${expectedId}"]`).first();
    await expect(eventLink).toBeVisible();
    await expect(eventLink.locator('h2.card-header')).toContainText(expectedTitle);
  });

  test('landing page long description is rendered from CMS (FI and EN)', async ({ page }) => {
    test.setTimeout(90_000);

    const endpoint = new URL('items/LandingPage', CMS_BASE_URL).toString();
    const response = await page.request.get(endpoint);
    expect(response.ok()).toBeTruthy();

    const payload = (await response.json()) as { data?: LandingPageContent | LandingPageContent[] };
    const landingData = Array.isArray(payload.data) ? payload.data[0] : payload.data;
    expect(landingData).toBeDefined();

    const fiLongDesc = normalizeText(landingData?.fi_long_desc ?? '');
    const enLongDesc = normalizeText(landingData?.en_long_desc ?? '');

    expect(fiLongDesc.length).toBeGreaterThan(20);
    expect(enLongDesc.length).toBeGreaterThan(20);
    // Verify that landing page long descriptions are fetched from cms and contain text "Server"
    expect(fiLongDesc).toContain('Server');
    expect(enLongDesc).toContain('Server');

    const fiSnippet = getAnchorSnippet(fiLongDesc, 'Server');
    const enSnippet = getAnchorSnippet(enLongDesc, 'Server');

    await setLocaleCookie(page, 'fi');
    await page.goto('/', { waitUntil: 'networkidle' });
    await expect(page.locator('.rich-text').first()).toContainText(fiSnippet);
    await expect(page.getByText('Miksi serverit on niin kuumia?')).toHaveCount(0);

    await setLocaleCookie(page, 'en');
    await page.goto('/en', { waitUntil: 'networkidle' });
    await expect(page.locator('.rich-text').first()).toContainText(enSnippet);
    await expect(page.getByText('Why are the servers so hot?')).toHaveCount(0);
  });
});