# GrocerySpy.de - Supermarket Price Comparison for Expats in Germany

## The One-Liner
"Type a product. Pick your city. See every supermarket's price, cheapest first."

---

## PART 1: THE DATA STRATEGY (Most Critical)

### The Problem
We need real-time weekly offer prices from German supermarkets. Scraping APIs or apps is legally risky in Germany (Abmahnung culture). We need a legal, free, reliable approach.

### The Solution: 3-Layer Data Pipeline

#### Layer 1: Weekly Prospekt Parsing (PRIMARY - MVP)
German supermarkets WANT you to see their weekly offers. These are advertisements, not private data. They publish them freely as:
- Public web pages on their official sites (Angebote/Aktionen sections)
- Downloadable PDF brochures
- Newsletter content

**Legal basis:**
- Factual data (product name + price) is NOT copyrightable under German law (Section 2 UrhG)
- Weekly offers are advertisements designed for maximum public distribution
- We extract FACTS only (product, price, dates), not creative content (images, layouts)
- We attribute sources and link back to original offers
- We respect robots.txt and rate-limit all requests

**Technical approach:**
1. Build a Python scraper for each supermarket's public "Angebote" (offers) page
2. Extract: product name, price, unit/weight, valid_from, valid_to
3. Run scrapers once when new Prospekte are released (Mon/Thu typically)
4. Store structured data in database

**Key insight: National vs. Regional pricing**
- Aldi, Lidl, Penny, Netto, Kaufland = NATIONAL pricing (same offers everywhere)
- Rewe, Edeka = FRANCHISE-based (regional pricing, harder to scrape)
- MVP: Focus on national-price chains first (5 supermarkets, same price in every city)
- The "city" filter in MVP = which of these chains have stores near you

#### Layer 2: LLM-Assisted Extraction (BACKUP / ENHANCEMENT)
If HTML scraping is unreliable for some supermarkets:
1. Download the publicly available weekly offer page/PDF
2. Feed to Claude API to extract structured data
3. Output: JSON array of {product, price, unit, store, valid_from, valid_to}
4. Cost: ~$0.05 per supermarket per week (negligible)
5. Accuracy: Very high for structured promotional content

#### Layer 3: Community Reporting (PHASE 2)
- Users can report prices they see in-store
- Crowdsourced data fills gaps (especially for regular shelf prices, not just offers)
- Gamification: "Price Scout" badges, leaderboards
- This becomes the long-term moat

### Target Supermarkets (MVP - 6 chains)

| Priority | Chain    | Type       | Pricing  | Data Quality |
|----------|----------|------------|----------|--------------|
| 1        | Lidl     | Discounter | National | Excellent    |
| 2        | Aldi Sud | Discounter | National | Excellent    |
| 3        | Penny    | Discounter | National | Good         |
| 4        | Kaufland | Hypermart  | National | Good         |
| 5        | Netto    | Discounter | National | Good         |
| 6        | Rewe     | Supermarkt | Regional | Medium       |

### Legal Safeguards Checklist
- [ ] Respect robots.txt for every domain
- [ ] Rate limit: max 1 request per 3 seconds per domain
- [ ] Only extract factual data (no images, no brochure layouts)
- [ ] Display clear source attribution on every price ("Source: [Store] weekly offers")
- [ ] Link back to original offer page
- [ ] Add "Report incorrect price" button
- [ ] Include Impressum (legal requirement in Germany)
- [ ] Add contact page for supermarkets to request changes
- [ ] Disclaimer: "Prices sourced from publicly available weekly offers"
- [ ] No supermarket logos without permission (use text names + brand colors only)

---

## PART 2: PRODUCT DEFINITION

### Core Experience (The Whole Product)
```
+--------------------------------------------------+
|            GrocerySpy.de                          |
|     "Find the cheapest groceries near you"        |
|                                                   |
|  [  Avocado                    ]  <- product      |
|  [  Hamburg                    ]  <- city          |
|  [       SEARCH                ]                  |
|                                                   |
|  Results for "Avocado" in Hamburg:                 |
|  ------------------------------------------------ |
|  1. Penny        EUR 0.69  (was 0.99)  until Sun  |
|  2. Lidl         EUR 0.79              until Sat  |
|  3. Aldi Sud     EUR 0.85              until Sat  |
|  4. Kaufland     EUR 0.99              until Wed  |
|  5. Netto        EUR 1.09              this week  |
|  6. Rewe         EUR 1.29              until Sat  |
|                                                   |
|  You save EUR 0.60 shopping at Penny!             |
+--------------------------------------------------+
```

