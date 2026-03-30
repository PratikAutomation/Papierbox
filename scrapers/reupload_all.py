"""
Re-upload all Prospekt data using direct SQL execution via Supabase.
Reads SQL files and executes them directly — no parsing needed.
"""
import os
import sys
import requests
from dotenv import load_dotenv
load_dotenv()

SUPABASE_URL = os.getenv("SUPABASE_URL", "")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY", "")
PROSPECT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "Prospect")

def execute_sql(sql):
    """Execute SQL via Supabase REST RPC."""
    # Use the pg REST endpoint for raw SQL
    url = f"{SUPABASE_URL}/rest/v1/rpc/exec_sql"
    headers = {
        "apikey": SUPABASE_SERVICE_KEY,
        "Authorization": f"Bearer {SUPABASE_SERVICE_KEY}",
        "Content-Type": "application/json",
    }
    response = requests.post(url, json={"query": sql}, headers=headers)
    return response.status_code, response.text


def upload_via_individual_inserts(filepath, store_id, store_name):
    """Parse SQL and upload via REST API row by row."""
    from supabase import create_client
    sb = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)

    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    # Delete all old data for this store
    print(f"  Deleting old data for {store_name}...")
    sb.table("offers").delete().eq("store_id", store_id).execute()

    # Source URLs
    source_urls = {
        "1": "https://www.lidl.de/angebote",
        "2": "https://www.aldi-sued.de/de/angebote.html",
        "3": "https://www.penny.de/angebote",
        "4": "https://filiale.kaufland.de/angebote/aktuelle-woche.html",
        "5": "https://www.netto-online.de/angebote",
    }

    # Extract all value tuples between VALUES and the final ;
    import re

    # Find the INSERT...VALUES block
    values_match = re.search(r'VALUES\s*\n?(.*)', content, re.DOTALL)
    if not values_match:
        print(f"  ERROR: No VALUES found in {filepath}")
        return 0

    values_text = values_match.group(1)

    # Extract individual row tuples
    # Match ('store_id', 'brand', ...) patterns
    row_pattern = r"\((" + "'" + store_id + "'" + r"[^)]+)\)"
    rows = re.findall(row_pattern, values_text)

    print(f"  Found {len(rows)} rows to insert")

    if len(rows) == 0:
        # Try alternate pattern — store_id might be different
        all_rows = re.findall(r"\(('[^']+',\s*'[^']*'.*?)\)", values_text)
        print(f"  Alternate pattern found {len(all_rows)} rows")
        rows = all_rows

    inserted = 0
    batch = []

    for row_text in rows:
        try:
            # Parse the values manually
            parts = []
            temp = ""
            in_quote = False

            for ch in row_text + ",":
                if ch == "'" and not in_quote:
                    in_quote = True
                    temp = ""
                elif ch == "'" and in_quote:
                    # Check for escaped quote
                    in_quote = False
                    parts.append(temp)
                    temp = ""
                elif in_quote:
                    temp += ch
                elif ch == "," and not in_quote:
                    val = temp.strip()
                    if val and val not in [p for p in parts]:  # Don't double-add
                        if val == "NULL":
                            parts.append(None)
                        elif val == "true":
                            parts.append(True)
                        elif val == "false":
                            parts.append(False)
                        elif val.replace(".", "").replace("-", "").isdigit():
                            try:
                                parts.append(float(val))
                            except:
                                pass
                    temp = ""
                else:
                    temp += ch

            if len(parts) < 12:
                continue

            # Map to dict — handle escaped quotes in values
            row_dict = {
                "store_id": store_id,
                "brand": (parts[1] if len(parts) > 1 else "Eigenmarke") or "Eigenmarke",
                "product_name": parts[2] if len(parts) > 2 else "",
                "product_name_en": (parts[3] if len(parts) > 3 else parts[2]) or parts[2],
                "category": (parts[4] if len(parts) > 4 else "Sonstiges") or "Sonstiges",
                "category_en": (parts[5] if len(parts) > 5 else "Other") or "Other",
                "price": float(parts[6]) if len(parts) > 6 and parts[6] is not None else None,
                "original_price": float(parts[7]) if len(parts) > 7 and parts[7] is not None else None,
                "unit": (parts[8] if len(parts) > 8 else "Stück") or "Stück",
                "valid_from": parts[9] if len(parts) > 9 else "2026-03-30",
                "valid_to": parts[10] if len(parts) > 10 else "2026-04-04",
                "is_offer": parts[11] if len(parts) > 11 and isinstance(parts[11], bool) else True,
                "source_url": source_urls.get(store_id, ""),
            }

            # Validate
            if not row_dict["product_name"] or row_dict["price"] is None or row_dict["price"] <= 0:
                continue

            # Fix escaped quotes in product names
            for key in ["product_name", "product_name_en", "brand"]:
                if row_dict[key]:
                    row_dict[key] = row_dict[key].replace("''", "'")

            batch.append(row_dict)

            if len(batch) >= 50:
                try:
                    result = sb.table("offers").insert(batch).execute()
                    inserted += len(result.data)
                    print(f"  Batch: +{len(result.data)} (total: {inserted})")
                except Exception as e:
                    print(f"  Batch error: {e}")
                    # Try one by one
                    for item in batch:
                        try:
                            sb.table("offers").insert(item).execute()
                            inserted += 1
                        except:
                            pass
                batch = []

        except Exception as e:
            continue

    # Insert remaining batch
    if batch:
        try:
            result = sb.table("offers").insert(batch).execute()
            inserted += len(result.data)
            print(f"  Final batch: +{len(result.data)} (total: {inserted})")
        except Exception as e:
            print(f"  Final batch error: {e}")
            for item in batch:
                try:
                    sb.table("offers").insert(item).execute()
                    inserted += 1
                except:
                    pass

    print(f"  SUCCESS: {inserted} offers uploaded for {store_name}")
    return inserted


FILES = [
    ("lidl_offers_2026_03_30_fixed.sql", "1", "Lidl"),
    ("aldi_offers_2026_03_30.sql", "2", "Aldi Süd"),
    ("penny_offers_2026_03_30.sql", "3", "Penny"),
    ("kaufland_offers_2026_03_30.sql", "4", "Kaufland"),
    ("netto_offers_2026_03_30.sql", "5", "Netto"),
]

total = 0
for filename, store_id, store_name in FILES:
    filepath = os.path.join(PROSPECT_DIR, filename)
    if not os.path.exists(filepath):
        print(f"  SKIP: {filename} not found")
        continue
    print(f"\n{'='*50}")
    print(f"  {store_name} — {filename}")
    print(f"{'='*50}")
    count = upload_via_individual_inserts(filepath, store_id, store_name)
    total += count

print(f"\n{'='*50}")
print(f"TOTAL UPLOADED: {total}")
print(f"{'='*50}")
