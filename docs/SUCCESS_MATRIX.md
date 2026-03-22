# Papierbox Success Matrix

## How We Measure Success

This matrix defines what "winning" looks like for Papierbox at each stage. Every metric is measurable, time-bound, and directly tied to whether users find value.

---

## 1. DATA QUALITY SCORE (Weight: 40%)

The core promise: real, accurate prices. If this fails, nothing else matters.

| Metric | Formula | Target Week 1 | Target Month 1 | Target Month 3 |
|--------|---------|---------------|-----------------|-----------------|
| **Store Coverage** | stores_with_data / total_stores | 3/5 (60%) | 5/5 (100%) | 7+ stores |
| **Offers Per Store** | avg offers extracted per store | 15+ | 30+ | 50+ |
| **Total Real Offers** | count where is_offer=true | 100+ | 250+ | 500+ |
| **Estimated Prices** | count where is_offer=false | 75+ | 150+ | 200+ |
| **Scrape Success Rate** | successful_scrapes / total_scrapes | 60% | 85% | 95% |
| **Data Freshness** | hours since last successful scrape | < 96h | < 72h | < 48h |
| **Price Accuracy** | verified_correct / sample_checked | 90%+ | 95%+ | 99% |
| **Brand Coverage** | unique brands in DB | 20+ | 50+ | 100+ |
| **Category Coverage** | unique categories in DB | 10+ | 20+ | 30+ |

### How to Check (Run in Supabase SQL Editor):

```sql
-- Store coverage
SELECT s.name, COUNT(o.id) as offer_count
FROM stores s LEFT JOIN offers o ON s.id = o.store_id AND o.is_offer = true
GROUP BY s.name ORDER BY offer_count DESC;

-- Total offers
SELECT is_offer, COUNT(*) FROM offers GROUP BY is_offer;

-- Scrape success rate (last 7 days)
SELECT status, COUNT(*) FROM scrape_logs
WHERE created_at > now() - interval '7 days' GROUP BY status;

-- Unique brands
SELECT COUNT(DISTINCT brand) FROM offers WHERE is_offer = true;

-- Unique categories
SELECT COUNT(DISTINCT category) FROM offers WHERE is_offer = true;

-- Data freshness
SELECT MAX(created_at) as last_scrape FROM scrape_logs WHERE status = 'success';
```

---

## 2. SEARCH QUALITY SCORE (Weight: 25%)

Users must find what they're looking for on the first search.

| Metric | Formula | Target Week 1 | Target Month 1 | Target Month 3 |
|--------|---------|---------------|-----------------|-----------------|
| **Zero-Result Rate** | searches_with_0_results / total_searches | < 30% | < 15% | < 5% |
| **Avg Results Per Search** | avg(total_offers + total_regular) per query | 3+ | 5+ | 8+ |
| **Bilingual Match Rate** | EN_query_finds_DE_product / EN_queries | 80% | 90% | 95% |
| **Typo Tolerance** | typo_query_finds_correct / typo_queries | 70% | 85% | 95% |
| **Autocomplete Hit Rate** | searches_using_autocomplete / total_searches | 20% | 35% | 50% |
| **Synonym Coverage** | bilingual_synonym_pairs in DB | 50+ | 80+ | 120+ |

### Test Queries (Manual Check):

| Query | Should Find | Pass? |
|-------|------------|-------|
| "butter" | All butter offers across stores | |
| "Milch" | All milk offers (German search) | |
| "chicken" | Hähnchenbrust offers (EN→DE) | |
| "buttter" (typo) | Butter offers | |
| "Kerrygold" | All Kerrygold products (brand search) | |
| "kaese" (no umlaut) | Käse offers | |
| "toothpaste" | Zahnpasta offers (EN→DE) | |

---

## 3. USER ENGAGEMENT SCORE (Weight: 20%)

Are people actually using it and coming back?

| Metric | Formula | Target Week 1 | Target Month 1 | Target Month 3 |
|--------|---------|---------------|-----------------|-----------------|
| **Unique Visitors** | unique IPs/sessions per week | 50+ | 500+ | 5,000+ |
| **Searches Per Visit** | total_searches / unique_visitors | 2+ | 3+ | 4+ |
| **Return Rate** | visitors_who_return_within_7d / total_visitors | 10% | 25% | 40% |
| **Avg Session Duration** | avg time on site | 30s+ | 60s+ | 90s+ |
| **Bounce Rate** | single_page_visits / total_visits | < 70% | < 50% | < 40% |
| **Page Views** | total page views per week | 200+ | 2,000+ | 20,000+ |
| **City Distribution** | cities with at least 1 search | 3+ | 10+ | 20+ |
| **Language Split** | % using DE vs EN | Any | 40/60 | 50/50 |

