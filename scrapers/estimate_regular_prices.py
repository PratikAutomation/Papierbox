#!/usr/bin/env python3
"""
Tier 2 Regular Price Estimation Script

Uses Claude API to generate typical German supermarket prices for ~200 common products.
These serve as fallback prices when no current offers are available.

Workflow:
1. Send prompt to Claude asking for typical regular prices (NOT sale prices)
2. Parse and validate JSON response
3. Delete old estimated prices from database
4. Insert new estimates with is_offer=false flag
5. Log results

Author: Papierbox Team
Created: 2026-03-22
"""

import json
import logging
import sys
from typing import List, Dict, Any, Optional
from datetime import datetime

import anthropic
from supabase import create_client, Client

from config import (
    ANTHROPIC_API_KEY,
    SUPABASE_URL,
    SUPABASE_SERVICE_KEY,
    CLAUDE_MODEL,
    STORES
)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Estimation prompt for Claude
ESTIMATION_PROMPT = """You are a German grocery pricing expert.
Based on your knowledge of current German supermarket prices (Lidl, Aldi, Penny, Kaufland, Netto),
provide typical regular prices (NOT sale prices) for common grocery products.

Return a JSON array where each object has:
- brand: string — a common brand sold in German discounters (e.g., "Kerrygold", "Barilla", "Milram", "JA!", "Gut & Günstig")
- product_name: string — full product name with brand (e.g., "Kerrygold Irische Butter")
- product_name_en: string — English translation
- category: string — generic category in German (e.g., "Butter", "Milch")
- category_en: string — English category (e.g., "Butter", "Milk")
- price: number — typical regular price in EUR
- unit: string — standard unit sold (e.g., "250g", "1L", "500g")

Include 200 products covering these categories:
- Dairy: milk, butter, cheese, yogurt, cream, mozzarella
- Meat & Fish: chicken, ground beef, salmon, tuna
- Produce: tomatoes, cucumbers, peppers, potatoes, onions, avocados, apples, bananas, oranges, lemons
- Bakery: bread, toast, rolls
- Pantry: pasta, rice, flour, sugar, oats, lentils, chickpeas, canned tomatoes
- Oils & Condiments: olive oil, sunflower oil, ketchup, mustard, mayo, soy sauce
- Beverages: water, juice, coffee, tea
- Frozen: pizza, vegetables, fish sticks
- Snacks: chocolate, chips, cookies, nutella
- Household: detergent, dish soap, toilet paper, paper towels, toothpaste, shampoo
- Baby & Kids: baby food, diapers (small selection)

Use realistic 2026 German discount supermarket pricing.
Include a mix of store brands (Eigenmarke) and name brands.
Return ONLY the JSON array — no markdown, no explanation."""


def get_supabase_client() -> Client:
    """Initialize and return Supabase client."""
    if not SUPABASE_URL or not SUPABASE_SERVICE_KEY:
        raise ValueError("Supabase credentials not configured")

    return create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)


def get_claude_client() -> anthropic.Anthropic:
    """Initialize and return Claude API client."""
    if not ANTHROPIC_API_KEY:
        raise ValueError("Anthropic API key not configured")

    return anthropic.Anthropic(api_key=ANTHROPIC_API_KEY)


