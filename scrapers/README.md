# Universal Supermarket Scraper

Production-ready scraper for German supermarket offers using Claude API for universal HTML parsing.

## Quick Start

```bash
# 1. Install dependencies
pip install -r requirements.txt

# 2. Configure environment
cp .env.example .env
# Edit .env with your API keys

# 3. Run scraper
python universal_scraper.py

# Or scrape single store
python universal_scraper.py --store lidl
```

## How It Works

```
HTML Fetching → Claude API Extraction → Validation → Supabase Storage
```

1. **Fetch HTML** with browser-like headers
2. **Extract offers** using Claude API (Haiku primary, Sonnet fallback)
3. **Validate** prices, brands, categories
4. **Deduplicate** by product name + price
5. **Save** to Supabase (replace old offers)

## Configuration

Edit `config.py`:

- **Stores**: Add/modify `STORES` list with offer URLs
- **Models**: `CLAUDE_MODEL` (Haiku) and `CLAUDE_FALLBACK_MODEL` (Sonnet)
- **Validation**: `MIN_OFFERS_PER_STORE = 5`, `MAX_PRICE = 200`
- **Rate Limits**: `RATE_LIMIT_SECONDS = 3`

## Environment Variables

Create `.env` file:

```env
ANTHROPIC_API_KEY=sk-ant-api03-...
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_SERVICE_KEY=eyJ...
```

## Supported Stores

- Lidl (2 URLs)
- Aldi Süd
- Penny
- Kaufland
- Netto

## Output

Each offer includes:
- Brand, product name (DE + EN), category (DE + EN)
- Price, original price, unit
- Valid from/to dates
- Stored in `offers` table with `is_offer=true`

## Error Recovery

- If < 5 offers extracted → keeps existing data
- Logs all results to `scrape_logs` table
- Automatic fallback to Sonnet if Haiku fails

## Cost

~EUR 0.50/month (5 stores × 8 runs × EUR 0.01 per run)

See `/docs/superpowers/specs/2026-03-22-data-pipeline-design.md` for complete architecture.
