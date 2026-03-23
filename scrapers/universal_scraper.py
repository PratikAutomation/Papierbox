"""
Universal scraper for German supermarket offers.

Fetches HTML from supermarket offer pages and uses Claude API to extract
structured product data. Stores results in Supabase.
"""

import json
import time
import random
import logging
import argparse
from datetime import datetime, timedelta
from bs4 import BeautifulSoup
import requests
import anthropic
from supabase import create_client

from config import (
    ANTHROPIC_API_KEY, SUPABASE_URL, SUPABASE_SERVICE_KEY,
    CLAUDE_MODEL, CLAUDE_FALLBACK_MODEL, MAX_TOKENS,
    RATE_LIMIT_SECONDS, MIN_OFFERS_PER_STORE, MAX_PRICE,
    USER_AGENTS, STORES, EXTRACTION_PROMPT, REQUEST_TIMEOUT
)

# Try to import browser scraper (optional — only needed for JS-rendered stores)
try:
    from browser_scraper import fetch_rendered_html
    HAS_PLAYWRIGHT = True
except ImportError:
    HAS_PLAYWRIGHT = False

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


def get_supabase():
    """Initialize and return Supabase client."""
    return create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)


def get_claude():
    """Initialize and return Anthropic client."""
    return anthropic.Anthropic(api_key=ANTHROPIC_API_KEY)


def fetch_html(url: str) -> str:
    """
    Fetch HTML with browser-like headers.

    Args:
        url: The URL to fetch

    Returns:
        Raw HTML as string

    Raises:
        requests.RequestException: If the request fails
    """
    headers = {
        "User-Agent": random.choice(USER_AGENTS),
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "de-DE,de;q=0.9,en;q=0.8",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
    }

    response = requests.get(url, headers=headers, timeout=REQUEST_TIMEOUT)
    response.raise_for_status()
    return response.text


def extract_text_content(html: str) -> str:
    """
    Strip HTML to text to estimate content size.

    Removes scripts, styles, nav, footer elements and returns clean text.

    Args:
        html: Raw HTML string

    Returns:
        Extracted text content
    """
    soup = BeautifulSoup(html, "lxml")

    # Remove non-content elements
    for tag in soup(["script", "style", "nav", "footer", "header", "noscript"]):
        tag.decompose()

    text = soup.get_text(separator=" ", strip=True)
    return text


def extract_json_ld(html: str) -> str:
    """Extract JSON-LD structured data from HTML (many stores embed product data this way)."""
    soup = BeautifulSoup(html, "lxml")
    json_ld_blocks = []
    for script in soup.find_all("script", {"type": "application/ld+json"}):
        try:
            data = json.loads(script.string or "")
            json_ld_blocks.append(json.dumps(data, ensure_ascii=False, indent=2))
        except (json.JSONDecodeError, TypeError):
            continue
    return "\n".join(json_ld_blocks)


def extract_inline_json(html: str) -> str:
    """Extract product data from inline JavaScript (window.__INITIAL_STATE__, etc.)."""
    import re
    patterns = [
        r'window\.__INITIAL_STATE__\s*=\s*(\{.+?\});',
        r'window\.__NEXT_DATA__\s*=\s*(\{.+?\});',
        r'"products"\s*:\s*(\[.+?\])',
        r'"offers"\s*:\s*(\[.+?\])',
        r'"items"\s*:\s*(\[.+?\])',
    ]
    results = []
    for pattern in patterns:
        matches = re.findall(pattern, html[:200000], re.DOTALL)
        for match in matches:
            if len(match) > 50:
                results.append(match[:5000])
    return "\n".join(results)


