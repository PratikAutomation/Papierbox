"""
API Discovery Script — Find internal API endpoints for each German supermarket.
These websites are all SPAs that load product data via APIs.
We want to find those APIs and call them directly.
"""
import requests
import re
import json
from bs4 import BeautifulSoup

UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
HEADERS = {"User-Agent": UA, "Accept-Language": "de-DE,de;q=0.9,en;q=0.8"}


def find_api_urls_in_js(html: str) -> list[str]:
    """Extract potential API URLs from inline and linked JavaScript."""
    patterns = [
        r'https?://[^"\s]+/api/[^"\s]*',
        r'https?://[^"\s]+/rest/[^"\s]*',
        r'https?://[^"\s]+/v\d/[^"\s]*',
        r'https?://[^"\s]+/graphql[^"\s]*',
        r'"(/api/[^"]+)"',
        r'"(/rest/[^"]+)"',
    ]
    urls = set()
    for p in patterns:
        for match in re.findall(p, html):
            urls.add(match.strip("'\""))
    return sorted(urls)


def find_json_ld(html: str) -> list[dict]:
    """Extract JSON-LD structured data."""
    soup = BeautifulSoup(html, "lxml")
    results = []
    for script in soup.find_all("script", {"type": "application/ld+json"}):
        try:
            data = json.loads(script.string or "")
            results.append(data)
        except:
            pass
    return results


def find_next_data(html: str) -> dict | None:
    """Extract __NEXT_DATA__ from Next.js sites."""
    match = re.search(r'<script id="__NEXT_DATA__"[^>]*>(.*?)</script>', html, re.DOTALL)
    if match:
        try:
            return json.loads(match.group(1))
        except:
            pass
    return None


def find_initial_state(html: str) -> list[str]:
    """Extract inline JavaScript state variables that might contain product data."""
    patterns = [
        r'window\.__INITIAL_STATE__\s*=\s*({.+?});',
        r'window\.__PRELOADED_STATE__\s*=\s*({.+?});',
        r'window\.__APP_STATE__\s*=\s*({.+?});',
        r'window\.dataLayer\s*=\s*(\[.+?\]);',
    ]
    results = []
    for p in patterns:
        matches = re.findall(p, html[:300000], re.DOTALL)
        for m in matches:
            results.append(m[:500] + "..." if len(m) > 500 else m)
    return results


def try_known_apis(store_name: str) -> list[dict]:
    """Try known API endpoint patterns for each store."""
    results = []

    apis = {
        "Lidl": [
            "https://www.lidl.de/p/api/gridboxes/DE/de/?id=a10006065",
            "https://www.lidl.de/p/api/gridboxes/DE/de/?id=a10006066",
            "https://www.lidl.de/p/api/product/DE/de/",
            "https://www.lidl.de/p/api/campaign/DE/de/",
        ],
        "Penny": [
            "https://www.penny.de/api/offers",
            "https://www.penny.de/api/offers/current",
            "https://api.penny.de/offers",
            "https://www.penny.de/_next/data/",
        ],
        "Netto": [
            "https://www.netto-online.de/api/offers",
            "https://www.netto-online.de/api/v1/offers",
            "https://api.netto-online.de/offers",
            "https://www.netto-online.de/INTERSHOP/rest/",
        ],
        "Aldi": [
            "https://www.aldi-sued.de/de/angebote.html",
            "https://www.aldi-sued.de/api/offers",
        ],
        "Kaufland": [
            "https://www.kaufland.de/api/offers",
            "https://filiale.kaufland.de/api/v1/offers",
            "https://www.kaufland.de/angebote/aktuelle-woche.html",
        ],
    }

    for url in apis.get(store_name, []):
        try:
            r = requests.get(url, headers=HEADERS, timeout=10)
            content_type = r.headers.get("Content-Type", "")
            is_json = "json" in content_type or r.text.strip().startswith(("{", "["))

            result = {
                "url": url,
                "status": r.status_code,
                "content_type": content_type[:50],
                "size": len(r.text),
                "is_json": is_json,
            }

            if is_json and r.status_code == 200:
                try:
                    data = r.json()
                    if isinstance(data, list):
                        result["items"] = len(data)
                        result["sample_keys"] = list(data[0].keys())[:10] if data else []
                    elif isinstance(data, dict):
                        result["keys"] = list(data.keys())[:10]
                        # Check for nested arrays that might be product lists
                        for key in data:
                            if isinstance(data[key], list) and len(data[key]) > 3:
                                result[f"array_{key}"] = len(data[key])
                                if data[key] and isinstance(data[key][0], dict):
                                    result[f"sample_{key}"] = list(data[key][0].keys())[:8]
                except:
                    pass

            result["preview"] = r.text[:200] if r.status_code == 200 else ""
            results.append(result)

        except Exception as e:
            results.append({"url": url, "error": str(e)[:100]})

    return results


