"""
Firecrawl + Claude Vision powered scraper.
- Penny: Uses Firecrawl to get structured markdown (104K chars of product data)
- Lidl: Downloads leaflet page images → Claude Vision extracts products
- Netto: Uses Firecrawl on alternative prospekt URL
"""
import json
import re
import os
import logging
import requests
import base64
from datetime import datetime, timedelta

import anthropic
from dotenv import load_dotenv

load_dotenv()

logger = logging.getLogger(__name__)

ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY", "")
FIRECRAWL_API_KEY = os.getenv("FIRECRAWL_API_KEY", "")

EXTRACTION_PROMPT = """You are a German grocery price extraction expert.
Extract EVERY product with a price from this content.

Return a JSON array where each object has:
- brand: string — brand name (e.g., "Kerrygold", "Milka", "MELITTA"). Use "Eigenmarke" if store brand.
- product_name: string — full name including brand
- product_name_en: string — English translation
- category: string — German category (e.g., "Kaffee", "Butter", "Sekt")
- category_en: string — English category
- price: number — current price in EUR (1.79 not "1,79€")
- original_price: number | null — old/crossed-out price, or null
- unit: string — weight/volume (e.g., "500g", "0.75l", "Stück")

Rules:
1. Extract ALL products — food, drinks, household, everything
2. Convert comma decimals to dots (1,79 → 1.79)
3. Return ONLY the JSON array, no markdown wrapping
4. Skip products where you can't determine the price"""

VISION_PROMPT = """You are looking at a page from a German supermarket weekly offers leaflet (Prospekt).

Extract EVERY product visible on this page with its price.

Return a JSON array where each object has:
- brand: string — brand name visible on packaging
- product_name: string — full product name including brand
- product_name_en: string — English translation
- category: string — German category
- category_en: string — English category
- price: number — offer price in EUR
- original_price: number | null — crossed-out price if shown
- unit: string — weight/volume/count shown

Rules:
1. Read ALL products on the page
2. Prices as numbers (1.79 not "1,79€")
3. Return ONLY JSON array
4. Skip items you can't read clearly"""


def get_current_week_dates():
    today = datetime.now()
    monday = today - timedelta(days=today.weekday())
    sunday = monday + timedelta(days=6)
    return monday.strftime("%Y-%m-%d"), sunday.strftime("%Y-%m-%d")


def extract_with_claude(content: str, store_name: str, prompt: str = EXTRACTION_PROMPT) -> list[dict]:
    """Send text content to Claude for extraction."""
    client = anthropic.Anthropic(api_key=ANTHROPIC_API_KEY)

    # Send up to 40K chars (Penny has 104K, we want more coverage)
    content_truncated = content[:40000]

    logger.info(f"  Sending {len(content_truncated)} chars to Claude...")

    response = client.messages.create(
        model="claude-haiku-4-5-20251001",
        max_tokens=8192,
        messages=[{"role": "user", "content": f"{prompt}\n\nStore: {store_name}\n\n{content_truncated}"}],
    )

    text = response.content[0].text.strip()
    if text.startswith("```"):
        text = "\n".join(text.split("\n")[1:-1])

    text = re.sub(r',\s*}', '}', text)
    text = re.sub(r',\s*\]', ']', text)

    try:
        return json.loads(text)
    except json.JSONDecodeError:
        # Fallback: extract individual objects
        matches = re.findall(r'\{[^{}]*\}', text)
        products = []
        for m in matches:
            try:
                obj = json.loads(m)
                if 'product_name' in obj and 'price' in obj:
                    products.append(obj)
            except:
                pass
        return products


def extract_with_vision(image_url: str, store_name: str) -> list[dict]:
    """Send image URL to Claude Vision for extraction."""
    client = anthropic.Anthropic(api_key=ANTHROPIC_API_KEY)

    logger.info(f"  Sending image to Claude Vision...")

    response = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=4096,
        messages=[{
            "role": "user",
            "content": [
                {"type": "image", "source": {"type": "url", "url": image_url}},
                {"type": "text", "text": f"Store: {store_name}\n\n{VISION_PROMPT}"},
            ],
        }],
    )

    text = response.content[0].text.strip()
    if text.startswith("```"):
        text = "\n".join(text.split("\n")[1:-1])

    text = re.sub(r',\s*}', '}', text)
    text = re.sub(r',\s*\]', ']', text)

    try:
        return json.loads(text)
    except json.JSONDecodeError:
        matches = re.findall(r'\{[^{}]*\}', text)
        products = []
        for m in matches:
            try:
                obj = json.loads(m)
                if 'product_name' in obj:
                    products.append(obj)
            except:
                pass
        return products


