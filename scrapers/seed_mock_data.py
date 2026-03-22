#!/usr/bin/env python3
"""
Seed script to insert mock data offers into Supabase.
Reads from src/lib/mock-data.ts and inserts into the offers table.
Uses requests library (no supabase-py dependency needed).
"""

import os
import re
import json

# Try to import dotenv, if not available read .env manually
try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    # Manually load .env file
    env_path = os.path.join(os.path.dirname(__file__), '.env')
    if os.path.exists(env_path):
        with open(env_path, 'r') as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#') and '=' in line:
                    key, value = line.split('=', 1)
                    os.environ[key.strip()] = value.strip()

# Try to import requests
try:
    import requests
except ImportError:
    print("ERROR: requests library not found")
    print("Please install with: python3 -m pip install --user requests")
    exit(1)

SUPABASE_URL = os.getenv('SUPABASE_URL')
SUPABASE_SERVICE_KEY = os.getenv('SUPABASE_SERVICE_KEY')

if not SUPABASE_URL or not SUPABASE_SERVICE_KEY:
    print("ERROR: SUPABASE_URL or SUPABASE_SERVICE_KEY not found in .env file")
    exit(1)

# Store ID mapping: mock data IDs to Supabase store IDs
# The store_id in Supabase is the numeric ID, not the slug
STORE_ID_MAP = {
    '1': '1',  # Lidl
    '2': '2',  # Aldi Süd
    '3': '3',  # Penny
    '4': '4',  # Kaufland
    '5': '5',  # Netto
    '6': '6'   # Rewe - Will be skipped
}

def infer_category_and_brand(product_name: str, product_name_en: str):
    """
    Infer category and brand from product name.
    Returns tuple of (brand, category, category_en)
    """
    product_lower = product_name.lower()
    product_en_lower = product_name_en.lower()

    # Category mapping based on product names
    category_map = {
        # Fruits & Vegetables
        'avocado': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'bananen': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'banana': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'tomaten': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'tomato': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'gurke': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'cucumber': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'paprika': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'pepper': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'zwiebel': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'onion': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'kartoffel': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'potato': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'apfel': ('Obst & Gemüse', 'Fruits & Vegetables'),
        'apple': ('Obst & Gemüse', 'Fruits & Vegetables'),

        # Meat & Poultry
        'hähnchen': ('Fleisch & Geflügel', 'Meat & Poultry'),
        'chicken': ('Fleisch & Geflügel', 'Meat & Poultry'),
        'rind': ('Fleisch & Geflügel', 'Meat & Poultry'),
        'beef': ('Fleisch & Geflügel', 'Meat & Poultry'),
        'schwein': ('Fleisch & Geflügel', 'Meat & Poultry'),
        'pork': ('Fleisch & Geflügel', 'Meat & Poultry'),

        # Fish & Seafood
        'lachs': ('Fisch & Meeresfrüchte', 'Fish & Seafood'),
        'salmon': ('Fisch & Meeresfrüchte', 'Fish & Seafood'),
        'thunfisch': ('Fisch & Meeresfrüchte', 'Fish & Seafood'),
        'tuna': ('Fisch & Meeresfrüchte', 'Fish & Seafood'),

        # Dairy
        'butter': ('Molkereiprodukte', 'Dairy'),
        'milch': ('Molkereiprodukte', 'Dairy'),
        'milk': ('Molkereiprodukte', 'Dairy'),
        'käse': ('Molkereiprodukte', 'Dairy'),
        'cheese': ('Molkereiprodukte', 'Dairy'),
        'joghurt': ('Molkereiprodukte', 'Dairy'),
        'yogurt': ('Molkereiprodukte', 'Dairy'),
        'quark': ('Molkereiprodukte', 'Dairy'),

        # Oils & Condiments
        'olivenöl': ('Öle & Gewürze', 'Oils & Condiments'),
        'olive oil': ('Öle & Gewürze', 'Oils & Condiments'),
        'öl': ('Öle & Gewürze', 'Oils & Condiments'),
        'oil': ('Öle & Gewürze', 'Oils & Condiments'),

        # Bread & Bakery
        'brot': ('Backwaren', 'Bread & Bakery'),
        'bread': ('Backwaren', 'Bread & Bakery'),
        'brötchen': ('Backwaren', 'Bread & Bakery'),
        'roll': ('Backwaren', 'Bread & Bakery'),

        # Beverages
        'saft': ('Getränke', 'Beverages'),
        'juice': ('Getränke', 'Beverages'),
        'wasser': ('Getränke', 'Beverages'),
        'water': ('Getränke', 'Beverages'),
        'cola': ('Getränke', 'Beverages'),
        'limonade': ('Getränke', 'Beverages'),

        # Pasta & Rice
        'nudeln': ('Nudeln & Reis', 'Pasta & Rice'),
        'pasta': ('Nudeln & Reis', 'Pasta & Rice'),
        'reis': ('Nudeln & Reis', 'Pasta & Rice'),
        'rice': ('Nudeln & Reis', 'Pasta & Rice'),

        # Snacks & Sweets
        'schokolade': ('Süßigkeiten & Snacks', 'Snacks & Sweets'),
        'chocolate': ('Süßigkeiten & Snacks', 'Snacks & Sweets'),
        'chips': ('Süßigkeiten & Snacks', 'Snacks & Sweets'),
        'keks': ('Süßigkeiten & Snacks', 'Snacks & Sweets'),
        'cookie': ('Süßigkeiten & Snacks', 'Snacks & Sweets'),
    }

    # Find category
    category = 'Sonstiges'
    category_en = 'Other'

    for keyword, (cat_de, cat_en) in category_map.items():
        if keyword in product_lower or keyword in product_en_lower:
            category = cat_de
            category_en = cat_en
            break

    # Infer brand (simplified - using "Eigenmarke" for most products)
    brand = 'Eigenmarke'  # Generic/Store brand

    # Check for specific brand indicators
    if 'bio' in product_lower or 'organic' in product_en_lower:
        brand = 'Bio'
    elif 'marken' in product_lower or 'deutsche' in product_lower:
        brand = 'Marke'

    return brand, category, category_en


