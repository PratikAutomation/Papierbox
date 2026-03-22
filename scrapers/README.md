# German Supermarket Scrapers

This directory contains web scrapers for fetching weekly grocery offers from German supermarkets.

## Setup

1. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

2. **Verify configuration:**
   Check `config.py` for supermarket URLs and settings.

## Usage

### Run all scrapers:
```bash
python run_all.py
```

This will:
- Scrape all configured supermarkets
- Save combined results to `../data/offers.json`
- Log progress and errors to console

### Run a single scraper (for testing):
```bash
python lidl_scraper.py
```

## Adding a New Supermarket

1. Create a new file `{supermarket}_scraper.py` (e.g., `aldi_scraper.py`)
2. Import and inherit from `BaseScraper`
3. Implement the `parse_offers(self, html)` method
4. Add the scraper configuration to `config.py` in `SUPERMARKETS` list
5. Import and add the scraper class to `run_all.py`

Example template:
```python
from base_scraper import BaseScraper

class AldiScraper(BaseScraper):
    def parse_offers(self, html):
        soup = BeautifulSoup(html, 'lxml')
        offers = []

        # TODO: Implement parsing logic
        # for item in soup.select('CSS_SELECTOR'):
        #     offers.append({
        #         'product_name': ...,
        #         'price': ...,
        #         'original_price': ...,
        #         'unit': ...,
        #         'valid_from': ...,
        #         'valid_to': ...,
        #         'store_slug': self.config['slug']
        #     })

        return offers
```

## Rate Limiting

All scrapers respect a 3-second delay between requests to the same domain. This is configured in `config.py` and enforced by the `BaseScraper` class.

## Robots.txt Compliance

Before scraping, each scraper checks the target site's `robots.txt` to ensure compliance with their crawling policies.

## Error Handling

- Failed requests retry up to 3 times with exponential backoff
- If one scraper fails, others continue running
- All errors are logged with details

## Output Format

Each offer contains:
- `product_name` - Normalized product name
- `price` - Current price (float)
- `original_price` - Original price if discounted (float or null)
- `unit` - Unit of measure (e.g., "kg", "piece", "l")
- `valid_from` - Start date of offer (ISO format)
- `valid_to` - End date of offer (ISO format)
- `store_slug` - Store identifier (e.g., "lidl", "aldi-sued")

## Notes

- CSS selectors must be updated after inspecting actual supermarket websites
- Some sites may require JavaScript rendering (consider Selenium/Playwright if needed)
- Always respect rate limits and terms of service
