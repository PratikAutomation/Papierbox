"""
Extract product data directly from JSON-LD structured data in supermarket pages.
Lidl embeds OfferCatalog JSON-LD — this is the most reliable extraction method.
"""
import requests
import json
import re
from bs4 import BeautifulSoup

UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
HEADERS = {"User-Agent": UA, "Accept-Language": "de-DE,de;q=0.9"}


def extract_all_jsonld(url: str) -> list[dict]:
    """Fetch page and extract all JSON-LD blocks."""
    r = requests.get(url, headers=HEADERS, timeout=30)
    soup = BeautifulSoup(r.text, "lxml")
    results = []
    for script in soup.find_all("script", {"type": "application/ld+json"}):
        try:
            data = json.loads(script.string or "")
            results.append(data)
        except:
            pass
    return results


def extract_all_script_json(html: str) -> list[dict]:
    """Extract JSON objects from ALL script tags (not just JSON-LD)."""
    soup = BeautifulSoup(html, "lxml")
    results = []

    for script in soup.find_all("script"):
        text = script.string or ""
        if len(text) < 100:
            continue

        # Look for JSON objects/arrays in script content
        # Try to find product-related data
        json_patterns = [
            r'(?:products|items|offers|articles)\s*[:=]\s*(\[[\s\S]*?\])\s*[;,]',
            r'JSON\.parse\([\'"](.+?)[\'"]\)',
        ]

        for pattern in json_patterns:
            matches = re.findall(pattern, text[:50000])
            for m in matches:
                try:
                    data = json.loads(m)
                    if isinstance(data, list) and len(data) > 2:
                        results.append({"source": "inline_script", "count": len(data), "sample": data[0] if data else None})
                except:
                    pass

    return results


def probe_lidl():
    """Deep probe of Lidl's page structure."""
    print("\n" + "="*70)
    print("LIDL — Deep JSON-LD & Script Analysis")
    print("="*70)

    urls = [
        "https://www.lidl.de/c/billiger-montag/a10006065",
        "https://www.lidl.de/angebote",
    ]

    for url in urls:
        print(f"\n--- {url} ---")
        try:
            r = requests.get(url, headers=HEADERS, timeout=30)
            print(f"Status: {r.status_code}, Size: {len(r.text)}")

            # JSON-LD
            jsonld = extract_all_jsonld(url)
            for i, jl in enumerate(jsonld):
                jtype = jl.get("@type", "unknown")
                print(f"\nJSON-LD #{i+1}: @type = {jtype}")
                print(json.dumps(jl, indent=2, ensure_ascii=False)[:2000])

                # If OfferCatalog, dig into it
                if jtype == "OfferCatalog" or "Offer" in str(jtype):
                    items = jl.get("itemListElement", jl.get("offers", []))
                    if isinstance(items, list):
                        print(f"\n  → Contains {len(items)} items!")
                        for item in items[:5]:
                            print(f"    → {json.dumps(item, ensure_ascii=False)[:200]}")

            # Script JSON
            script_json = extract_all_script_json(r.text)
            if script_json:
                print(f"\nInline script JSON blocks: {len(script_json)}")
                for sj in script_json[:5]:
                    print(f"  → {sj.get('count', '?')} items, sample keys: {list(sj.get('sample', {}).keys())[:8] if isinstance(sj.get('sample'), dict) else 'N/A'}")

            # Also check for price patterns in the full HTML to see if there IS data
            prices = re.findall(r'\d+[.,]\d{2}\s*€|€\s*\d+[.,]\d{2}', r.text)
            print(f"\nPrice patterns in raw HTML: {len(prices)}")
            if prices[:10]:
                print(f"  Samples: {prices[:10]}")

        except Exception as e:
            print(f"ERROR: {e}")


