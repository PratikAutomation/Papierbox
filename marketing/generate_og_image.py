r"""Generate OG image (1200x630) for papierbox.eu social sharing.

Usage: cd C:\petroject\Project_1\marketing && python generate_og_image.py
"""
import os
from playwright.sync_api import sync_playwright
from PIL import Image

HTML = """<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800;900&display=swap" rel="stylesheet">
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body {
    width: 1200px; height: 630px; overflow: hidden;
    font-family: 'Plus Jakarta Sans', sans-serif;
    background: #FAFAFA; display: flex;
}
body::after {
    content: ''; position: absolute; top: 0; left: 0; right: 0; bottom: 0;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.03'/%3E%3C/svg%3E");
    pointer-events: none; z-index: 9;
}

.left {
    flex: 1.1; display: flex; flex-direction: column;
    justify-content: center; padding: 60px 50px 60px 70px;
}
.right {
    flex: 0.9; display: flex; flex-direction: column;
    justify-content: center; align-items: center;
    padding: 40px 50px;
}

.brand {
    font-size: 18px; font-weight: 900; color: #22c55e;
    letter-spacing: 4px; text-transform: uppercase; margin-bottom: 20px;
}
.headline {
    font-size: 48px; font-weight: 900; color: #1a1c1c;
    line-height: 1.1; letter-spacing: -1px;
}
.headline em { font-style: normal; color: #22c55e; }
.sub {
    font-size: 20px; font-weight: 700; color: rgba(26,28,28,0.5);
    margin-top: 20px; line-height: 1.5;
}
.stores {
    display: flex; gap: 10px; margin-top: 28px; flex-wrap: wrap;
}
.store-pill {
    background: white; border: 3px solid #1a1c1c; border-radius: 30px;
    padding: 8px 18px; font-size: 15px; font-weight: 800;
    box-shadow: 3px 3px 0px rgba(26,28,28,0.15);
}
.url {
    margin-top: 28px; font-size: 24px; font-weight: 900;
    color: white; background: #22c55e; display: inline-block;
    padding: 10px 30px; border-radius: 40px;
    border: 3px solid #1a1c1c; box-shadow: 4px 4px 0px #1a1c1c;
}

/* Right side — mock price card */
.mock-card {
    width: 100%; background: white; border: 4px solid #1a1c1c;
    border-radius: 24px; padding: 24px 28px; margin-bottom: 12px;
    box-shadow: 5px 5px 0px rgba(26,28,28,0.12);
    display: flex; justify-content: space-between; align-items: center;
}
.mock-card.best { border-color: #22c55e; border-width: 4px; position: relative; }
.mock-card .store-name { font-size: 22px; font-weight: 800; }
.mock-card .product { font-size: 14px; color: rgba(26,28,28,0.4); margin-top: 2px; }
.mock-card .price { font-size: 32px; font-weight: 900; }
.mock-card .price.green { color: #22c55e; }
.mock-card .orig { font-size: 14px; color: rgba(26,28,28,0.3); text-decoration: line-through; }
.cheapest-badge {
    position: absolute; top: -12px; right: 16px;
    background: #22c55e; color: white; font-size: 11px;
    font-weight: 900; padding: 4px 14px; border-radius: 20px;
    border: 2px solid #1a1c1c;
}
.search-label {
    font-size: 14px; font-weight: 800; color: rgba(26,28,28,0.3);
    text-transform: uppercase; letter-spacing: 2px; margin-bottom: 16px;
    width: 100%; text-align: left;
}
</style>
</head>
<body>
<div class="left">
    <div class="brand">PAPIERBOX</div>
    <div class="headline">Compare <em>Grocery Prices</em><br>Across Germany</div>
    <div class="sub">Search any product. Pick your city.<br>See every store's price — cheapest first.</div>
    <div class="stores">
        <div class="store-pill">Lidl</div>
        <div class="store-pill">Aldi</div>
        <div class="store-pill">Penny</div>
        <div class="store-pill">Kaufland</div>
        <div class="store-pill">Netto</div>
    </div>
    <div class="url">papierbox.eu</div>
</div>
<div class="right">
    <div class="search-label">🔍 Search: "Butter"</div>
    <div class="mock-card best">
        <div>
            <div class="store-name">🏆 Kaufland</div>
            <div class="product">WEIHENSTEPHAN Butter 250g</div>
        </div>
        <div style="text-align:right;">
            <div class="price green">€1.29</div>
            <div class="orig">€2.89</div>
        </div>
        <div class="cheapest-badge">CHEAPEST</div>
    </div>
    <div class="mock-card">
        <div>
            <div class="store-name">Penny</div>
            <div class="product">KERRYGOLD Butter 250g</div>
        </div>
        <div style="text-align:right;">
            <div class="price">€1.69</div>
            <div class="orig">€3.49</div>
        </div>
    </div>
    <div class="mock-card">
        <div>
            <div class="store-name">Aldi</div>
            <div class="product">Deutsche Markenbutter 250g</div>
        </div>
        <div style="text-align:right;">
            <div class="price">€1.89</div>
        </div>
    </div>
</div>
</body></html>"""

# Save HTML
html_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "og_image.html")
with open(html_path, "w", encoding="utf-8") as f:
    f.write(HTML)

# Screenshot
output = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "public", "og-image.png")

print("Generating OG image (1200x630)...")
with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)
    page = browser.new_page(viewport={"width": 1200, "height": 630}, device_scale_factor=2)
    page.goto("file:///" + html_path.replace("\\", "/"), wait_until="networkidle")
    page.wait_for_timeout(2000)
    page.screenshot(path=output + ".raw.png")
    browser.close()

# Resize to exact 1200x630
img = Image.open(output + ".raw.png")
img_resized = img.resize((1200, 630), Image.LANCZOS)
img_resized.save(output, "PNG", optimize=True)
os.remove(output + ".raw.png")

print(f"Saved: {output}")
print(f"Size: {os.path.getsize(output) // 1024}KB")
