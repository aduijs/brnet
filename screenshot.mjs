import puppeteer from 'puppeteer';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const url = process.argv[2] || 'http://localhost:3000';
const label = process.argv[3] || '';
const dir = path.join(__dirname, 'temporary screenshots');

if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });

const existing = fs.readdirSync(dir).filter(f => f.startsWith('screenshot-'));
const nextNum = existing.length > 0
  ? Math.max(...existing.map(f => parseInt(f.match(/screenshot-(\d+)/)?.[1] || '0'))) + 1
  : 1;

const filename = label
  ? `screenshot-${nextNum}-${label}.png`
  : `screenshot-${nextNum}.png`;

const browser = await puppeteer.launch({
  headless: true,
  args: ['--no-sandbox', '--disable-setuid-sandbox'],
});
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });
await page.goto(url, { waitUntil: 'networkidle0', timeout: 30000 });
await new Promise(r => setTimeout(r, 2000));
const fullPage = !process.argv.includes('--viewport');
const scrollToArg = process.argv.find(a => a.startsWith('--scroll='));
const scrollTo = scrollToArg ? parseInt(scrollToArg.split('=')[1]) : 0;

// Trigger all reveal animations by scrolling through the page
const totalHeight = await page.evaluate(() => document.body.scrollHeight);
for (let i = 0; i < totalHeight; i += 400) {
  await page.evaluate(y => window.scrollTo(0, y), i);
  await new Promise(r => setTimeout(r, 100));
}

// Scroll to target position
await page.evaluate(y => window.scrollTo(0, y), scrollTo);
await new Promise(r => setTimeout(r, 1000));

await page.screenshot({ path: path.join(dir, filename), fullPage: fullPage && scrollTo === 0 });
console.log(`Screenshot saved: temporary screenshots/${filename}`);
await browser.close();
