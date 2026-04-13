"""Upload KW16 (Apr 13-18, 2026) offer files to Supabase."""
import os
import re
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

PROSPECT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "Prospect", "Prospects_bis_18.4")

SOURCE_URLS = {
    "1": "https://www.lidl.de/angebote",
    "2": "https://www.aldi-sued.de/de/angebote.html",
    "3": "https://www.penny.de/angebote",
    "5": "https://www.netto-online.de/angebote",
}

FILES = [
    ("lidl_offers_kw16_2026.sql", "1", "Lidl"),
    ("aldi_sued_offers.sql", "2", "Aldi Süd"),
    ("penny_offers.sql", "3", "Penny"),
    ("netto_offers_kw16_2026.sql", "5", "Netto"),
]


def parse_sql_inserts(filepath, expected_store_id):
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    rows = []
    # Split on INSERT rows — each data row starts with ('store_id',
    for line in content.split("\n"):
        line = line.strip()
        if not line.startswith(f"('{expected_store_id}'"):
            continue
        # Remove trailing comma/semicolon
        line = line.rstrip(",;").rstrip()
        # Ensure it's wrapped in outer parens
        if not (line.startswith("(") and line.endswith(")")):
            continue
        # Remove outer parens
        inner = line[1:-1]

        # Parse comma-separated values respecting single-quoted strings
        parts = []
        temp = ""
        in_q = False
        i = 0
        while i < len(inner):
            ch = inner[i]
            if ch == "'" and not in_q:
                in_q = True
                temp += ch
            elif ch == "'" and in_q:
                # Check for escaped ''
                if i + 1 < len(inner) and inner[i+1] == "'":
                    temp += "''"
                    i += 2
                    continue
                in_q = False
                temp += ch
            elif ch == "," and not in_q:
                parts.append(temp.strip())
                temp = ""
            else:
                temp += ch
            i += 1
        parts.append(temp.strip())

        if len(parts) < 13:
            continue

        def cv(v):
            v = v.strip()
            if v.upper() == "NULL":
                return None
            if v in ("true", "false"):
                return v == "true"
            if v.startswith("'") and v.endswith("'"):
                return v[1:-1].replace("''", "'")
            try:
                return float(v)
            except:
                return v

        vals = [cv(p) for p in parts]
        row = {
            "store_id": vals[0],
            "brand": vals[1] if vals[1] else "",
            "product_name": vals[2],
            "product_name_en": vals[3] if vals[3] else vals[2],
            "category": vals[4] if vals[4] else "Sonstiges",
            "category_en": vals[5] if vals[5] else "Other",
            "price": float(vals[6]) if vals[6] is not None else None,
            "original_price": float(vals[7]) if vals[7] is not None else None,
            "unit": vals[8] if vals[8] else "Stück",
            "valid_from": vals[9],
            "valid_to": vals[10],
            "is_offer": vals[11] if isinstance(vals[11], bool) else True,
            "source_url": SOURCE_URLS.get(expected_store_id, ""),
        }
        if row["price"] and row["price"] > 0 and row["product_name"]:
            rows.append(row)

    return rows


def upload_store(filename, store_id, store_name):
    filepath = os.path.join(PROSPECT_DIR, filename)
    if not os.path.exists(filepath):
        print(f"  FILE NOT FOUND: {filepath}")
        return 0

    print(f"\n{'='*50}")
    print(f"  {store_name} (store_id={store_id})")
    print(f"{'='*50}")

    rows = parse_sql_inserts(filepath, store_id)
    print(f"  Parsed: {len(rows)} valid offers")

    if len(rows) < 5:
        print(f"  ERROR: Only {len(rows)} rows — too few, skipping!")
        return 0

    print(f"  Deleting old data for store_id={store_id}...")
    sb.table("offers").delete().eq("store_id", store_id).execute()
    sb.table("price_estimates").delete().eq("store_id", store_id).execute()

    inserted = 0
    for i in range(0, len(rows), 50):
        batch = rows[i:i+50]
        try:
            result = sb.table("offers").insert(batch).execute()
            inserted += len(result.data)
            print(f"  Batch {i//50 + 1}: inserted {len(result.data)} rows")
        except Exception as e:
            print(f"  ERROR batch {i//50 + 1}: {e}")
            for j, row in enumerate(batch):
                try:
                    sb.table("offers").insert(row).execute()
                    inserted += 1
                except Exception as e2:
                    print(f"  SKIP row {i+j}: {row.get('product_name','?')[:40]} — {e2}")

    print(f"  SUCCESS: {inserted}/{len(rows)} offers for {store_name}")
    return inserted


def verify():
    print(f"\n{'='*50}")
    print("FINAL VERIFICATION IN SUPABASE")
    print(f"{'='*50}")
    stores = {"1": "Lidl", "2": "Aldi Süd", "3": "Penny", "4": "Kaufland", "5": "Netto"}
    grand_total = 0
    for sid, name in stores.items():
        result = sb.table("offers").select("id, is_offer, valid_from, valid_to").eq("store_id", sid).execute()
        count = len(result.data)
        grand_total += count
        offers_count = sum(1 for r in result.data if r.get("is_offer"))
        dates = sorted(set(r.get("valid_from", "") for r in result.data if r.get("valid_from")))
        print(f"  {name}: {count} total ({offers_count} on sale) | dates: {dates[:3]}{'...' if len(dates) > 3 else ''}")
    print(f"\n  GRAND TOTAL: {grand_total} offers across all 5 stores")


if __name__ == "__main__":
    total = 0
    for filename, store_id, store_name in FILES:
        total += upload_store(filename, store_id, store_name)
    print(f"\n{'='*50}")
    print(f"UPLOAD DONE: {total} total offers")
    print(f"{'='*50}")
    verify()