def probe_penny():
    """Deep probe of Penny's page."""
    print("\n" + "="*70)
    print("PENNY — Deep Analysis")
    print("="*70)

    url = "https://www.penny.de/angebote"
    try:
        r = requests.get(url, headers=HEADERS, timeout=30)
        print(f"Status: {r.status_code}, Size: {len(r.text)}")

        # JSON-LD
        jsonld = extract_all_jsonld(url)
        for i, jl in enumerate(jsonld):
            jtype = jl.get("@type", "unknown")
            print(f"\nJSON-LD #{i+1}: @type = {jtype}")
            print(json.dumps(jl, indent=2, ensure_ascii=False)[:2000])

        # Check for __NEXT_DATA__ (Penny might use Next.js)
        next_match = re.search(r'<script id="__NEXT_DATA__"[^>]*>(.*?)</script>', r.text, re.DOTALL)
        if next_match:
            print(f"\n__NEXT_DATA__ found! Size: {len(next_match.group(1))}")
            try:
                nd = json.loads(next_match.group(1))
                props = nd.get("props", {}).get("pageProps", {})
                print(f"  pageProps keys: {list(props.keys())[:15]}")
                for k, v in props.items():
                    if isinstance(v, list):
                        print(f"  → {k}: {len(v)} items")
                        if v and isinstance(v[0], dict):
                            print(f"    sample keys: {list(v[0].keys())[:10]}")
                            print(f"    sample: {json.dumps(v[0], ensure_ascii=False)[:300]}")
                    elif isinstance(v, dict):
                        for k2, v2 in v.items():
                            if isinstance(v2, list) and len(v2) > 2:
                                print(f"  → {k}.{k2}: {len(v2)} items")
                                if v2 and isinstance(v2[0], dict):
                                    print(f"    sample keys: {list(v2[0].keys())[:10]}")
            except Exception as e:
                print(f"  Parse error: {e}")

        # Price patterns
        prices = re.findall(r'\d+[.,]\d{2}\s*€|€\s*\d+[.,]\d{2}', r.text)
        print(f"\nPrice patterns: {len(prices)}")
        if prices[:10]:
            print(f"  Samples: {prices[:10]}")

        # Look for product-like data in script tags
        soup = BeautifulSoup(r.text, "lxml")
        for script in soup.find_all("script"):
            text = script.string or ""
            if "price" in text.lower() and "product" in text.lower() and len(text) > 500:
                print(f"\n  Found script with 'price' + 'product' ({len(text)} chars)")
                # Find JSON-like structures
                json_starts = [m.start() for m in re.finditer(r'[\[{]', text[:5000])]
                for start in json_starts[:3]:
                    snippet = text[max(0,start):start+300]
                    if "price" in snippet.lower():
                        print(f"    → {snippet[:200]}")

    except Exception as e:
        print(f"ERROR: {e}")


def probe_netto():
    """Deep probe of Netto."""
    print("\n" + "="*70)
    print("NETTO — Deep Analysis")
    print("="*70)

    # Try different Netto URLs
    urls = [
        "https://www.netto-online.de/angebote",
        "https://www.netto-online.de/",
        "https://www.netto-online.de/category/angebote-der-woche",
    ]

    for url in urls:
        print(f"\n--- {url} ---")
        try:
            r = requests.get(url, headers=HEADERS, timeout=15, allow_redirects=True)
            print(f"Status: {r.status_code}, Size: {len(r.text)}, Final URL: {r.url}")
            if r.status_code == 200:
                prices = re.findall(r'\d+[.,]\d{2}\s*€|€\s*\d+[.,]\d{2}', r.text)
                print(f"Price patterns: {len(prices)}")

                jsonld = extract_all_jsonld(r.url)
                if jsonld:
                    for jl in jsonld:
                        print(f"JSON-LD: {jl.get('@type', '?')}")
                        print(json.dumps(jl, ensure_ascii=False)[:500])
        except Exception as e:
            print(f"ERROR: {e}")


if __name__ == "__main__":
    probe_lidl()
    probe_penny()
    probe_netto()

    print("\n" + "="*70)
    print("DEEP DISCOVERY COMPLETE")
    print("="*70)
