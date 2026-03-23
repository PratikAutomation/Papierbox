"""Test Firecrawl on the REAL prospekt/leaflet URLs."""
import json
import re

try:
    from firecrawl import FirecrawlApp
    app = FirecrawlApp(api_key="fc-877683f06aac44329474231f0e466613")
except:
    from firecrawl import Firecrawl
    app = Firecrawl(api_key="fc-877683f06aac44329474231f0e466613")

print("Available methods:", [m for m in dir(app) if not m.startswith("_")])

# THE REAL PROSPEKT URLs (from Google search results)
stores = [
    ("Lidl", "https://www.lidl.de/l/prospekte/latest-leaflet-f5771509-f19a-11e9-b196-005056ab0fb6/view/flyer/page/1"),
    ("Netto", "https://wochenprospekt.netto-online.de/"),
    ("Penny", "https://www.penny.de/angebote"),
    ("Kaufland", "https://filiale.kaufland.de/prospekte.html"),
]

for name, url in stores:
    print(f"\n{'='*60}")
    print(f"  {name} — {url[:70]}")
    print(f"{'='*60}")

    try:
        if hasattr(app, "scrape_url"):
            result = app.scrape_url(url, params={"formats": ["markdown"], "waitFor": 5000})
        elif hasattr(app, "scrape"):
            result = app.scrape(url, formats=["markdown"], wait_for=5000)
        else:
            result = app.scrape_url(url)

        if isinstance(result, dict):
            markdown = result.get("markdown", result.get("content", str(result)))
        elif hasattr(result, "markdown"):
            markdown = result.markdown or ""
        else:
            markdown = str(result)

        print(f"  Content size: {len(markdown)} chars")

        prices = re.findall(r'\d+[.,]\d{2}\s*€|€\s*\d+[.,]\d{2}|\d+[.,]\d{2}\s*EUR', markdown)
        print(f"  Prices found: {len(prices)}")
        if prices[:15]:
            print(f"  Samples: {prices[:15]}")

        # Show content preview
        print(f"\n  Preview:\n  {markdown[:2000]}")

    except Exception as e:
        print(f"  ERROR: {type(e).__name__}: {e}")