### What Makes This DIFFERENT from KaufDa/marktguru
| Feature          | KaufDa / marktguru        | GrocerySpy                     |
|------------------|---------------------------|--------------------------------|
| Interface        | Browse brochures, complex | 2 fields. Search. Done.        |
| Target user      | German aunties            | Expats, students, busy people  |
| Language          | German only               | English-first + German         |
| Results           | "Here's the brochure page"| Sorted price list, cheapest first |
| Decision time     | 10-15 minutes browsing    | 5 seconds                      |
| Mobile experience | Heavy apps, slow          | Lightning fast PWA             |

### MVP Feature Set
1. Product search with autocomplete (in English AND German)
2. City selector (start with Hamburg, expand to top 10 cities)
3. Price results sorted low-to-high
4. "Valid until" date for each offer
5. Savings calculator ("You save X vs. most expensive")
6. Mobile-first responsive design
7. English as primary language, German toggle

### NOT in MVP (Phase 2+)
- User accounts / shopping lists
- Price alerts / notifications
- Price history charts
- Store locator / map view
- Community price reporting
- Mobile app (PWA first)

---

## PART 3: TECH STACK

### Chosen Stack (Optimized for weekend speed)
```
Frontend:    Next.js 14 (App Router) + Tailwind CSS + shadcn/ui
Backend:     Next.js API Routes (serverless)
Database:    Supabase (PostgreSQL) - free tier
Scraping:    Python + BeautifulSoup/Playwright + scheduled via cron
Search:      PostgreSQL full-text search (good enough for MVP)
Deployment:  Vercel (free tier)
Domain:      ~EUR 10-15 for .de domain
```

### Why This Stack
- Next.js + Vercel = deploy in seconds, free hosting, fast globally
- Supabase = instant PostgreSQL, free tier handles 50K+ monthly users
- Python scrapers = easiest to write, can run as cron jobs
- Total cost: EUR 10-15/month (just the domain)

### Database Schema (MVP)
```sql
-- Supermarket chains
CREATE TABLE stores (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,           -- "Lidl"
  slug TEXT UNIQUE NOT NULL,    -- "lidl"
  brand_color TEXT,             -- "#0050AA"
  website_url TEXT
);

-- Cities we support
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,           -- "Hamburg"
  slug TEXT UNIQUE NOT NULL,    -- "hamburg"
  state TEXT                    -- "Hamburg"
);

-- Which stores exist in which cities
CREATE TABLE store_locations (
  id SERIAL PRIMARY KEY,
  store_id INT REFERENCES stores(id),
  city_id INT REFERENCES cities(id)
);

-- The core data: product offers
CREATE TABLE offers (
  id SERIAL PRIMARY KEY,
  store_id INT REFERENCES stores(id),
  product_name TEXT NOT NULL,         -- "Avocado"
  product_name_en TEXT,               -- "Avocado" (English translation)
  product_name_normalized TEXT,       -- "avocado" (for search)
  price DECIMAL(10,2) NOT NULL,       -- 0.69
  original_price DECIMAL(10,2),       -- 0.99 (if on sale)
  unit TEXT,                          -- "Stuck" / "1kg" / "500g"
  valid_from DATE,
  valid_to DATE,
  source_url TEXT,                    -- link back to original offer
  created_at TIMESTAMP DEFAULT NOW(),

  -- Full text search
  search_vector TSVECTOR
);

CREATE INDEX idx_offers_search ON offers USING GIN(search_vector);
CREATE INDEX idx_offers_product ON offers(product_name_normalized);
CREATE INDEX idx_offers_dates ON offers(valid_from, valid_to);
```

### Architecture Diagram
```
[Supermarket Websites]
        |
        v
[Python Scrapers] ---> [Claude API for tough parsing]
        |
        v
[Supabase PostgreSQL]
        |
        v
[Next.js API Routes]
        |
        v
[Next.js Frontend]  <---> [User's Browser]
        |
   [Vercel CDN]
```

---

## PART 4: WEEKEND EXECUTION PLAN

### Friday Evening (2-3 hours) - SETUP
```
[ ] Buy domain (groceryspy.de or similar)
[ ] Set up GitHub repo
[ ] Initialize Next.js project with Tailwind + shadcn/ui
[ ] Create Supabase project, run schema SQL
[ ] Seed stores table (6 supermarkets)
[ ] Seed cities table (Hamburg + top 9 German cities)
[ ] Deploy empty Next.js to Vercel, connect domain
```

