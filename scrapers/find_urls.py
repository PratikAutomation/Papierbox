"""Find working offer page URLs for each supermarket."""
import requests

USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
import re

def check_url(name, url):
    try:
        r = requests.get(url, headers={"User-Agent": USER_AGENT}, timeout=15, allow_redirects=True)
        from bs4 import BeautifulSoup
        soup = BeautifulSoup(r.text, "lxml")
        for tag in soup(["script", "style", "nav", "noscript", "link", "meta"]):
            tag.decompose()
        text = soup.get_text(separator=" ", strip=True)
        prices = re.findall(r'\d+[.,]\d{2}\s*€|€\s*\d+[.,]\d{2}', text)
        status = "HAS PRICES" if len(prices) >= 3 else "no prices"
        print(f"  [{r.status_code}] {status} ({len(prices)} found) - {url}")
        if prices[:3]:
            print(f"         Sample: {prices[:3]}")
        return len(prices) >= 3
    except Exception as e:
        print(f"  [ERR] {e} - {url}")
        return False

print("=== PENNY ===")
for url in [
    "https://www.penny.de/angebote",
    "https://www.penny.de/angebote/aktuelle-woche",
    "https://www.penny.de/markt/angebote",
    "https://www.penny.de/aktionen",
]:
    check_url("Penny", url)

print("\n=== LIDL (alternative pages) ===")
for url in [
    "https://www.lidl.de/c/angebote-der-woche/a10006332",
    "https://www.lidl.de/c/billiger-donnerstag/a10006066",
    "https://www.lidl.de/angebote",
]:
    check_url("Lidl", url)

print("\n=== KAUFLAND ===")
for url in [
    "https://www.kaufland.de/angebote/naechste-woche.html",
    "https://www.kaufland.de/sortiment/angebote/",
    "https://filiale.kaufland.de/angebote/aktuelle-woche.html",
]:
    check_url("Kaufland", url)

print("\n=== NETTO ===")
for url in [
    "https://www.netto-online.de/ueber-netto/angebote.html",
    "https://www.netto-online.de/wochenangebote",
]:
    check_url("Netto", url)
