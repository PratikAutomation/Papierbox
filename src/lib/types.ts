export interface Store {
  id: string;
  name: string;
  slug: string;
  brandColor: string;
  offersUrl?: string;
}

export interface Offer {
  id: string;
  storeId: string;
  storeName: string;
  storeBrandColor: string;
  brand: string;
  productName: string;
  productNameEn: string;
  category: string;
  categoryEn: string;
  price: number;
  originalPrice: number | null;
  unit: string;
  validFrom: string;
  validTo: string;
  isOffer: boolean;
  sourceUrl: string;
  similarityScore?: number;
}

export interface SearchResult {
  product: string;
  city: string;
  offers: Offer[];
  regularPrices: Offer[];
  bestPrice: number | null;
  worstPrice: number | null;
  savingsAmount: number | null;
  totalOffers: number;
  totalRegular: number;
  isSuggestion?: boolean;
}

export interface City {
  id: string;
  name: string;
  slug: string;
  state: string;
}

export interface ParsedItem {
  original: string;
  normalized_de: string;
  normalized_en: string;
  brand: string | null;
  category_de: string;
  category_en: string;
  exclude: string[];
  qty: number;
}

export interface StoreItemDetail {
  name: string;
  name_de: string;
  price: number;
  original_price: number | null;
  unit: string;
  type: 'offer' | 'verified' | 'estimate';
  qty: number;
  valid_to: string | null;
  savings: number | null;
}

export interface StoreRanking {
  store_id: string;
  store_name: string;
  store_brand_color: string;
  total_cost: number;
  offer_count: number;
  items: StoreItemDetail[];
}

export interface CompareResult {
  parsed_items: ParsedItem[];
  store_rankings: StoreRanking[];
  recommended_store_id: string;
  recommended_store_name: string;
  total_items: number;
  savings_vs_worst: number;
}