def clean_html_for_extraction(html: str) -> str:
    """
    Extract meaningful content from HTML for Claude processing.
    Uses multiple strategies: JSON-LD, inline JS data, and cleaned text.
    """
    parts = []

    # Strategy 1: JSON-LD structured data (best quality)
    json_ld = extract_json_ld(html)
    if json_ld and len(json_ld) > 100:
        parts.append(f"=== STRUCTURED DATA (JSON-LD) ===\n{json_ld[:8000]}")

    # Strategy 2: Inline JavaScript product data
    inline = extract_inline_json(html)
    if inline and len(inline) > 100:
        parts.append(f"=== EMBEDDED PRODUCT DATA ===\n{inline[:5000]}")

    # Strategy 3: Clean text extraction (always include)
    soup = BeautifulSoup(html, "lxml")

    # Remove non-content elements but KEEP scripts for now (already extracted above)
    for tag in soup(["style", "noscript", "link", "meta", "svg", "path", "img"]):
        tag.decompose()

    # Now remove scripts too for text extraction
    for tag in soup(["script"]):
        tag.decompose()

    # Try to find the main content area
    main = soup.find("main") or soup.find("div", {"role": "main"}) or soup.find("body")
    if main:
        soup = main

    lines = []
    for element in soup.find_all(["h1", "h2", "h3", "h4", "p", "span", "div", "li", "a", "td", "th"]):
        text = element.get_text(separator=" ", strip=True)
        if text and len(text) > 1 and len(text) < 500:
            lines.append(text)

    seen = set()
    unique_lines = []
    for line in lines:
        if line not in seen:
            seen.add(line)
            unique_lines.append(line)

    text_content = "\n".join(unique_lines)
    if text_content:
        parts.append(f"=== PAGE TEXT ===\n{text_content[:8000]}")

    result = "\n\n".join(parts)
    return result if result else text_content


def extract_offers_with_claude(content: str, store_name: str, model: str = None, attempt: int = 1) -> list[dict]:
    """
    Send content to Claude API and extract product offers.
    Uses cleaned text content instead of raw HTML for reliability.
    Retries up to 3 times on connection errors.
    """
    client = get_claude()
    use_model = model or CLAUDE_MODEL

    # Truncate to ~20K chars to fit context with structured data
    content_truncated = content[:20000]

    prompt = f"{EXTRACTION_PROMPT}\n\nStore: {store_name}\n\nPage content:\n{content_truncated}"

    logger.info(f"  Sending {len(content_truncated)} chars to Claude ({use_model}), attempt {attempt}...")

    try:
        response = client.messages.create(
            model=use_model,
            max_tokens=MAX_TOKENS,
            messages=[{"role": "user", "content": prompt}]
        )

        response_text = response.content[0].text.strip()

        # Handle cases where Claude wraps JSON in markdown code blocks
        if response_text.startswith("```"):
            lines = response_text.split("\n")
            response_text = "\n".join(lines[1:-1])

        offers = json.loads(response_text)

        if not isinstance(offers, list):
            raise ValueError(f"Expected list, got {type(offers)}")

        return offers

    except (anthropic.APIConnectionError, ConnectionError) as e:
        if attempt < 3:
            wait = attempt * 3
            logger.warning(f"  Connection error (attempt {attempt}/3), retrying in {wait}s...")
            time.sleep(wait)
            return extract_offers_with_claude(content, store_name, model, attempt + 1)
        logger.error(f"  Claude extraction failed after 3 attempts: {e}")
        raise

    except Exception as e:
        logger.error(f"  Claude extraction failed: {e}")
        raise


def validate_offer(offer: dict) -> bool:
    """
    Validate a single offer against quality criteria.

    Args:
        offer: Offer dictionary to validate

    Returns:
        True if offer passes all validation checks, False otherwise
    """
    try:
        # Check required fields exist and have valid content
        if not offer.get("product_name") or len(offer["product_name"]) < 3:
            return False

        if not offer.get("brand"):
            return False

        if not offer.get("category"):
            return False

        # Validate price
        price = float(offer.get("price", 0))
        if price <= 0 or price > MAX_PRICE:
            return False

        # Validate original price if present
        if offer.get("original_price") is not None:
            orig = float(offer["original_price"])
            if orig <= 0 or orig > MAX_PRICE:
                return False

        return True

    except (ValueError, TypeError):
        return False


def get_current_week_dates() -> tuple[str, str]:
    """
    Get current week's Monday and Sunday dates.

    Returns:
        Tuple of (monday, sunday) as YYYY-MM-DD strings
    """
    today = datetime.now()
    monday = today - timedelta(days=today.weekday())
    sunday = monday + timedelta(days=6)
    return monday.strftime("%Y-%m-%d"), sunday.strftime("%Y-%m-%d")