def estimate_prices() -> List[Dict[str, Any]]:
    """
    Request price estimates from Claude API.

    Returns:
        List of product dictionaries with estimated prices

    Raises:
        Exception: If API call fails or response is invalid
    """
    client = get_claude_client()

    logger.info(f"Requesting price estimates from Claude ({CLAUDE_MODEL})...")

    try:
        response = client.messages.create(
            model=CLAUDE_MODEL,
            max_tokens=32768,
            messages=[{"role": "user", "content": ESTIMATION_PROMPT}]
        )

        # Extract text content
        response_text = response.content[0].text.strip()
        logger.debug(f"Received {len(response_text)} characters from Claude")

        # Handle potential markdown code block wrapping
        if response_text.startswith("```"):
            logger.debug("Removing markdown code block wrapper")
            lines = response_text.split("\n")
            # Remove first line (```json or ```) and last line (```)
            response_text = "\n".join(lines[1:-1]).strip()

        # Robust JSON repair for common Claude output issues
        import re
        # Remove trailing commas
        response_text = re.sub(r',\s*}', '}', response_text)
        response_text = re.sub(r',\s*\]', ']', response_text)
        # Remove single-line comments
        response_text = re.sub(r'//[^\n]*', '', response_text)
        # Fix single quotes to double quotes (but not inside strings)
        # Replace unescaped single quotes used as string delimiters
        response_text = response_text.replace("'", '"')

        # If JSON is truncated (hit max_tokens), try to close it
        if not response_text.rstrip().endswith(']'):
            logger.warning("JSON appears truncated, attempting to close array...")
            # Find last complete object
            last_brace = response_text.rfind('}')
            if last_brace > 0:
                response_text = response_text[:last_brace + 1] + ']'

        # Parse JSON
        try:
            products = json.loads(response_text)
        except json.JSONDecodeError as first_err:
            logger.warning(f"First parse attempt failed: {first_err}")
            # Last resort: extract all complete JSON objects
            pattern = r'\{[^{}]*\}'
            matches = re.findall(pattern, response_text)
            logger.info(f"Extracted {len(matches)} individual JSON objects")
            products = []
            for m in matches:
                try:
                    obj = json.loads(m)
                    if isinstance(obj, dict) and 'product_name' in obj:
                        products.append(obj)
                except json.JSONDecodeError:
                    continue
            if not products:
                raise first_err

        if not isinstance(products, list):
            raise ValueError("Expected JSON array, got: " + type(products).__name__)

        logger.info(f"Claude returned {len(products)} products")
        return products

    except anthropic.APIError as e:
        logger.error(f"Claude API error: {e}")
        raise
    except json.JSONDecodeError as e:
        logger.error(f"Failed to parse Claude response as JSON: {e}")
        logger.debug(f"Response text: {response_text[:500]}...")
        raise
    except Exception as e:
        logger.error(f"Unexpected error during estimation: {e}")
        raise


def validate_product(product: Dict[str, Any], index: int) -> Optional[Dict[str, Any]]:
    """
    Validate a single product entry.

    Args:
        product: Product dictionary to validate
        index: Index in the original list (for logging)

    Returns:
        Validated product dict or None if invalid
    """
    try:
        # Required fields
        if not product.get("product_name") or len(product["product_name"]) < 3:
            logger.debug(f"Product {index}: Invalid or missing product_name")
            return None

        # Price validation
        try:
            price = float(product.get("price", 0))
            if price <= 0 or price > 200:
                logger.debug(f"Product {index}: Invalid price {price}")
                return None
        except (ValueError, TypeError):
            logger.debug(f"Product {index}: Price not a valid number")
            return None

        # Optional but recommended fields - set defaults if missing
        validated = {
            "brand": product.get("brand", "Eigenmarke"),
            "product_name": product["product_name"],
            "product_name_en": product.get("product_name_en", product["product_name"]),
            "category": product.get("category", "Sonstiges"),
            "category_en": product.get("category_en", "Other"),
            "price": price,
            "unit": product.get("unit", "Stück"),
        }

        return validated

    except Exception as e:
        logger.debug(f"Product {index}: Validation error: {e}")
        return None