### Saturday (8-10 hours) - CORE BUILD

**Morning (4h): Data Pipeline**
```
[ ] Write scraper for Lidl weekly offers
[ ] Write scraper for Aldi Sud weekly offers
[ ] Write scraper for Penny weekly offers
[ ] Test scrapers, verify data extraction
[ ] Build data normalization pipeline:
    - Lowercase product names
    - Extract unit/weight from description
    - Generate English translations (via Claude API)
    - Generate search tokens
[ ] Load this week's data into Supabase
```

**Afternoon (4-6h): Frontend + API**
```
[ ] Build the main search API endpoint:
    GET /api/search?product=avocado&city=hamburg
    Returns: sorted price list from all stores
[ ] Build the landing page:
    - Hero section with search (2 fields + button)
    - Fun, clean design (think: Monzo meets grocery store)
    - Catchy tagline
[ ] Build search results component:
    - Store name + brand color indicator
    - Price (big, bold)
    - Original price if on sale (strikethrough)
    - "Valid until" badge
    - Savings summary at top
[ ] Add product autocomplete (from existing offers data)
[ ] Add city selector dropdown
[ ] Mobile responsive pass
```

### Sunday (6-8 hours) - POLISH + LAUNCH

**Morning (3-4h): Remaining Scrapers + Polish**
```
[ ] Write scraper for Kaufland
[ ] Write scraper for Netto
[ ] Write scraper for Rewe (regional - best effort)
[ ] Load all data into Supabase
[ ] Add "no results" state with suggestions
[ ] Add loading states / skeleton UI
[ ] Add error handling
[ ] Add Impressum page (legal requirement)
[ ] Add Datenschutz (privacy policy) page
[ ] Add "About" page explaining what this is
```

**Afternoon (3-4h): SEO + Soft Launch**
```
[ ] Add meta tags, Open Graph, Twitter cards
[ ] Add sitemap.xml
[ ] Create landing page copy in English + German
[ ] Set up Google Analytics / Plausible
[ ] Set up cron job for daily scraper runs
[ ] Write 3 Reddit posts (r/germany, r/hamburg, r/ExpatFinance)
[ ] Create social posts for expat Facebook groups
[ ] Deploy final version
[ ] Test on real phones (borrow friends' devices)
[ ] LAUNCH - share in 5 expat communities
```

---

## PART 5: UI/UX DESIGN DIRECTION

