# SEO Strategy: Programmatic Pages + Blog
**Date:** 2026-04-13
**Status:** Approved — implementation in progress

## Problem
papierbox.eu is indexed by Google but ranking for zero non-branded keywords. Root causes:
- Only 1 page indexed (homepage, single-page React app)
- Zero backlinks / domain authority
- Brand name "Papierbox" conflicts with German paper box products
- No crawlable URLs with real product content

## Approach: Programmatic SEO + Blog (Approach B)

### URL Structure

**Level 1 — City hubs** `/angebote/[city]`
- 25 pages (one per city)
- Targets: "supermarkt angebote hamburg diese woche"
- Data: all current offers grouped by store
- SSR + revalidate 86400

**Level 2 — City × Store** `/angebote/[city]/[store]`
- 125 pages (25 cities × 5 stores)
- Targets: "lidl angebote hamburg", "penny angebote berlin"
- Data: store-filtered current offers
- SSR + revalidate 86400

**Level 3 — Product categories** `/preisvergleich/[category]`
- ~40 pages (distinct category_en values from DB)
- Targets: "butter preisvergleich supermarkt", "milch günstigster supermarkt"
- Data: all offers for category, grouped by store, sorted by price
- SSR + revalidate 86400

**Blog** `/blog/[slug]`
- 8 articles to start
- AI-drafted, human-reviewed
- TSX components (no MDX dependency)
- Targets topical authority + backlinks from expat communities

### Data Layer
- All programmatic pages: `generateStaticParams` + `revalidate = 86400`
- Supabase anon client works in server components
- City not a DB filter (offers are nationwide) — provides SEO context only
- Categories dynamically fetched from `SELECT DISTINCT category_en`

### Schema Markup
- City hub: ItemList + FAQPage + BreadcrumbList
- City×Store: ItemList + BreadcrumbList
- Category: Product + AggregateOffer (real prices only, no fake ratings)
- Blog: Article + datePublished

### Schema Fixes
- Removed fake AggregateRating (4.8 stars / 12 reviews) from layout.tsx

### Blog Articles (8)
1. The 5 Cheapest Supermarkets in Germany (And What to Actually Buy Where)
2. Lidl vs Aldi: Which One is Actually Cheaper?
3. How I Cut My German Grocery Bill by €70 a Month
4. German Supermarkets Explained: A No-Nonsense Guide for Newcomers
5. Germany's Weekly Supermarket Offers: How the System Works
6. Aldi Süd vs Aldi Nord: Yes, They're Actually Different Stores
7. Grocery Shopping in Germany on a Student Budget
8. Kaufland vs Penny vs Netto: The Three Stores Nobody Talks About Enough

Writing voice: conversational, first/second person, specific German examples, contractions, dry humour. Not corporate.

### Sitemap
Update `src/app/sitemap.ts` to include all new URLs.

### Total new pages: ~170+