def parse_mock_data_file(file_path: str):
    """
    Parse the TypeScript mock-data.ts file and extract offers.
    Returns a list of offer dictionaries.
    """
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Extract the offers array content
    offers_start = content.find('export const offers: Offer[] = [')
    if offers_start == -1:
        raise ValueError("Could not find offers array in mock-data.ts")

    # Use regex to extract individual offer objects
    # This regex matches the offer object pattern
    offer_pattern = r'\{[^}]*id:\s*[\'"](\d+)[\'"][^}]*storeId:\s*[\'"](\d+)[\'"][^}]*productName:\s*[\'"]([^\'"]*)[\'"][^}]*productNameEn:\s*[\'"]([^\'"]*)[\'"][^}]*price:\s*([\d.]+)[^}]*originalPrice:\s*(null|[\d.]+)[^}]*unit:\s*[\'"]([^\'"]*)[\'"][^}]*validFrom:\s*[\'"]([^\'"]*)[\'"][^}]*validTo:\s*[\'"]([^\'"]*)[\'"][^}]*sourceUrl:\s*[\'"]([^\'"]*)[\'"][^}]*\}'

    offers = []
    matches = re.finditer(offer_pattern, content, re.DOTALL)

    for match in matches:
        offer_id = match.group(1)
        store_id = match.group(2)
        product_name = match.group(3)
        product_name_en = match.group(4)
        price = float(match.group(5))
        original_price_str = match.group(6)
        original_price = None if original_price_str == 'null' else float(original_price_str)
        unit = match.group(7)
        valid_from = match.group(8)
        valid_to = match.group(9)
        source_url = match.group(10)

        # Skip Rewe (store_id = '6')
        if store_id == '6':
            continue

        # Map store_id to Supabase store_id
        supabase_store_id = STORE_ID_MAP.get(store_id)
        if not supabase_store_id:
            print(f"Warning: Unknown store_id {store_id}, skipping offer {offer_id}")
            continue

        # Infer category and brand
        brand, category, category_en = infer_category_and_brand(product_name, product_name_en)

        # Determine if this is an offer (has original_price or is clearly promotional)
        is_offer = original_price is not None

        offer = {
            'store_id': supabase_store_id,
            'brand': brand,
            'product_name': product_name,
            'product_name_en': product_name_en,
            'category': category,
            'category_en': category_en,
            'price': price,
            'original_price': original_price,
            'unit': unit,
            'valid_from': valid_from,
            'valid_to': valid_to,
            'is_offer': is_offer,
            'source_url': source_url
        }

        offers.append(offer)

    return offers


