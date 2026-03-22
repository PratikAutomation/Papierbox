"""Debug script to check what content we get from each supermarket."""
import requests
from bs4 import BeautifulSoup

USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

URLS = [
    ("Lidl (billiger-montag)", "https://www.lidl.de/c/billiger-montag/a10006065"),
    ("Lidl (angebote)", "https://www.lidl.de/q/angebote"),
    ("Aldi Süd", "https://www.aldi-sued.de/de/angebote.html"),
    ("Penny", "https://www.penny.de/angebote/aktuelle-angebote"),
    ("Kaufland", "https://www.kaufland.de/angebote/aktuelle-woche.html"),
    ("Netto", "https://www.netto-online.de/angebote"),
]

for name, url in URLS:
    print(f"\n{'='*60}")
    print(f"{name}: {url}")
    print('='*60)
    try:
        r = requests.get(url, headers={"User-Agent": USER_AGENT}, timeout=15)
        print(f"  Status: {r.status_code}")
        print(f"  HTML size: {len(r.text)} chars")

        soup = BeautifulSoup(r.text, "lxml")
        for tag in soup(["script", "style", "nav", "noscript", "link", "meta"]):
            tag.decompose()
        text = soup.get_text(separator="\n", strip=True)

        print(f"  Text size: {len(text)} chars")

        # Look for price patterns (€, EUR, numbers like 1,99)
        import re
        prices = re.findall(r'\d+[.,]\d{2}\s*€|€\s*\d+[.,]\d{2}|\d+[.,]\d{2}\s*EUR', text)
        print(f"  Price patterns found: {len(prices)}")
        if prices[:5]:
            print(f"  Sample prices: {prices[:5]}")

        # Show first 500 chars of text
        print(f"  Text preview:\n    {text[:500]}")

    except Exception as e:
        print(f"  ERROR: {e}")