### Visual Identity
- **Vibe**: Fun, trustworthy, slightly cheeky (like a smart friend who knows all the deals)
- **Colors**:
  - Primary: Bright green (#22C55E) - savings, freshness, go
  - Secondary: Deep navy (#1E293B) - trust, readability
  - Accent: Warm yellow (#FBBF24) - deals, attention
  - Background: Clean white (#FAFAFA)
- **Typography**: Inter (clean, modern, great in both EN/DE)
- **Tone of voice**: "Hey, we found you a deal!" not "Price comparison portal"

### Key UI Principles
1. **ONE screen does everything** - no navigation, no pages to browse
2. **Results appear instantly** - no page reload, no loading spinners longer than 200ms
3. **Color-code savings** - green badge if it's the cheapest this week
4. **Show the "win"** - "You save EUR 2.40 vs. buying at Rewe" always visible
5. **Fun micro-interactions** - subtle confetti when savings > EUR 2

### Page Layout
```
HEADER: Logo + "EN | DE" toggle (that's it, no menu)

HERO:
  "Stop overpaying for groceries."
  "Compare prices across German supermarkets in seconds."

  [Product input with autocomplete] [City dropdown] [Search button]

  Popular: Avocado | Chicken | Butter | Milk | Eggs | Bananas

RESULTS (below search, appears after search):
  "Avocado in Hamburg - 6 offers found"
  "Best price: EUR 0.69 at Penny (you save EUR 0.60!)"

  [Price cards sorted low to high]
  Each card: Store color bar | Store name | Price | Was price | Valid until

FOOTER:
  Impressum | Datenschutz | About | "Data updated daily from public weekly offers"
```

---

## PART 6: GROWTH STRATEGY (Post-Launch)

### Week 1: Seed Users (Target: 100 users)
- Post in expat Facebook groups (Hamburg Expats, Germans in Germany, etc.)
- Post on Reddit (r/germany, r/hamburg, r/ExpatFinance)
- Share in WhatsApp groups of international students
- Post in university international office channels
- Share on Indian expat forums (r/indiansabroad)

### Week 2-4: Content + SEO (Target: 1,000 users)
- Create "Weekly Best Deals" blog posts (auto-generated from data)
- SEO pages: "cheapest [product] in [city] Germany"
- Create Instagram/TikTok showing price comparisons
- Partner with 2-3 expat bloggers/YouTubers

### Month 2-3: Expand (Target: 10,000 users)
- Add top 10 German cities
- Add more supermarkets (Edeka, Real, dm, Rossmann)
- Add non-food items (toiletries, household)
- Launch price alerts via email
- Build community features (price reporting)

### Month 4-6: Monetize (Target: 50,000 users)
- See monetization plan below

---

## PART 7: MONETIZATION ROADMAP

### Phase 1: Free (Month 1-3)
- No monetization. Pure growth. Build user base and data.
- Total cost to run: ~EUR 15/month (domain + minor API costs)

### Phase 2: Non-Intrusive Revenue (Month 4-6)
1. **Affiliate links to delivery services**
   - Rewe, Kaufland offer online delivery
   - Earn EUR 2-5 per referred order
   - "Order from Rewe" button next to Rewe prices

2. **Tasteful display ads**
   - One banner ad below results (Google AdSense)
   - Estimated: EUR 3-5 CPM with German traffic
   - At 50K monthly pageviews = EUR 150-250/month

### Phase 3: Premium Features (Month 6+)
1. **GrocerySpy Pro (EUR 2.99/month)**
   - Price alerts: "Notify me when chicken drops below EUR 4"
   - Price history charts (see trends)
   - Shopping list optimizer ("your list costs EUR X at Lidl vs EUR Y at Aldi")
   - Ad-free experience

2. **B2B / Supermarket Partnerships**
   - Supermarkets PAY to be featured/highlighted
   - "Sponsored" placement (clearly labeled)
   - Analytics for supermarkets: "X users searched for your products"

### Revenue Projections (Conservative)
| Month | Users  | Revenue Source        | Est. Revenue |
|-------|--------|-----------------------|--------------|
| 1-3   | 1-5K   | None (growth phase)   | EUR 0        |
| 4-6   | 5-20K  | Ads + Affiliates      | EUR 200-500  |
| 7-12  | 20-50K | Ads + Affiliates + Pro| EUR 500-2000 |
| 12+   | 50K+   | All channels          | EUR 2000+    |

---

## PART 8: RISKS & MITIGATIONS

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Supermarket sends Abmahnung | Low-Medium | High | Legal safeguards (see checklist). Comply immediately if contacted. Offer to become a partner instead. |
| Scraper breaks (site redesign) | High | Medium | Multiple data layers. LLM backup. Monitor daily. |
| KaufDa copies the simple UX | Low | High | Move fast, build community, target expats specifically. |
| Low user adoption | Medium | High | Validate with 10 real expats before building. Content marketing. |
| Data accuracy issues | Medium | Medium | "Report wrong price" button. Cross-reference multiple sources. |

---

## PART 9: SUCCESS METRICS

### Weekend MVP Launch
- [ ] Website is live and functional
- [ ] At least 3 supermarkets with current week's data loaded
- [ ] Search works for 50+ products
- [ ] Shared in 5+ expat communities
- [ ] 50+ unique visitors on Day 1

### Month 1
- [ ] 500+ unique monthly visitors
- [ ] 6 supermarkets with reliable weekly data
- [ ] Hamburg fully covered
- [ ] 2 more cities added
- [ ] Positive feedback from 10+ real users

### Month 3
- [ ] 5,000+ unique monthly visitors
- [ ] Top 10 German cities covered
- [ ] 200+ indexed products
- [ ] First EUR 100 in affiliate revenue
- [ ] Featured in 1 expat blog/newsletter

---

## IMMEDIATE NEXT STEPS

1. **Right now**: Finalize the project name and buy the domain
2. **Tonight**: Set up the repo and Supabase, run the schema
3. **Tomorrow morning**: Start with Lidl scraper (cleanest data source)
4. **Keep this file updated** as our living project document

---

*Plan created: March 21, 2026*
*Project location: /mnt/c/petroject/Project_1/*
*Status: READY TO BUILD*
