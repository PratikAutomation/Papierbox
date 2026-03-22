"""
Configuration for German supermarket scrapers.

This module defines all supermarkets, rate limiting settings, and output formats.
"""

# Supermarket definitions
SUPERMARKETS = [
    {
        'name': 'Lidl',
        'slug': 'lidl',
        'brand_color': '#0050AA',
        'offers_page_url': 'https://www.lidl.de/angebote'
    },
    {
        'name': 'Aldi Süd',
        'slug': 'aldi-sued',
        'brand_color': '#00A0E3',
        'offers_page_url': 'https://www.aldi-sued.de/angebote.html'
    },
    {
        'name': 'Penny',
        'slug': 'penny',
        'brand_color': '#E30613',
        'offers_page_url': 'https://www.penny.de/angebote'
    },
    {
        'name': 'Kaufland',
        'slug': 'kaufland',
        'brand_color': '#ED0000',
        'offers_page_url': 'https://www.kaufland.de/angebote.html'
    },
    {
        'name': 'Netto',
        'slug': 'netto',
        'brand_color': '#FFED00',
        'offers_page_url': 'https://www.netto-online.de/angebote'
    },
    {
        'name': 'REWE',
        'slug': 'rewe',
        'brand_color': '#CC071E',
        'offers_page_url': 'https://www.rewe.de/angebote/'
    }
]

# Rate limiting settings
RATE_LIMIT_SECONDS = 3  # Seconds between requests to the same domain
MAX_RETRIES = 3  # Maximum number of retry attempts for failed requests
RETRY_DELAY = 2  # Initial delay in seconds before retry (exponential backoff)

# User agent string (mimic a real browser)
USER_AGENT = (
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
    '(KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36'
)

# Request timeout in seconds
REQUEST_TIMEOUT = 30

# Output format definition
OUTPUT_SCHEMA = {
    'product_name': 'string',      # Normalized product name
    'price': 'float',              # Current price in EUR
    'original_price': 'float|null', # Original price if discounted
    'unit': 'string',              # Unit of measure (kg, piece, l, etc.)
    'valid_from': 'string',        # ISO date format (YYYY-MM-DD)
    'valid_to': 'string',          # ISO date format (YYYY-MM-DD)
    'store_slug': 'string'         # Store identifier
}

# Logging configuration
LOG_FORMAT = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
LOG_LEVEL = 'INFO'