def probe_store(name: str, url: str):
    """Full probe of a store's website."""
    print(f"\n{'='*70}")
    print(f"  {name}")
    print(f"  {url}")
    print(f"{'='*70}")

    try:
        r = requests.get(url, headers=HEADERS, timeout=15)
        print(f"  Status: {r.status_code}")
        print(f"  Size: {len(r.text)} chars")
        print(f"  Content-Type: {r.headers.get('Content-Type', 'unknown')[:50]}")

        # Find API URLs in page source
        api_urls = find_api_urls_in_js(r.text)
        if api_urls:
            print(f"\n  API URLs found in source ({len(api_urls)}):")
            for u in api_urls[:15]:
                print(f"    → {u}")

        # Find JSON-LD
        json_ld = find_json_ld(r.text)
        if json_ld:
            print(f"\n  JSON-LD blocks: {len(json_ld)}")
            for jl in json_ld[:3]:
                t = jl.get("@type", "unknown")
                print(f"    → Type: {t}")

        # Find __NEXT_DATA__
        next_data = find_next_data(r.text)
        if next_data:
            print(f"\n  __NEXT_DATA__ found! Keys: {list(next_data.keys())[:5]}")
            props = next_data.get("props", {}).get("pageProps", {})
            if props:
                print(f"    pageProps keys: {list(props.keys())[:10]}")
                for k, v in props.items():
                    if isinstance(v, list) and len(v) > 3:
                        print(f"    → {k}: {len(v)} items")

        # Find initial state
        states = find_initial_state(r.text)
        if states:
            print(f"\n  Inline state variables: {len(states)}")
            for s in states[:3]:
                print(f"    → {s[:150]}")

        # Find linked JS bundles that might contain API config
        soup = BeautifulSoup(r.text, "lxml")
        scripts = soup.find_all("script", src=True)
        js_urls = [s["src"] for s in scripts if "chunk" in s["src"] or "main" in s["src"] or "app" in s["src"]]
        if js_urls:
            print(f"\n  App JS bundles: {len(js_urls)}")
            for js in js_urls[:5]:
                print(f"    → {js[:80]}")

    except Exception as e:
        print(f"  ERROR: {e}")

    # Try known APIs
    print(f"\n  Trying known API endpoints for {name}...")
    api_results = try_known_apis(name)
    for ar in api_results:
        if "error" in ar:
            print(f"    ✗ {ar['url'][:60]} → {ar['error'][:50]}")
        else:
            status_icon = "✓" if ar["status"] == 200 and ar["is_json"] else "○" if ar["status"] == 200 else "✗"
            print(f"    {status_icon} [{ar['status']}] {ar['url'][:60]} ({ar['size']} bytes, json={ar['is_json']})")
            if ar.get("items"):
                print(f"      → {ar['items']} items, keys: {ar.get('sample_keys', [])}")
            if ar.get("keys"):
                print(f"      → keys: {ar['keys']}")
            for k in ar:
                if k.startswith("array_"):
                    field = k.replace("array_", "")
                    print(f"      → {field}: {ar[k]} items, sample: {ar.get(f'sample_{field}', [])}")
            if ar.get("preview"):
                print(f"      → preview: {ar['preview'][:120]}")


if __name__ == "__main__":
    stores = [
        ("Lidl", "https://www.lidl.de/c/billiger-montag/a10006065"),
        ("Aldi", "https://www.aldi-sued.de/de/angebote.html"),
        ("Penny", "https://www.penny.de/angebote"),
        ("Kaufland", "https://www.kaufland.de/angebote/aktuelle-woche.html"),
        ("Netto", "https://www.netto-online.de/angebote"),
    ]

    for name, url in stores:
        probe_store(name, url)

    print(f"\n{'='*70}")
    print("DISCOVERY COMPLETE")
    print(f"{'='*70}")
