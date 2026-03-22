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