def normalize_offer(offer: dict, store_id: str) -> dict:
    """
    Normalize offer data for Supabase insertion.

    Args:
        offer: Raw offer dictionary from Claude
        store_id: ID of the store

    Returns:
        Normalized offer dictionary with all required fields
    """
    valid_from = offer.get("valid_from", "")
    valid_to = offer.get("valid_to", "")

    # Default to current week if dates missing
    if not valid_from or not valid_to:
        valid_from, valid_to = get_current_week_dates()

    return {
        "store_id": store_id,
        "brand": offer.get("brand", "Eigenmarke"),
        "product_name": offer["product_name"],
        "product_name_en": offer.get("product_name_en", offer["product_name"]),
        "category": offer.get("category", "Sonstiges"),
        "category_en": offer.get("category_en", "Other"),
        "price": float(offer["price"]),
        "original_price": float(offer["original_price"]) if offer.get("original_price") else None,
        "unit": offer.get("unit", "Stück"),
        "valid_from": valid_from,
        "valid_to": valid_to,
        "is_offer": True,
        "source_url": None,
    }


def save_to_supabase(store_id: str, offers: list[dict]) -> int:
    """
    Delete old offers for store and insert new ones.

    Args:
        store_id: ID of the store
        offers: List of normalized offer dictionaries

    Returns:
        Number of offers successfully inserted

    Raises:
        Exception: If database operations fail
    """
    sb = get_supabase()

    # Delete old offers for this store (only is_offer=true items)
    logger.info(f"  Deleting old offers for store_id={store_id}...")
    sb.table("offers").delete().eq("store_id", store_id).eq("is_offer", True).execute()

    # Insert in batches of 50 to avoid payload size limits
    inserted = 0
    for i in range(0, len(offers), 50):
        batch = offers[i:i+50]
        result = sb.table("offers").insert(batch).execute()
        inserted += len(result.data)

    return inserted


def log_scrape(store_id: str, status: str, count: int, error_msg: str | None, duration_ms: int):
    """
    Log scrape result to scrape_logs table.

    Args:
        store_id: ID of the store
        status: Status of the scrape ("success" or "error")
        count: Number of offers extracted
        error_msg: Error message if status is "error"
        duration_ms: Duration of scrape in milliseconds
    """
    try:
        sb = get_supabase()
        sb.table("scrape_logs").insert({
            "store_id": store_id,
            "status": status,
            "offers_count": count,
            "error_message": error_msg,
            "duration_ms": duration_ms,
        }).execute()
    except Exception as e:
        logger.error(f"  Failed to log scrape result: {e}")


