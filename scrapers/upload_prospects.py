"""
Safely upload all Prospekt SQL files to Supabase.
- Validates each file
- Fixes source_urls to actual offers pages
- Deletes ALL old data per store (offers + estimates)
- Inserts new data in batches
- Verifies after upload
"""
import os
import re
import json
import sys
from dotenv import load_dotenv
load_dotenv()

from supabase import create_client

SUPABASE_URL = os.getenv("SUPABASE_URL", "")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY", "")

if not SUPABASE_URL or not SUPABASE_SERVICE_KEY:
    print("ERROR: Set SUPABASE_URL and SUPABASE_SERVICE_KEY in .env")
    sys.exit(1)

sb = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)

PROSPECT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "Prospect")

# Correct source URLs for each store (actual offers pages)
SOURCE_URLS = {
    "1": "https://www.lidl.de/angebote",
    "2": "https://www.aldi-sued.de/de/angebote.html",
    "3": "https://www.penny.de/angebote",
    "4": "https://filiale.kaufland.de/angebote/aktuelle-woche.html",
    "5": "https://www.netto-online.de/angebote",
}

# Files to upload (in order)
FILES = [
    ("lidl_offers_2026_03_30_fixed.sql", "1", "Lidl"),
    ("aldi_offers_2026_03_30.sql", "2", "Aldi Süd"),
    ("penny_offers_2026_03_30.sql", "3", "Penny"),
    ("kaufland_offers_2026_03_30.sql", "4", "Kaufland"),
    ("netto_offers_2026_03_30.sql", "5", "Netto"),
]


def parse_sql_inserts(filepath, expected_store_id):
    """Parse INSERT rows from SQL file into list of dicts."""
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    # Extract all INSERT value rows: ('store_id', 'brand', ...)
    pattern = r"\(([^)]+)\)"
    matches = re.findall(pattern, content)

    rows = []
    for match in matches:
        # Skip if this doesn't look like a data row
        if not match.startswith(f"'{expected_store_id}'"):
            continue

        # Parse CSV values (handle escaped quotes)
        values = []
        current = ""
        in_quote = False
        for char in match:
            if char == "'" and not in_quote:
                in_quote = True
                current = ""
            elif char == "'" and in_quote:
                # Check for escaped quote ('')
                if current.endswith("'"):
                    current = current[:-1] + "'"
                    continue
                in_quote = False
                values.append(current)
                current = ""
            elif in_quote:
                current += char
            elif char == "," and not in_quote:
                # Check for NULL
                remaining = match[match.index(char):] if char in match else ""
                pass  # handled below

        # Simpler approach: use regex to extract values
        # Format: ('1', 'brand', 'name', 'name_en', 'cat', 'cat_en', price, orig_price, 'unit', 'from', 'to', bool, 'url')
        val_pattern = r"'((?:[^']|'')*)'|NULL|(\d+\.?\d*)|true|false"
        val_matches = re.findall(val_pattern, match)

        # Even simpler: split by comma but respect quotes
        parts = []
        temp = ""
        depth = 0
        for ch in match + ",":
            if ch == "'" :
                depth = 1 - depth
            if ch == "," and depth == 0:
                parts.append(temp.strip())
                temp = ""
            else:
                temp += ch

        if len(parts) < 13:
            continue

        def clean_val(v):
            v = v.strip()
            if v == "NULL":
                return None
            if v in ("true", "false"):
                return v == "true"
            if v.startswith("'") and v.endswith("'"):
                return v[1:-1].replace("''", "'")
            try:
                return float(v)
            except:
                return v

        vals = [clean_val(p) for p in parts]

        if len(vals) >= 13:
            row = {
                "store_id": vals[0],
                "brand": vals[1] or "Eigenmarke",
                "product_name": vals[2],
                "product_name_en": vals[3] or vals[2],
                "category": vals[4] or "Sonstiges",
                "category_en": vals[5] or "Other",
                "price": float(vals[6]) if vals[6] is not None else None,
                "original_price": float(vals[7]) if vals[7] is not None else None,
                "unit": vals[8] or "Stück",
                "valid_from": vals[9],
                "valid_to": vals[10],
                "is_offer": vals[11] if isinstance(vals[11], bool) else True,
                "source_url": SOURCE_URLS.get(expected_store_id, vals[12]),
            }

            # Validate
            if row["price"] and row["price"] > 0 and row["product_name"]:
                rows.append(row)

    return rows


