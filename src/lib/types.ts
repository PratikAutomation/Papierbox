export interface Store {
  id: string;
  name: string;
  slug: string;
  brandColor: string;
  websiteUrl: string;
}

export interface City {
  id: string;
  name: string;
  slug: string;
  state: string;
}

export interface Offer {
  id: string;
  storeId: string;
  storeName: string;
  storeBrandColor: string;
  productName: string;
  productNameEn: string;
  price: number;
  originalPrice: number | null;
  unit: string;
  validFrom: string;
  validTo: string;
  sourceUrl: string;
}

export interface SearchResult {
  product: string;
  city: string;
  offers: Offer[];
  bestPrice: number | null;
  worstPrice: number | null;
  savingsAmount: number | null;
  totalOffers: number;
  isSuggestion?: boolean;
}
