"""
Configuration for German supermarket scrapers.

This module defines all supermarkets, rate limiting settings, and Claude API configuration.
"""

import os
from dotenv import load_dotenv

load_dotenv()

# API Keys
ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY", "")
SUPABASE_URL = os.getenv("SUPABASE_URL", "")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY", "")

# Claude API Configuration
CLAUDE_MODEL = "claude-haiku-4-5-20251001"
CLAUDE_FALLBACK_MODEL = "claude-sonnet-4-5-20241022"
MAX_TOKENS = 8192

# Rate limiting settings
RATE_LIMIT_SECONDS = 3  # Seconds between requests to the same domain
REQUEST_TIMEOUT = 30    # Request timeout in seconds

# Validation thresholds
MIN_OFFERS_PER_STORE = 5  # Minimum offers required to replace existing data
MAX_PRICE = 200           # Maximum valid price in EUR

# User agent rotation
USER_AGENTS = [
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
]

# Store definitions
STORES = [
    {
        "id": "1",
        "slug": "lidl",
        "name": "Lidl",
        "brand_color": "#0050AA",
        "offers_urls": [
            "https://www.lidl.de/c/billiger-montag/a10006065",
            "https://www.lidl.de/c/lidl-sagt-danke/a10006493",
        ],
    },
    {
        "id": "2",
        "slug": "aldi-sued",
        "name": "Aldi Süd",
        "brand_color": "#00005F",
        "offers_urls": [
            "https://www.aldi-sued.de/de/angebote.html",
        ],
    },
    {
        "id": "3",
        "slug": "penny",
        "name": "Penny",
        "brand_color": "#CD1719",
        "offers_urls": [
            "https://www.penny.de/angebote/aktuelle-angebote",
        ],
    },
    {
        "id": "4",
        "slug": "kaufland",
        "name": "Kaufland",
        "brand_color": "#E10915",
        "offers_urls": [
            "https://www.kaufland.de/angebote/aktuelle-woche.html",
        ],
    },
    {
        "id": "5",
        "slug": "netto",
        "name": "Netto",
        "brand_color": "#FFE600",
        "offers_urls": [
            "https://www.netto-online.de/angebote",
        ],
    },
]

# Claude extraction prompt
EXTRACTION_PROMPT = """You are a German grocery price extraction system.
You will receive HTML from a German supermarket's weekly offers page.

Extract EVERY product offer visible on the page.

Return a JSON array where each object has:
- brand: string — manufacturer/brand name (e.g., "Kerrygold", "JA!", "Barilla", "Milbona"). If store's own brand, use the brand name as displayed. If no brand visible, use "Eigenmarke".
- product_name: string — FULL product name as displayed, including brand
- product_name_en: string — English translation of the full product name
- category: string — generic product category in German (e.g., "Butter", "Milch", "Nudeln")
- category_en: string — generic category in English (e.g., "Butter", "Milk", "Pasta")
- price: number — current selling price in EUR (e.g., 1.79)
- original_price: number | null — old/crossed-out price if on sale, otherwise null
- unit: string — weight, volume, or count as displayed (e.g., "250g", "1L", "10er Pack")
- valid_from: string — offer start date in YYYY-MM-DD format
- valid_to: string — offer end date in YYYY-MM-DD format

Rules:
1. Extract ALL products with a visible price — food, drinks, household, everything
2. Prices must be numbers, not strings (1.79 not "1,79 EUR")
3. Convert German comma decimals to dots (1,79 -> 1.79)
4. If dates are not explicitly shown, use current week Monday to Sunday
5. Return ONLY the JSON array — no markdown, no explanation, no wrapping
6. If you cannot extract any offers, return an empty array []
7. Preserve exact brand names — "Kerrygold", not "Kerry Gold"
8. product_name must include the brand: "Kerrygold Irische Butter" not just "Irische Butter"
"""

# Logging configuration
LOG_FORMAT = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
LOG_LEVEL = 'INFO'