def validate_estimates(estimates: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    """
    Validate all product estimates.

    Args:
        estimates: List of product dictionaries from Claude

    Returns:
        List of validated products
    """
    logger.info("Validating product estimates...")

    valid_products = []
    for i, product in enumerate(estimates):
        validated = validate_product(product, i)
        if validated:
            valid_products.append(validated)

    logger.info(f"{len(valid_products)}/{len(estimates)} products passed validation")

    if len(valid_products) < 50:
        logger.warning(f"Only {len(valid_products)} valid products - expected ~200")

    return valid_products


def save_estimates(estimates: List[Dict[str, Any]]) -> int:
    """
    Delete old estimated prices and insert new ones into Supabase.

    Args:
        estimates: List of validated product estimates

    Returns:
        Number of rows inserted

    Raises:
        Exception: If database operations fail
    """
    sb = get_supabase_client()

    # Delete all existing estimated prices (is_offer = false)
    logger.info("Deleting old estimated prices...")
    try:
        delete_result = sb.table("offers").delete().eq("is_offer", False).execute()
        deleted_count = len(delete_result.data) if delete_result.data else 0
        logger.info(f"Deleted {deleted_count} old estimated prices")
    except Exception as e:
        logger.error(f"Failed to delete old estimates: {e}")
        raise

    # Prepare rows for insertion
    # Each estimate gets assigned to one store (rotating through stores for distribution)
    rows = []
    for idx, product in enumerate(estimates):
        store = STORES[idx % len(STORES)]

        row = {
            "store_id": store["id"],
            "brand": product["brand"],
            "product_name": product["product_name"],
            "product_name_en": product["product_name_en"],
            "category": product["category"],
            "category_en": product["category_en"],
            "price": product["price"],
            "original_price": None,
            "unit": product["unit"],
            "valid_from": None,
            "valid_to": None,
            "is_offer": False,
            "source_url": None,
        }
        rows.append(row)

    # Insert in batches of 50 to avoid hitting API limits
    logger.info(f"Inserting {len(rows)} estimated prices...")
    inserted_total = 0
    batch_size = 50

    for i in range(0, len(rows), batch_size):
        batch = rows[i:i + batch_size]
        batch_num = (i // batch_size) + 1
        total_batches = (len(rows) + batch_size - 1) // batch_size

        try:
            result = sb.table("offers").insert(batch).execute()
            inserted_count = len(result.data) if result.data else 0
            inserted_total += inserted_count
            logger.info(f"Batch {batch_num}/{total_batches}: Inserted {inserted_count} rows")
        except Exception as e:
            logger.error(f"Failed to insert batch {batch_num}: {e}")
            raise

    logger.info(f"Successfully inserted {inserted_total} estimated regular prices")
    return inserted_total


def log_to_scrape_logs(status: str, count: int, error_message: Optional[str] = None):
    """
    Log the estimation run to scrape_logs table.

    Args:
        status: 'success' or 'error'
        count: Number of estimates inserted
        error_message: Error message if status is 'error'
    """
    try:
        sb = get_supabase_client()
        log_entry = {
            "store_id": STORES[0]["id"],  # Use first store as log anchor
            "status": f"estimation_{status}",
            "offers_count": count,
            "error_message": error_message,
            "duration_ms": None,
        }
        sb.table("scrape_logs").insert(log_entry).execute()
        logger.debug("Logged estimation run to scrape_logs")
    except Exception as e:
        logger.warning(f"Failed to log to scrape_logs: {e}")


def main():
    """Main execution function."""
    start_time = datetime.now()

    logger.info("=" * 60)
    logger.info("Starting Tier 2 Regular Price Estimation")
    logger.info("=" * 60)

    # Verify configuration
    if not ANTHROPIC_API_KEY:
        logger.error("ANTHROPIC_API_KEY not set in environment")
        sys.exit(1)

    if not SUPABASE_URL or not SUPABASE_SERVICE_KEY:
        logger.error("Supabase credentials not set in environment")
        sys.exit(1)

    logger.info(f"Using Claude model: {CLAUDE_MODEL}")
    logger.info(f"Target stores: {', '.join(s['name'] for s in STORES)}")

    try:
        # Step 1: Get estimates from Claude
        raw_estimates = estimate_prices()

        # Step 2: Validate estimates
        valid_estimates = validate_estimates(raw_estimates)

        if not valid_estimates:
            logger.error("No valid estimates to insert")
            log_to_scrape_logs("error", 0, "No valid estimates after validation")
            sys.exit(1)

        # Step 3: Save to database
        inserted_count = save_estimates(valid_estimates)

        # Step 4: Log success
        log_to_scrape_logs("success", inserted_count)

        # Summary
        duration = (datetime.now() - start_time).total_seconds()
        logger.info("=" * 60)
        logger.info(f"Estimation completed successfully in {duration:.1f}s")
        logger.info(f"Total products inserted: {inserted_count}")
        logger.info(f"Products per store: ~{inserted_count // len(STORES)}")
        logger.info("=" * 60)

    except Exception as e:
        logger.error(f"Estimation failed: {e}", exc_info=True)
        log_to_scrape_logs("error", 0, str(e))
        sys.exit(1)


if __name__ == "__main__":
    main()