def upload_store(filename, store_id, store_name):
    """Upload one store's data to Supabase."""
    filepath = os.path.join(PROSPECT_DIR, filename)

    if not os.path.exists(filepath):
        print(f"  FILE NOT FOUND: {filepath}")
        return 0

    print(f"\n{'='*50}")
    print(f"  {store_name} (store_id={store_id})")
    print(f"  File: {filename}")
    print(f"{'='*50}")

    # Parse SQL
    rows = parse_sql_inserts(filepath, store_id)
    print(f"  Parsed: {len(rows)} valid offers")

    if len(rows) < 5:
        print(f"  ERROR: Only {len(rows)} rows — too few, skipping!")
        return 0

    # Delete ALL old data for this store (both offers and estimates)
    print(f"  Deleting ALL old data for store_id={store_id}...")
    sb.table("offers").delete().eq("store_id", store_id).execute()

    # Insert in batches of 50
    inserted = 0
    for i in range(0, len(rows), 50):
        batch = rows[i:i+50]
        try:
            result = sb.table("offers").insert(batch).execute()
            inserted += len(result.data)
            print(f"  Batch {i//50 + 1}: inserted {len(result.data)} rows")
        except Exception as e:
            print(f"  ERROR batch {i//50 + 1}: {e}")
            # Try one by one to find the problem row
            for j, row in enumerate(batch):
                try:
                    sb.table("offers").insert(row).execute()
                    inserted += 1
                except Exception as e2:
                    print(f"  SKIP row {i+j}: {row['product_name'][:40]} — {e2}")

    print(f"  SUCCESS: {inserted}/{len(rows)} offers uploaded for {store_name}")
    return inserted


def verify_upload():
    """Verify final state of all offers in Supabase."""
    print(f"\n{'='*50}")
    print("VERIFICATION — Final State in Supabase")
    print(f"{'='*50}")

    stores = {"1": "Lidl", "2": "Aldi Süd", "3": "Penny", "4": "Kaufland", "5": "Netto"}
    total = 0

    for sid, name in stores.items():
        result = sb.table("offers").select("id, is_offer, valid_from, valid_to, source_url").eq("store_id", sid).execute()
        count = len(result.data)
        total += count

        offers = sum(1 for r in result.data if r["is_offer"])
        regular = count - offers

        # Check dates
        dates = set()
        for r in result.data:
            if r.get("valid_from"):
                dates.add(r["valid_from"])
            if r.get("valid_to"):
                dates.add(r["valid_to"])

        # Check source_url
        urls = set(r.get("source_url", "") for r in result.data)

        print(f"\n  {name} (store_id={sid}):")
        print(f"    Total: {count} ({offers} offers + {regular} permanent)")
        print(f"    Dates: {sorted(dates)}")
        print(f"    Source URLs: {urls}")

    print(f"\n  GRAND TOTAL: {total} products across all stores")


def main():
    print("=" * 50)
    print("PAPIERBOX — UPLOAD ALL PROSPEKT DATA")
    print("=" * 50)

    total_uploaded = 0

    for filename, store_id, store_name in FILES:
        try:
            count = upload_store(filename, store_id, store_name)
            total_uploaded += count
        except Exception as e:
            print(f"  CRITICAL ERROR for {store_name}: {e}")

    print(f"\n{'='*50}")
    print(f"UPLOAD COMPLETE: {total_uploaded} total offers uploaded")
    print(f"{'='*50}")

    # Verify
    verify_upload()


if __name__ == "__main__":
    main()