def scrape_store(store: dict) -> int:
    """
    Scrape a single store and save offers to database.

    Args:
        store: Store configuration dictionary

    Returns:
        Number of offers saved
    """
    store_id = store["id"]
    store_name = store["name"]
    store_slug = store["slug"]

    logger.info(f"\n{'='*60}")
    logger.info(f"Scraping {store_name} (ID: {store_id})...")
    logger.info(f"{'='*60}")

    start_time = time.time()
    all_offers = []
    needs_browser = store.get("needs_browser", False)

    for url in store["offers_urls"]:
        try:
            html = None

            # Strategy 1: Use browser for JS-rendered stores
            if needs_browser and HAS_PLAYWRIGHT:
                logger.info(f"  [Browser] Fetching {url}...")
                html = fetch_rendered_html(url, timeout_ms=45000)
                if html:
                    logger.info(f"  [Browser] Got {len(html)} chars rendered HTML")
            elif needs_browser and not HAS_PLAYWRIGHT:
                logger.warning(f"  Store needs browser but Playwright not installed. Trying HTTP...")

            # Strategy 2: Simple HTTP (for non-JS stores or as fallback)
            if not html:
                logger.info(f"  [HTTP] Fetching {url}...")
                try:
                    html = fetch_html(url)
                    logger.info(f"  [HTTP] Got {len(html)} chars HTML")
                except requests.RequestException as e:
                    logger.error(f"  [HTTP] Failed: {e}")
                    continue

            if not html or len(html) < 500:
                logger.warning(f"  No usable HTML from {url}")
                continue

            # Clean HTML — extracts JSON-LD, inline JS data, and text
            cleaned = clean_html_for_extraction(html)
            logger.info(f"  Cleaned content: {len(cleaned)} chars")

            if len(cleaned) < 200:
                logger.warning(f"  Very little extractable content ({len(cleaned)} chars). Skipping.")
                continue

            # Extract with Claude (try primary model first)
            try:
                offers = extract_offers_with_claude(cleaned, store_name)
            except Exception as e:
                logger.warning(f"  {CLAUDE_MODEL} extraction failed: {e}. Trying {CLAUDE_FALLBACK_MODEL}...")
                try:
                    offers = extract_offers_with_claude(cleaned, store_name, model=CLAUDE_FALLBACK_MODEL)
                except Exception as e2:
                    logger.error(f"  {CLAUDE_FALLBACK_MODEL} also failed: {e2}")
                    continue

            logger.info(f"  Claude extracted {len(offers)} raw offers")

            # Validate each offer
            valid_offers = [o for o in offers if validate_offer(o)]
            rejected = len(offers) - len(valid_offers)
            logger.info(f"  {len(valid_offers)} offers passed validation (rejected {rejected})")

            all_offers.extend(valid_offers)

            # Rate limit between URLs
            time.sleep(RATE_LIMIT_SECONDS)

        except Exception as e:
            logger.error(f"  Unexpected error processing {url}: {e}")
            continue

    duration_ms = int((time.time() - start_time) * 1000)

    # Only save if we got enough offers
    if len(all_offers) >= MIN_OFFERS_PER_STORE:
        # Normalize for Supabase
        normalized = [normalize_offer(o, store_id) for o in all_offers]

        # Deduplicate by (product_name, price)
        seen = set()
        unique = []
        for o in normalized:
            key = (o["product_name"], o["price"])
            if key not in seen:
                seen.add(key)
                unique.append(o)

        logger.info(f"  Deduplication: {len(normalized)} -> {len(unique)} unique offers")

        try:
            count = save_to_supabase(store_id, unique)
            logger.info(f"  SUCCESS: Saved {count} offers for {store_name}")
            log_scrape(store_id, "success", count, None, duration_ms)
            return count
        except Exception as e:
            msg = f"Database save failed: {e}"
            logger.error(f"  {msg}")
            log_scrape(store_id, "error", len(unique), msg, duration_ms)
            return 0
    else:
        msg = f"Only {len(all_offers)} offers extracted (minimum {MIN_OFFERS_PER_STORE}). Keeping existing data."
        logger.warning(f"  {msg}")
        log_scrape(store_id, "error", len(all_offers), msg, duration_ms)
        return 0


def main():
    """Main entry point for the scraper."""
    parser = argparse.ArgumentParser(description="Scrape supermarket offers")
    parser.add_argument(
        "--store",
        type=str,
        help="Scrape only this store slug (e.g., 'lidl')"
    )
    args = parser.parse_args()

    # Validate environment variables
    if not ANTHROPIC_API_KEY:
        logger.error("ANTHROPIC_API_KEY not set. Check your .env file.")
        return
    if not SUPABASE_URL or not SUPABASE_SERVICE_KEY:
        logger.error("SUPABASE_URL or SUPABASE_SERVICE_KEY not set. Check your .env file.")
        return

    # Determine which stores to scrape
    stores_to_scrape = STORES
    if args.store:
        stores_to_scrape = [s for s in STORES if s["slug"] == args.store]
        if not stores_to_scrape:
            logger.error(
                f"Store '{args.store}' not found. "
                f"Available: {[s['slug'] for s in STORES]}"
            )
            return

    logger.info(f"\n{'='*60}")
    logger.info(f"STARTING SCRAPE FOR {len(stores_to_scrape)} STORES")
    logger.info(f"{'='*60}\n")

    total_offers = 0
    successful_stores = 0

    for store in stores_to_scrape:
        try:
            count = scrape_store(store)
            if count > 0:
                total_offers += count
                successful_stores += 1
        except Exception as e:
            logger.error(f"Unexpected error scraping {store['name']}: {e}")
            log_scrape(store["id"], "error", 0, str(e), 0)

        # Rate limit between stores
        if store != stores_to_scrape[-1]:
            time.sleep(RATE_LIMIT_SECONDS)

    logger.info(f"\n{'='*60}")
    logger.info(f"SCRAPING COMPLETE")
    logger.info(f"{'='*60}")
    logger.info(f"Total offers: {total_offers}")
    logger.info(f"Successful stores: {successful_stores}/{len(stores_to_scrape)}")
    logger.info(f"{'='*60}\n")


if __name__ == "__main__":
    main()
