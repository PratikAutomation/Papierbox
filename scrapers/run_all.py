"""
Main entry point for running all supermarket scrapers.

This script runs all configured scrapers sequentially, collects offers,
and outputs combined JSON results.
"""

import json
import logging
import os
import sys
from pathlib import Path
from typing import List, Dict

import config
from lidl_scraper import LidlScraper


# Map of store slugs to scraper classes
SCRAPERS = {
    'lidl': LidlScraper,
    # Add more scrapers as they are implemented:
    # 'aldi-sued': AldiSuedScraper,
    # 'penny': PennyScraper,
    # 'kaufland': KauflandScraper,
    # 'netto': NettoScraper,
    # 'rewe': ReweScraper,
}


def setup_logging():
    """Configure logging for the application."""
    logging.basicConfig(
        level=config.LOG_LEVEL,
        format=config.LOG_FORMAT,
        handlers=[
            logging.StreamHandler(sys.stdout)
        ]
    )


def run_scraper(store_config: Dict, scraper_class) -> List[Dict]:
    """
    Run a single scraper with error handling.

    Args:
        store_config: Store configuration dictionary
        scraper_class: Scraper class to instantiate

    Returns:
        List of offers (empty list if scraper failed)
    """
    logger = logging.getLogger('run_all')

    try:
        logger.info(f"Running scraper for {store_config['name']}...")
        scraper = scraper_class(store_config)
        offers = scraper.run()
        logger.info(f"Successfully scraped {len(offers)} offers from {store_config['name']}")
        return offers

    except Exception as e:
        logger.error(f"Failed to run scraper for {store_config['name']}: {e}", exc_info=True)
        return []


def save_offers(offers: List[Dict], output_path: str):
    """
    Save offers to JSON file.

    Args:
        offers: List of offer dictionaries
        output_path: Path to output JSON file
    """
    logger = logging.getLogger('run_all')

    try:
        # Ensure output directory exists
        output_dir = os.path.dirname(output_path)
        if output_dir:
            Path(output_dir).mkdir(parents=True, exist_ok=True)

        # Write JSON file
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(offers, f, indent=2, ensure_ascii=False)

        logger.info(f"Saved {len(offers)} offers to {output_path}")

    except Exception as e:
        logger.error(f"Failed to save offers to {output_path}: {e}", exc_info=True)


def main():
    """Main entry point."""
    setup_logging()
    logger = logging.getLogger('run_all')

    logger.info("="*60)
    logger.info("Starting German Supermarket Scrapers")
    logger.info("="*60)

    all_offers = []
    stores_scraped = 0
    stores_failed = 0

    # Run each configured scraper
    for store_config in config.SUPERMARKETS:
        store_slug = store_config['slug']

        # Check if scraper is implemented
        if store_slug not in SCRAPERS:
            logger.warning(f"Scraper not implemented for {store_config['name']} ({store_slug}), skipping...")
            continue

        # Run scraper
        scraper_class = SCRAPERS[store_slug]
        offers = run_scraper(store_config, scraper_class)

        if offers:
            all_offers.extend(offers)
            stores_scraped += 1
        else:
            stores_failed += 1

        logger.info("-" * 60)

    # Summary
    logger.info("="*60)
    logger.info("Scraping Complete")
    logger.info(f"Total offers scraped: {len(all_offers)}")
    logger.info(f"Stores successfully scraped: {stores_scraped}")
    logger.info(f"Stores failed: {stores_failed}")
    logger.info("="*60)

    # Save results
    if all_offers:
        # Determine output path
        script_dir = os.path.dirname(os.path.abspath(__file__))
        project_dir = os.path.dirname(script_dir)
        output_path = os.path.join(project_dir, 'data', 'offers.json')

        save_offers(all_offers, output_path)
        logger.info(f"\nResults saved to: {output_path}")

        # Also print to stdout for piping
        print(json.dumps(all_offers, indent=2, ensure_ascii=False))
    else:
        logger.warning("No offers scraped from any store")
        sys.exit(1)


if __name__ == '__main__':
    main()