def firecrawl_scrape(url: str) -> str:
    """Scrape a URL using Firecrawl API and return markdown content."""
    try:
        from firecrawl import FirecrawlApp
        app = FirecrawlApp(api_key=FIRECRAWL_API_KEY)
    except ImportError:
        from firecrawl import Firecrawl
        app = Firecrawl(api_key=FIRECRAWL_API_KEY)

    logger.info(f"  [Firecrawl] Scraping {url[:60]}...")

    result = app.scrape(url, formats=["markdown"], wait_for=5000)

    if isinstance(result, dict):
        return result.get("markdown", result.get("content", ""))
    elif hasattr(result, "markdown"):
        return result.markdown or ""
    return str(result)


def scrape_penny_firecrawl() -> list[dict]:
    """Scrape Penny using Firecrawl — returns structured markdown with product data."""
    logger.info("  [Penny] Using Firecrawl for structured product data...")

    content = firecrawl_scrape("https://www.penny.de/angebote")

    if len(content) < 1000:
        logger.warning(f"  [Penny] Firecrawl returned only {len(content)} chars")
        return []

    logger.info(f"  [Penny] Got {len(content)} chars of product data")
    return extract_with_claude(content, "Penny")


def scrape_lidl_vision() -> list[dict]:
    """Scrape Lidl by reading leaflet page images with Claude Vision."""
    logger.info("  [Lidl] Using Claude Vision on leaflet images...")

    # Lidl leaflet images are served from imgproxy.leaflets.schwarz
    # First, get the leaflet page to find image URLs
    content = firecrawl_scrape("https://www.lidl.de/l/prospekte/latest-leaflet-f5771509-f19a-11e9-b196-005056ab0fb6/view/flyer/page/1")

    # Extract image URLs from markdown
    image_urls = re.findall(r'https://imgproxy\.leaflets\.schwarz/[^\s\)]+\.jpg', content)
    logger.info(f"  [Lidl] Found {len(image_urls)} leaflet page images")

    all_products = []
    for i, img_url in enumerate(image_urls[:6]):  # Process up to 6 pages
        logger.info(f"  [Lidl] Processing page {i+1}/{min(len(image_urls), 6)}...")
        try:
            products = extract_with_vision(img_url, "Lidl")
            logger.info(f"  [Lidl] Page {i+1}: {len(products)} products extracted")
            all_products.extend(products)
        except Exception as e:
            logger.error(f"  [Lidl] Vision error on page {i+1}: {e}")
            continue

    return all_products


def scrape_netto_firecrawl() -> list[dict]:
    """Scrape Netto using alternative prospekt URL."""
    logger.info("  [Netto] Trying alternative URLs...")

    urls = [
        "https://www.netto-online.de/ueber-netto/Online-Prospekt.chtm",
        "https://www.netto-online.de/",
    ]

    for url in urls:
        try:
            content = firecrawl_scrape(url)
            if len(content) > 1000:
                logger.info(f"  [Netto] Got {len(content)} chars from {url[:50]}")
                products = extract_with_claude(content, "Netto")
                if len(products) >= 3:
                    return products
        except Exception as e:
            logger.error(f"  [Netto] Error with {url[:50]}: {e}")
            continue

    return []


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

    print("="*60)
    print("FIRECRAWL + VISION SCRAPER TEST")
    print("="*60)

    for name, scrape_fn in [
        ("Penny", scrape_penny_firecrawl),
        ("Lidl", scrape_lidl_vision),
        ("Netto", scrape_netto_firecrawl),
    ]:
        print(f"\n{'='*60}")
        print(f"  {name}")
        print(f"{'='*60}")

        products = scrape_fn()
        print(f"\n  TOTAL: {len(products)} products")
        for p in products[:15]:
            orig = f" (was €{p.get('original_price')})" if p.get('original_price') else ""
            print(f"    {p.get('brand', '?'):<20} {p.get('product_name', '?')[:35]:<37} €{p.get('price', '?')}{orig}  [{p.get('unit', '?')}]")
        if len(products) > 15:
            print(f"    ... and {len(products) - 15} more")
