"""
Browser-based scraper using Playwright for JS-rendered supermarket pages.
This is the fallback for stores where simple HTTP requests fail (Lidl, Penny, Netto).
Launches a headless Chrome browser, waits for products to load, extracts the rendered HTML.
"""
import json
import time
import logging
import re
from playwright.sync_api import sync_playwright, TimeoutError as PlaywrightTimeout

logger = logging.getLogger(__name__)


def fetch_rendered_html(url: str, wait_for_prices: bool = True, timeout_ms: int = 30000) -> str:
    """
    Fetch a page using headless Chrome, wait for JS to render, return full HTML.

    Args:
        url: Page URL
        wait_for_prices: If True, waits for price elements to appear
        timeout_ms: Max time to wait for page load

    Returns:
        Fully rendered HTML string
    """
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        context = browser.new_context(
            user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
            locale="de-DE",
            viewport={"width": 1920, "height": 1080},
        )
        page = context.new_page()

        try:
            logger.info(f"  [Browser] Loading {url}...")
            page.goto(url, wait_until="networkidle", timeout=timeout_ms)

            # Extra wait for dynamic content to load
            page.wait_for_timeout(3000)

            # Scroll down to trigger lazy loading
            for _ in range(5):
                page.evaluate("window.scrollBy(0, window.innerHeight)")
                page.wait_for_timeout(1000)

            # Scroll back to top
            page.evaluate("window.scrollTo(0, 0)")
            page.wait_for_timeout(1000)

            html = page.content()
            logger.info(f"  [Browser] Got {len(html)} chars rendered HTML")

            return html

        except PlaywrightTimeout:
            logger.warning(f"  [Browser] Timeout loading {url}")
            return page.content()  # Return whatever loaded
        except Exception as e:
            logger.error(f"  [Browser] Error: {e}")
            return ""
        finally:
            browser.close()


def extract_products_from_rendered_html(html: str) -> dict:
    """
    Extract product data from fully rendered HTML.
    Returns stats about what was found.
    """
    from bs4 import BeautifulSoup

    soup = BeautifulSoup(html, "lxml")

    # Count price elements
    price_patterns = re.findall(r'\d+[.,]\d{2}\s*€|€\s*\d+[.,]\d{2}', soup.get_text())

    # Look for common product card patterns
    product_cards = []
    for selector in [
        "[data-price]", "[class*=product]", "[class*=offer]", "[class*=article]",
        "[class*=Price]", "[class*=Offer]", "[class*=Article]",
        "[data-product]", "[data-article]", "[data-offer]",
    ]:
        elements = soup.select(selector)
        if elements:
            product_cards.append({"selector": selector, "count": len(elements)})

    return {
        "html_size": len(html),
        "price_count": len(price_patterns),
        "price_samples": price_patterns[:10],
        "product_selectors": product_cards,
    }


def scrape_lidl_browser() -> str:
    """Scrape Lidl offers using headless browser."""
    urls = [
        "https://www.lidl.de/angebote",
    ]
    all_html = ""
    for url in urls:
        html = fetch_rendered_html(url, timeout_ms=45000)
        if html:
            all_html += html
    return all_html


def scrape_penny_browser() -> str:
    """Scrape Penny offers using headless browser."""
    urls = [
        "https://www.penny.de/angebote",
    ]
    all_html = ""
    for url in urls:
        html = fetch_rendered_html(url, timeout_ms=45000)
        if html:
            all_html += html
    return all_html


def scrape_netto_browser() -> str:
    """Scrape Netto offers using headless browser."""
    urls = [
        "https://www.netto-online.de/angebote",
        "https://www.netto-online.de/",
    ]
    all_html = ""
    for url in urls:
        html = fetch_rendered_html(url, timeout_ms=45000)
        if html:
            all_html += html
            break  # One successful page is enough
    return all_html


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

    print("Testing Playwright browser scraping...\n")

    for name, scrape_fn in [("Lidl", scrape_lidl_browser), ("Penny", scrape_penny_browser), ("Netto", scrape_netto_browser)]:
        print(f"\n{'='*60}")
        print(f"  {name}")
        print(f"{'='*60}")

        html = scrape_fn()
        if html:
            stats = extract_products_from_rendered_html(html)
            print(f"  HTML size: {stats['html_size']}")
            print(f"  Prices found: {stats['price_count']}")
            if stats['price_samples']:
                print(f"  Price samples: {stats['price_samples']}")
            if stats['product_selectors']:
                print(f"  Product selectors:")
                for ps in stats['product_selectors']:
                    print(f"    → {ps['selector']}: {ps['count']} elements")
        else:
            print(f"  FAILED — no HTML returned")