### How to Track:
- Add Vercel Analytics (free) or Plausible (privacy-friendly)
- Track search events with a simple analytics endpoint

---

## 4. GROWTH SCORE (Weight: 15%)

Is the word spreading?

| Metric | Formula | Target Week 1 | Target Month 1 | Target Month 3 |
|--------|---------|---------------|-----------------|-----------------|
| **Organic Traffic** | visitors from Google/Bing | 0 | 50+ | 500+ |
| **Referral Traffic** | visitors from shared links | 10+ | 100+ | 500+ |
| **Social Mentions** | mentions on Reddit/Facebook/Twitter | 1+ | 5+ | 20+ |
| **Backlinks** | external sites linking to papierbox.eu | 0 | 3+ | 10+ |
| **Newsletter Signups** | email list size (when added) | - | 50+ | 500+ |
| **GitHub Stars** | stars on Papierbox repo | 0 | 5+ | 25+ |

### Growth Actions:
- Week 1: Post in 5 expat Facebook groups + 3 Reddit threads
- Month 1: SEO pages for "cheapest [product] in [city]"
- Month 3: Partner with 2-3 expat bloggers/YouTubers

---

## 5. INFRASTRUCTURE SCORE (Weight: 0% — but blocks everything if red)

The app must work. Non-negotiable.

| Metric | Target | Status Check |
|--------|--------|-------------|
| **Uptime** | 99.5%+ | Vercel status |
| **API Response Time** | < 500ms | Test from browser |
| **Build Success** | 100% | Vercel deploys |
| **Cron Success** | > 80% | GitHub Actions tab |
| **Monthly Cost** | < EUR 5 | Vercel + Supabase + Claude API bills |
| **SSL Certificate** | Valid | Check papierbox.eu |
| **Mobile Responsive** | Works on phone | Manual test |

---

## COMPOSITE SCORE FORMULA

```
Overall Score = (Data Quality × 0.40)
             + (Search Quality × 0.25)
             + (User Engagement × 0.20)
             + (Growth × 0.15)

Where each sub-score = (metrics_at_target / total_metrics) × 100
```

| Overall Score | Rating | Meaning |
|---------------|--------|---------|
| 80-100% | **CRUSHING IT** | Ready for monetization |
| 60-79% | **ON TRACK** | Growing, keep pushing |
| 40-59% | **NEEDS WORK** | Focus on weakest area |
| 0-39% | **RED ALERT** | Fix fundamentals first |

---

## CURRENT SCORE (March 22, 2026 — Launch Day)

### Data Quality: 45/100
- Store Coverage: 3/5 active (Aldi good, Kaufland partial, others minimal) → 60%
- Total Real Offers: 77 → below 100 target
- Estimated Prices: 74 → at target
- Brand Coverage: ~20 brands → at target
- Freshness: < 24h → good

### Search Quality: 70/100
- pg_trgm fuzzy search working
- Bilingual synonyms (50+ pairs) working
- Typo correction working
- Zero-result fallback working

### User Engagement: 0/100
- Just launched, no users yet
- Analytics not set up yet

### Growth: 0/100
- No marketing started yet
- No social posts yet

### Infrastructure: 90/100
- Site live at papierbox.eu
- Supabase connected
- GitHub Actions cron set up
- SSL working
- Mobile responsive

### **LAUNCH DAY COMPOSITE: 38/100**
This is normal for Day 1. The score jumps fast once you:
1. Get data from all 5 stores (→ Data Quality jumps to 70+)
2. Add analytics (→ User Engagement becomes measurable)
3. Post in 5 expat groups (→ Growth starts)

**Target: 60/100 by end of Month 1**

---

## WEEKLY CHECK-IN TEMPLATE

Every Sunday, check these 5 numbers:

```
1. Total real offers in DB:     ___
2. Scrape success rate:         ___%
3. Unique visitors this week:   ___
4. Searches this week:          ___
5. Zero-result searches:        ___%
```

If #1 < 100 → fix scraper
If #3 < target → more marketing
If #5 > 20% → add more products/synonyms