def insert_offers_via_rest(offers: list):
    """
    Insert offers into Supabase using REST API.
    """
    print(f"Preparing to insert {len(offers)} offers...")

    headers = {
        'apikey': SUPABASE_SERVICE_KEY,
        'Authorization': f'Bearer {SUPABASE_SERVICE_KEY}',
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
    }

    url = f'{SUPABASE_URL}/rest/v1/offers'

    # Insert in batches of 100
    batch_size = 100
    total_inserted = 0
    errors = []

    for i in range(0, len(offers), batch_size):
        batch = offers[i:i + batch_size]

        try:
            response = requests.post(url, headers=headers, json=batch)

            if response.status_code in [200, 201]:
                total_inserted += len(batch)
                print(f"✓ Inserted batch {i//batch_size + 1}: {len(batch)} offers (total: {total_inserted})")
            else:
                print(f"✗ Error inserting batch {i//batch_size + 1}: {response.status_code}")
                print(f"  Response: {response.text}")
                errors.append((i//batch_size + 1, response.text))

                # Try inserting one by one
                for j, offer in enumerate(batch):
                    try:
                        single_response = requests.post(url, headers=headers, json=[offer])
                        if single_response.status_code in [200, 201]:
                            total_inserted += 1
                        else:
                            print(f"  ✗ Failed to insert offer {offer.get('product_name')}: {single_response.text}")
                    except Exception as e:
                        print(f"  ✗ Exception inserting offer {offer.get('product_name')}: {e}")

        except Exception as e:
            print(f"✗ Exception inserting batch {i//batch_size + 1}: {e}")
            errors.append((i//batch_size + 1, str(e)))

    if errors:
        print(f"\n⚠ Encountered {len(errors)} batch errors")

    return total_inserted


def verify_count():
    """Verify the count of offers in Supabase."""
    headers = {
        'apikey': SUPABASE_SERVICE_KEY,
        'Authorization': f'Bearer {SUPABASE_SERVICE_KEY}',
        'Prefer': 'count=exact'
    }

    url = f'{SUPABASE_URL}/rest/v1/offers?select=id'

    try:
        response = requests.get(url, headers=headers)
        if response.status_code == 200:
            # The count is returned in the Content-Range header
            content_range = response.headers.get('Content-Range', '')
            if content_range:
                # Format: "0-N/TOTAL" or "*/TOTAL"
                if '/' in content_range:
                    total = content_range.split('/')[-1]
                    return int(total) if total.isdigit() else None
        return None
    except Exception as e:
        print(f"Error verifying count: {e}")
        return None


def main():
    print("=" * 60)
    print("Mock Data Seeding Script for Supabase")
    print("=" * 60)

    # Path to mock data file
    mock_data_path = '/mnt/c/petroject/Project_1/src/lib/mock-data.ts'

    print(f"\n1. Parsing mock data from: {mock_data_path}")
    try:
        offers = parse_mock_data_file(mock_data_path)
        print(f"   ✓ Parsed {len(offers)} offers (Rewe excluded)")
    except Exception as e:
        print(f"   ✗ Error parsing mock data: {e}")
        return

    if not offers:
        print("   ⚠ No offers found to insert")
        return

    print(f"\n2. Sample offer:")
    sample = offers[0]
    for key, value in sample.items():
        print(f"   {key}: {value}")

    print(f"\n3. Inserting offers into Supabase...")
    total_inserted = insert_offers_via_rest(offers)
    print(f"   ✓ Successfully inserted {total_inserted} offers")

    print(f"\n4. Verifying insertion...")
    total_count = verify_count()
    if total_count is not None:
        print(f"   ✓ Total offers in Supabase: {total_count}")
    else:
        print(f"   ⚠ Could not verify count")

    print("\n" + "=" * 60)
    print("Seeding completed!")
    print("=" * 60)


if __name__ == '__main__':
    main()
