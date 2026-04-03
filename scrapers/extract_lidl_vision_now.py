"""
Extract ALL products from Lidl Prospekt PDF using Claude Vision.
Processes each page as an image → Claude reads it → returns structured data.
"""
import fitz
import base64
import json
import re
import os
import sys
from dotenv import load_dotenv
load_dotenv()

import anthropic

ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY", "")
if not ANTHROPIC_API_KEY:
    print("ERROR: ANTHROPIC_API_KEY not set in .env")
    sys.exit(1)

client = anthropic.Anthropic(api_key=ANTHROPIC_API_KEY)

PDF_PATH = r"C:\petroject\Project_1\Prospect\kaufDA - Lidl - LIDL LOHNT SICH.pdf"

PROMPT = """You are reading a page from a Lidl weekly offers Prospekt (leaflet).

Extract EVERY product with a price visible on this page.

Return a JSON array. Each object:
- brand: string (e.g., "Milka", "Kerrygold", "Eigenmarke")
- product_name: string (full name with brand)
- product_name_en: string (English translation)
- category: string (German category)
- category_en: string (English category)
- price: number (offer price in EUR, use dots: 1.79)
- original_price: number | null (old/crossed-out price, or null)
- unit: string (e.g., "250g", "1L", "Stück")

Rules:
1. Extract ALL products with visible prices
2. Convert comma decimals to dots (1,79 -> 1.79)
3. Return ONLY the JSON array
4. If page has NO products (just branding/ads), return []
5. Include exact brand names as shown"""

doc = fitz.open(PDF_PATH)
print(f"Lidl Prospekt: {doc.page_count} pages")
print(f"Processing each page with Claude Vision...\n")

all_products = []
pages_with_products = 0

for page_num in range(doc.page_count):
    page = doc[page_num]

    # Render page to image
    mat = fitz.Matrix(1.5, 1.5)  # 1.5x zoom for readability without being too large
    pix = page.get_pixmap(matrix=mat)
    img_bytes = pix.tobytes("png")
    img_b64 = base64.b64encode(img_bytes).decode("utf-8")

    print(f"Page {page_num + 1}/{doc.page_count} ({len(img_bytes)//1024}KB)...", end=" ", flush=True)

    try:
        response = client.messages.create(
            model="claude-haiku-4-5-20251001",
            max_tokens=4096,
            messages=[{
                "role": "user",
                "content": [
                    {"type": "image", "source": {"type": "base64", "media_type": "image/png", "data": img_b64}},
                    {"type": "text", "text": f"Store: Lidl\n\n{PROMPT}"},
                ],
            }],
        )

        text = response.content[0].text.strip()
        if text.startswith("```"):
            text = "\n".join(text.split("\n")[1:-1])
        text = re.sub(r',\s*}', '}', text)
        text = re.sub(r',\s*\]', ']', text)

        try:
            products = json.loads(text)
        except json.JSONDecodeError:
            matches = re.findall(r'\{[^{}]*\}', text)
            products = []
            for m in matches:
                try:
                    obj = json.loads(m)
                    if 'product_name' in obj and 'price' in obj:
                        products.append(obj)
                except:
                    pass

        valid = [p for p in products if isinstance(p, dict) and p.get('product_name') and p.get('price') and float(p.get('price', 0)) > 0]

        if valid:
            pages_with_products += 1
            all_products.extend(valid)
            print(f"{len(valid)} products")
            for p in valid:
                orig = f" (was {p.get('original_price')})" if p.get('original_price') else ""
                print(f"    {p.get('brand','?'):<20} {p['product_name'][:40]:<42} EUR{p['price']}{orig} [{p.get('unit','?')}]")
        else:
            print("no products (branding/ad page)")

    except Exception as e:
        print(f"ERROR: {str(e)[:80]}")
        continue

doc.close()

# Deduplicate
seen = set()
unique = []
for p in all_products:
    key = (p["product_name"], float(p["price"]))
    if key not in seen:
        seen.add(key)
        unique.append(p)

print(f"\n{'='*60}")
print(f"EXTRACTION COMPLETE")
print(f"{'='*60}")
print(f"Pages processed: {doc.page_count}")
print(f"Pages with products: {pages_with_products}")
print(f"Total products: {len(all_products)}")
print(f"After dedup: {len(unique)}")

# Save to JSON file
output_path = os.path.join(os.path.dirname(__file__), "lidl_extracted.json")
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(unique, f, ensure_ascii=False, indent=2)
print(f"\nSaved to: {output_path}")
