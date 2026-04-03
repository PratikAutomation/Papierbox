"""
Process supermarket Prospekt PDFs → extract products → upload to Supabase.

Usage:
  1. Download Prospekt PDFs from KaufDa and save to ../Prospect/ folder
  2. Run: python process_prospekt.py

The script will:
  - Find all PDFs in the Prospect folder
  - Detect which store it's from (by filename)
  - Extract text from each page
  - Send to Claude for product extraction
  - Upload to Supabase
"""
import os
import sys
import json
import re
import logging
import base64
from pathlib import Path
from datetime import datetime, timedelta

from dotenv import load_dotenv
load_dotenv()

import anthropic
from supabase import create_client

ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY", "")
SUPABASE_URL = os.getenv("SUPABASE_URL", "")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY", "")

PROSPECT_DIR = Path(__file__).parent.parent / "Prospect"

STORE_MAP = {
    "lidl": {"id": "1", "name": "Lidl", "color": "#0050AA"},
    "aldi": {"id": "2", "name": "Aldi Süd", "color": "#00005F"},
    "penny": {"id": "3", "name": "Penny", "color": "#CD1719"},
    "kaufland": {"id": "4", "name": "Kaufland", "color": "#E10915"},
    "netto": {"id": "5", "name": "Netto", "color": "#FFE600"},
}

EXTRACTION_PROMPT = """You are extracting product offers from a German supermarket weekly Prospekt (leaflet) page.

Extract EVERY product with a price visible on this page.

Return a JSON array where each object has:
- brand: string — brand name (e.g., "Kerrygold", "Milka", "Eigenmarke")
- product_name: string — full product name including brand
- product_name_en: string — English translation
- category: string — German category (e.g., "Butter", "Kaffee", "Waschmittel")
- category_en: string — English category
- price: number — offer price in EUR (1.79 not "1,79€")
- original_price: number | null — crossed-out old price, or null
- unit: string — weight/volume (e.g., "250g", "1L", "500ml")

Rules:
1. Extract ALL products — food, drinks, household, everything
2. Convert comma decimals to dots (1,79 → 1.79)
3. Return ONLY the JSON array
4. Skip products where price is unclear
5. Include brand names exactly as shown"""

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)


def detect_store(filename: str) -> dict | None:
    """Detect which store this PDF is from based on filename."""
    fname_lower = filename.lower()
    for key, store in STORE_MAP.items():
        if key in fname_lower:
            return store
    return None


def get_current_week_dates():
    today = datetime.now()
    monday = today - timedelta(days=today.weekday())
    sunday = monday + timedelta(days=6)
    return monday.strftime("%Y-%m-%d"), sunday.strftime("%Y-%m-%d")


def extract_from_pdf_with_vision(pdf_path: str, store: dict) -> list[dict]:
    """
    Extract products from PDF using Claude Vision.
    Converts each PDF page to an image and sends to Claude.
    """
    try:
        import fitz  # PyMuPDF
    except ImportError:
        logger.error("PyMuPDF not installed. Run: pip install PyMuPDF")
        return []

    client = anthropic.Anthropic(api_key=ANTHROPIC_API_KEY)
    doc = fitz.open(pdf_path)
    all_products = []

    logger.info(f"  PDF has {len(doc)} pages")

    for page_num in range(len(doc)):
        page = doc[page_num]

        # Render page to image (300 DPI for good quality)
        mat = fitz.Matrix(2, 2)  # 2x zoom = ~144 DPI (good balance of quality/size)
        pix = page.get_pixmap(matrix=mat)
        img_bytes = pix.tobytes("png")
        img_base64 = base64.b64encode(img_bytes).decode("utf-8")

        logger.info(f"  Processing page {page_num + 1}/{len(doc)} ({len(img_bytes)} bytes)...")

        try:
            response = client.messages.create(
                model="claude-haiku-4-5-20251001",
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
                            "text": f"Store: {store['name']}\n\n{EXTRACTION_PROMPT}",
                        },
                    ],
                }],
            )

            text = response.content[0].text.strip()

            # Clean JSON
            if text.startswith("```"):
                text = "\n".join(text.split("\n")[1:-1])
            text = re.sub(r',\s*}', '}', text)
            text = re.sub(r',\s*\]', ']', text)

            try:
                products = json.loads(text)
            except json.JSONDecodeError:
                # Fallback: extract individual objects
                matches = re.findall(r'\{[^{}]*\}', text)
                products = []
                for m in matches:
                    try:
                        obj = json.loads(m)
                        if 'product_name' in obj and 'price' in obj:
                            products.append(obj)
                    except:
                        pass

            valid = [p for p in products if p.get('product_name') and p.get('price') and float(p.get('price', 0)) > 0]
            logger.info(f"  Page {page_num + 1}: {len(valid)} products extracted")
            all_products.extend(valid)

        except Exception as e:
            logger.error(f"  Page {page_num + 1} error: {e}")
            continue

    doc.close()
    return all_products


