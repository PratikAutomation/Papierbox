# Papierbox — Project Context

## What This Is
Grocery price comparison micro-SaaS for expats/students in Germany.
Users search a product + city → see cheapest prices across supermarkets.
Live URL: www.papierbox.eu
GitHub: github.com/PratikAutomation/Papierbox

## Current Status (March 26, 2026)

### LIVE IN PRODUCTION — ALL CORE FEATURES COMPLETE

### Data Pipeline
- Aldi Süd: 47 real offers (automated scraper)
- Penny: 75 real offers (Firecrawl + Claude)
- Kaufland: 24 real offers (HTTP + Claude)
- Netto: 7 real offers (Firecrawl)
- Lidl: 216 offers extracted via PDF → Claude → SQL (ready to upload March 29)
- Estimated regular prices: 78 (Claude-generated)
- Total when Lidl uploads: ~450 products

### Manual PDF Workflow (NEW — best approach for Lidl & Netto)
- Download Prospekt PDFs from KaufDa (free, legal)
- Upload to Claude → extract all offers as SQL
- Paste SQL in Supabase SQL Editor
- Instructions: `Prospect/EXTRACT_INSTRUCTIONS.md`
- 30 min/week for 100% accurate data from ALL stores
- Lidl test: 4 scraped offers → 216 PDF-extracted offers

### Automated Scraper (runs Mon + Thu via GitHub Actions)
- 3-layer fallback: Firecrawl → Playwright → HTTP → Claude
- Claude AI search fallback when DB has poor results
- GitHub Actions installs Playwright + Chromium

### Search Intelligence
- pg_trgm fuzzy search in Supabase
- Smart word-level reranking (prevents cross-category junk)
- Claude AI fallback: when < 2 relevant results, asks Claude for estimates
- Bilingual synonyms table (50+ EN/DE pairs)

### Frontend
- Neo-brutalist design (shadow-neo, grainy-bg, bold borders)
- EN/DE one-click translation
- 5 pages: Home, Our Story, How It Works, Impressum, Privacy
- Email capture (price alert card below results)
- Auto-scroll to results on mobile
- Field validation with visual feedback
- Logo + "PAPIERBOX" branding in header/footer
- SVG favicon

### SEO
- robots.txt, sitemap.xml, OG tags, JSON-LD
- Google Search Console: site indexed, sitemap submitted
- Bing Webmaster Tools: submitted
- Canonical URL: www.papierbox.eu

### Infrastructure
- Vercel (free tier) — auto-deploys from GitHub
- Supabase (free tier) — PostgreSQL + pg_trgm
- GitHub Actions — Mon/Thu cron scraping
- Domain: www.papierbox.eu (GoDaddy)
- Env vars: Vercel (SUPABASE keys + ANTHROPIC_API_KEY), GitHub Secrets (same + FIRECRAWL_API_KEY)

### Known Issues
- Google Search Console sitemap shows "Couldn't fetch" (display delay, site IS indexed)
- Lidl automated scraping still weak (PDF manual approach is the solution)
- Netto automated scraping gets 7 offers (PDF approach will fix)

### Next Steps
1. March 29 night: Upload Lidl SQL (216 offers) + extract Netto PDF
2. Start posting in expat Facebook groups / Reddit
3. Create OG image for social sharing
4. Weekly Sunday routine: download PDFs → extract → upload
5. Monitor success matrix metrics

## Tech Stack
- Next.js 14, Tailwind CSS, Plus Jakarta Sans + Inter + Bricolage Grotesque
- Supabase PostgreSQL (pg_trgm, bilingual synonyms, search_offers RPC)
- Python scrapers (Firecrawl, Playwright, Claude API)
- Anthropic Claude (Haiku for extraction, search fallback)
- Vercel hosting, GitHub Actions automation

## Key Files
```
src/app/page.tsx                    — Main search page
src/app/api/search/route.ts        — Smart search with Claude fallback
src/app/api/subscribe/route.ts     — Email capture
src/components/Header.tsx           — Logo + EN/DE toggle
src/components/Footer.tsx           — Navigation + branding
scrapers/universal_scraper.py       — Automated 3-layer scraper
scrapers/firecrawl_scraper.py       — Firecrawl + Vision scrapers
scrapers/process_prospekt.py        — PDF → Claude → Supabase
scrapers/config.py                  — Store configs + Claude settings
Prospect/EXTRACT_INSTRUCTIONS.md    — Manual PDF extraction guide
docs/SUCCESS_MATRIX.md              — Performance tracking
```

## Credentials
- Supabase URL: https://jgtgikvwfwlrhxdbwzdm.supabase.co
- Keys: in .env.local, scrapers/.env, Vercel env vars, GitHub Secrets
- Firecrawl: fc-877683f06aac44329474231f0e466613

## Success Score (Day 4)
- Data Quality: 55/100 (improving with PDF workflow)
- Search Quality: 80/100 (Claude fallback fixes gaps)
- User Engagement: 5/100 (1 subscriber, no marketing yet)
- Growth: 5/100 (Google indexed, no social posts yet)
- Infrastructure: 95/100 (all systems operational)
- Composite: ~45/100 (target 60+ by month 1)
