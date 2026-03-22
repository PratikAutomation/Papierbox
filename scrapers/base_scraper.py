"""
Base scraper class for all supermarket scrapers.

All supermarket-specific scrapers should inherit from BaseScraper
and implement the parse_offers() method.
"""

import logging
import time
from abc import ABC, abstractmethod
from typing import List, Dict, Optional
from urllib.parse import urlparse, urljoin
from urllib.robotparser import RobotFileParser

import requests
from bs4 import BeautifulSoup

import config


class BaseScraper(ABC):
    """Abstract base class for supermarket scrapers."""

    def __init__(self, store_config: Dict):
        """
        Initialize the scraper.

        Args:
            store_config: Dictionary containing store configuration
                         (name, slug, brand_color, offers_page_url)
        """
        self.config = store_config
        self.logger = logging.getLogger(f"{self.__class__.__name__}")

        # Set up session with headers
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': config.USER_AGENT,
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Accept-Language': 'de-DE,de;q=0.9,en;q=0.8',
            'Accept-Encoding': 'gzip, deflate, br',
            'DNT': '1',
            'Connection': 'keep-alive',
            'Upgrade-Insecure-Requests': '1'
        })

        # Rate limiting
        self.last_request_time = 0
        self.rate_limit = config.RATE_LIMIT_SECONDS

        # Robots.txt parser
        self.robots_parser = None
        self._init_robots_parser()

    def _init_robots_parser(self):
        """Initialize robots.txt parser for the target domain."""
        try:
            url = self.config['offers_page_url']
            parsed_url = urlparse(url)
            robots_url = f"{parsed_url.scheme}://{parsed_url.netloc}/robots.txt"

            self.robots_parser = RobotFileParser()
            self.robots_parser.set_url(robots_url)
            self.robots_parser.read()

            self.logger.info(f"Loaded robots.txt from {robots_url}")
        except Exception as e:
            self.logger.warning(f"Could not load robots.txt: {e}")
            self.robots_parser = None

    def _can_fetch(self, url: str) -> bool:
        """
        Check if we're allowed to fetch the URL according to robots.txt.

        Args:
            url: URL to check

        Returns:
            True if allowed to fetch, False otherwise
        """
        if self.robots_parser is None:
            # If we couldn't load robots.txt, proceed cautiously
            return True

        try:
            can_fetch = self.robots_parser.can_fetch(config.USER_AGENT, url)
            if not can_fetch:
                self.logger.warning(f"robots.txt disallows fetching: {url}")
            return can_fetch
        except Exception as e:
            self.logger.warning(f"Error checking robots.txt: {e}")
            return True

    def _rate_limit(self):
        """Enforce rate limiting between requests."""
        elapsed = time.time() - self.last_request_time
        if elapsed < self.rate_limit:
            sleep_time = self.rate_limit - elapsed
            self.logger.debug(f"Rate limiting: sleeping for {sleep_time:.2f}s")
            time.sleep(sleep_time)
        self.last_request_time = time.time()

    def fetch_page(self, url: str) -> Optional[str]:
        """
        Fetch a URL with rate limiting, retries, and error handling.

        Args:
            url: URL to fetch

        Returns:
            HTML content as string, or None if fetch failed
        """
        # Check robots.txt
        if not self._can_fetch(url):
            self.logger.error(f"Blocked by robots.txt: {url}")
            return None

        retries = 0
        while retries < config.MAX_RETRIES:
            try:
                # Rate limit
                self._rate_limit()

                # Make request
                self.logger.info(f"Fetching: {url} (attempt {retries + 1}/{config.MAX_RETRIES})")
                response = self.session.get(
                    url,
                    timeout=config.REQUEST_TIMEOUT,
                    allow_redirects=True
                )

                # Check response status
                response.raise_for_status()

                self.logger.info(f"Successfully fetched {url} ({len(response.content)} bytes)")
                return response.text

            except requests.exceptions.HTTPError as e:
                self.logger.error(f"HTTP error fetching {url}: {e}")
                if response.status_code in [404, 403, 401]:
                    # Don't retry on client errors
                    return None
                retries += 1

            except requests.exceptions.RequestException as e:
                self.logger.error(f"Request error fetching {url}: {e}")
                retries += 1

            except Exception as e:
                self.logger.error(f"Unexpected error fetching {url}: {e}")
                retries += 1

            # Exponential backoff
            if retries < config.MAX_RETRIES:
                delay = config.RETRY_DELAY * (2 ** (retries - 1))
                self.logger.info(f"Retrying in {delay}s...")
                time.sleep(delay)

        self.logger.error(f"Failed to fetch {url} after {config.MAX_RETRIES} attempts")
        return None

    @abstractmethod
    def parse_offers(self, html: str) -> List[Dict]:
        """
        Parse offers from HTML content.

        This method must be implemented by each supermarket-specific scraper.

        Args:
            html: HTML content to parse

        Returns:
            List of offer dictionaries, each containing:
            - product_name: str
            - price: float
            - original_price: float or None
            - unit: str
            - valid_from: str (ISO date format)
            - valid_to: str (ISO date format)
            - store_slug: str
        """
        pass

    def normalize_product(self, name: str) -> str:
        """
        Normalize product names for consistency.

        Args:
            name: Raw product name

        Returns:
            Normalized product name
        """
        if not name:
            return ""

        # Strip whitespace
        normalized = name.strip()

        # Remove extra spaces
        normalized = ' '.join(normalized.split())

        # Convert to lowercase for consistency
        normalized = normalized.lower()

        return normalized

    def run(self) -> List[Dict]:
        """
        Orchestrate the scraping process.

        Returns:
            List of offer dictionaries
        """
        self.logger.info(f"Starting scraper for {self.config['name']}")

        try:
            # Fetch page
            html = self.fetch_page(self.config['offers_page_url'])
            if html is None:
                self.logger.error(f"Failed to fetch offers page for {self.config['name']}")
                return []

            # Parse offers
            offers = self.parse_offers(html)

            # Normalize product names
            for offer in offers:
                if 'product_name' in offer:
                    offer['product_name'] = self.normalize_product(offer['product_name'])

            self.logger.info(f"Successfully scraped {len(offers)} offers from {self.config['name']}")
            return offers

        except Exception as e:
            self.logger.error(f"Error running scraper for {self.config['name']}: {e}", exc_info=True)
            return []
