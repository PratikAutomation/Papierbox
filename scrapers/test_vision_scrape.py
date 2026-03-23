"""
Test Claude Vision on supermarket prospekt images.
Takes screenshots of leaflet pages and uses Claude Vision to extract products.
"""
import base64
import json
import re
import os
from dotenv import load_dotenv

load_dotenv()

import anthropic
import requests

ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY", "")

EXTRACTION_PROMPT = """You are looking at a German supermarket weekly offers leaflet/prospekt page.

Extract EVERY product visible on this page with its price.

Return a JSON array where each object has:
- brand: string — the brand name visible (e.g., "Kerrygold", "Milka", "Barilla"). If store brand, use "Eigenmarke"
- product_name: string — full product name as displayed, including brand
- product_name_en: string — English translation
- category: string — product category in German (e.g., "Butter", "Milch", "Schokolade")
- category_en: string — category in English
- price: number — the current/offer price in EUR (e.g., 1.79)
- original_price: number | null — the crossed-out/old price if shown, otherwise null
- unit: string — weight/volume/count (e.g., "250g", "1L", "Stück")

Rules:
1. Extract ALL products with a visible price
2. Prices are numbers (1.79 not "1,79€")
3. Convert German comma decimals to dots
4. Return ONLY the JSON array
5. If you can't read a price clearly, skip that product
6. Include brand names exactly as shown"""


def test_with_url_image(image_url: str, store_name: str):
    """Test Claude Vision with an image URL."""
    client = anthropic.Anthropic(api_key=ANTHROPIC_API_KEY)

    print(f"\n  Sending image to Claude Vision...")

    response = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=4096,
        messages=[{
            "role": "user",
            "content": [
                {
                    "type": "image",
                    "source": {
                        "type": "url",
                        "url": image_url,
                    },
                },
                {
                    "type": "text",
                    "text": f"Store: {store_name}\n\n{EXTRACTION_PROMPT}",
                },
            ],
        }],
    )

    response_text = response.content[0].text.strip()

    # Clean JSON
    if response_text.startswith("```"):
        lines = response_text.split("\n")
        response_text = "\n".join(lines[1:-1])

    response_text = re.sub(r',\s*}', '}', response_text)
    response_text = re.sub(r',\s*\]', ']', response_text)

    try:
        products = json.loads(response_text)
    except json.JSONDecodeError:
        pattern = r'\{[^{}]*\}'
        matches = re.findall(pattern, response_text)
        products = []
        for m in matches:
            try:
                obj = json.loads(m)
                if 'product_name' in obj:
                    products.append(obj)
            except:
                pass

    return products


def test_with_screenshot(url: str, store_name: str):
    """Take screenshot with Playwright and send to Claude Vision."""
    try:
        from playwright.sync_api import sync_playwright
    except ImportError:
        print("  Playwright not installed, skipping screenshot test")
        return []

    client = anthropic.Anthropic(api_key=ANTHROPIC_API_KEY)

    print(f"  Taking screenshot of {url[:60]}...")

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page(viewport={"width": 1920, "height": 1080})
        page.goto(url, wait_until="networkidle", timeout=30000)
        page.wait_for_timeout(5000)

        # Take full page screenshot
        screenshot = page.screenshot(full_page=False, type="png")
        browser.close()

    # Encode to base64
    img_base64 = base64.b64encode(screenshot).decode("utf-8")
    print(f"  Screenshot: {len(screenshot)} bytes")

    print(f"  Sending to Claude Vision (Sonnet)...")
    response = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=4096,
        messages=[{
            "role": "user",
            "content": [
                {
                    "type": "image",
                    "source": {
                        "type": "base64",
                        "media_type": "image/png",
                        "data": img_base64,
                    },
                },
                {
                    "type": "text",
                    "text": f"Store: {store_name}\n\n{EXTRACTION_PROMPT}",
                },
            ],
        }],
    )

    response_text = response.content[0].text.strip()

    if response_text.startswith("```"):
        lines = response_text.split("\n")
        response_text = "\n".join(lines[1:-1])

    response_text = re.sub(r',\s*}', '}', response_text)
    response_text = re.sub(r',\s*\]', ']', response_text)

    try:
        products = json.loads(response_text)
    except json.JSONDecodeError:
        pattern = r'\{[^{}]*\}'
        matches = re.findall(pattern, response_text)
        products = []
        for m in matches:
            try:
                obj = json.loads(m)
                if 'product_name' in obj:
                    products.append(obj)
            except:
                pass

    return products


if __name__ == "__main__":
    print("="*60)
    print("CLAUDE VISION PROSPEKT EXTRACTION TEST")
    print("="*60)

    # Test Lidl prospekt page via screenshot
    tests = [
        ("Lidl", "https://www.lidl.de/l/prospekte/latest-leaflet-f5771509-f19a-11e9-b196-005056ab0fb6/view/flyer/page/1"),
        ("Netto", "https://wochenprospekt.netto-online.de/"),
    ]

    for store_name, url in tests:
        print(f"\n{'='*60}")
        print(f"  {store_name}")
        print(f"{'='*60}")

        products = test_with_screenshot(url, store_name)

        print(f"\n  EXTRACTED: {len(products)} products")
        for p in products:
            orig = f" (was €{p.get('original_price', '')})" if p.get('original_price') else ""
            print(f"    {p.get('brand', '?'):<20} {p.get('product_name', '?'):<35} €{p.get('price', '?')}{orig}  [{p.get('unit', '?')}]")