def extract_from_pdf_text(pdf_path: str, store: dict) -> list[dict]:
    """
    Try text extraction first (cheaper than Vision).
    Some PDFs have embedded text, others are pure images.
    """
    try:
        import fitz
    except ImportError:
        logger.error("PyMuPDF not installed. Run: pip install PyMuPDF")
        return []

    doc = fitz.open(pdf_path)
    all_text = ""

    for page_num in range(len(doc)):
        page = doc[page_num]
        text = page.get_text()
        if text.strip():
            all_text += f"\n--- Page {page_num + 1} ---\n{text}"

    doc.close()

    if len(all_text) < 500:
        logger.info("  PDF has minimal text — will use Vision (image-based)")
        return []

    logger.info(f"  Extracted {len(all_text)} chars of text from PDF")

    # Send text to Claude for extraction
    client = anthropic.Anthropic(api_key=ANTHROPIC_API_KEY)

    # Process in chunks if text is very long
    chunk_size = 30000
    all_products = []

    for i in range(0, len(all_text), chunk_size):
        chunk = all_text[i:i + chunk_size]
        logger.info(f"  Sending chunk {i // chunk_size + 1} ({len(chunk)} chars) to Claude...")

        try:
            response = client.messages.create(
                model="claude-haiku-4-5-20251001",
                max_tokens=4096,
                messages=[{
                    "role": "user",
                    "content": f"Store: {store['name']}\n\n{EXTRACTION_PROMPT}\n\nProspekt text:\n{chunk}",
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
                        if 'product_name' in obj:
                            products.append(obj)
                    except:
                        pass

            valid = [p for p in products if p.get('product_name') and p.get('price') and float(p.get('price', 0)) > 0]
            all_products.extend(valid)

        except Exception as e:
            logger.error(f"  Claude error: {e}")
            continue

    return all_products


def upload_to_supabase(products: list[dict], store: dict):
    """Upload extracted products to Supabase."""
    sb = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)
    store_id = store["id"]
    valid_from, valid_to = get_current_week_dates()

    # Delete old offers for this store
    logger.info(f"  Deleting old offers for {store['name']}...")
    sb.table("offers").delete().eq("store_id", store_id).eq("is_offer", True).execute()

    # Prepare rows
    rows = []
    seen = set()
    for p in products:
        key = (p["product_name"], float(p["price"]))
        if key in seen:
            continue
        seen.add(key)

        rows.append({
            "store_id": store_id,
            "brand": p.get("brand", "Eigenmarke"),
            "product_name": p["product_name"],
            "product_name_en": p.get("product_name_en", p["product_name"]),
            "category": p.get("category", "Sonstiges"),
            "category_en": p.get("category_en", "Other"),
            "price": float(p["price"]),
            "original_price": float(p["original_price"]) if p.get("original_price") else None,
            "unit": p.get("unit", "Stück"),
            "valid_from": valid_from,
            "valid_to": valid_to,
            "is_offer": True,
            "source_url": None,
        })

    # Insert in batches
    inserted = 0
    for i in range(0, len(rows), 50):
        batch = rows[i:i+50]
        result = sb.table("offers").insert(batch).execute()
        inserted += len(result.data)

    logger.info(f"  Uploaded {inserted} offers for {store['name']}")
    return inserted


def process_pdf(pdf_path: str):
    """Process a single PDF file."""
    filename = os.path.basename(pdf_path)
    store = detect_store(filename)

    if not store:
        logger.warning(f"  Cannot detect store from filename: {filename}")
        logger.info(f"  Filename should contain one of: {list(STORE_MAP.keys())}")
        return

    logger.info(f"\n{'='*60}")
    logger.info(f"Processing: {filename}")
    logger.info(f"Store: {store['name']}")
    logger.info(f"{'='*60}")

    # Try text extraction first (cheap)
    products = extract_from_pdf_text(pdf_path, store)

    # If text extraction found few products, use Vision (image-based)
    if len(products) < 10:
        logger.info(f"  Text extraction got {len(products)} products. Trying Vision...")
        vision_products = extract_from_pdf_with_vision(pdf_path, store)
        if len(vision_products) > len(products):
            products = vision_products

    if not products:
        logger.warning(f"  No products extracted from {filename}")
        return

    logger.info(f"  Total extracted: {len(products)} products")

    # Upload to Supabase
    count = upload_to_supabase(products, store)
    logger.info(f"  SUCCESS: {count} offers uploaded for {store['name']}")


def main():
    if not ANTHROPIC_API_KEY:
        logger.error("ANTHROPIC_API_KEY not set")
        sys.exit(1)
    if not SUPABASE_URL or not SUPABASE_SERVICE_KEY:
        logger.error("Supabase credentials not set")
        sys.exit(1)

    # Find all PDFs in Prospect folder
    if not PROSPECT_DIR.exists():
        PROSPECT_DIR.mkdir(parents=True)
        logger.info(f"Created {PROSPECT_DIR}")
        logger.info(f"Drop your Prospekt PDFs there and run again.")
        return

    pdfs = list(PROSPECT_DIR.glob("*.pdf"))
    if not pdfs:
        logger.info(f"No PDFs found in {PROSPECT_DIR}")
        logger.info(f"Download Prospekt PDFs from KaufDa and save them there.")
        return

    logger.info(f"Found {len(pdfs)} PDF(s) in {PROSPECT_DIR}")

    for pdf_path in pdfs:
        try:
            process_pdf(str(pdf_path))
        except Exception as e:
            logger.error(f"Error processing {pdf_path.name}: {e}")


if __name__ == "__main__":
    main()
