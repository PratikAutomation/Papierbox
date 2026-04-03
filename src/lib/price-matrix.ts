import { Offer, StoreRanking, StoreItemDetail, ParsedItem } from './types';
import { PriceEstimate } from './claude-normalize';

const STORE_COLORS: Record<string, string> = {
  '1': '#0050AA',  // Lidl
  '2': '#00005F',  // Aldi Sud
  '3': '#CD1719',  // Penny
  '4': '#E10915',  // Kaufland
  '5': '#FFE600',  // Netto
};

const STORE_NAMES: Record<string, string> = {
  '1': 'Lidl',
  '2': 'Aldi Sud',
  '3': 'Penny',
  '4': 'Kaufland',
  '5': 'Netto',
};

const STORE_IDS = ['1', '2', '3', '4', '5'];

interface MatchedItem {
  parsed: ParsedItem;
  offersByStore: Record<string, Offer | null>;
}

interface PriceCell {
  price: number;
  original_price: number | null;
  unit: string;
  type: 'offer' | 'estimate';
  valid_to: string | null;
  product_name: string;
  product_name_de: string;
}

export function buildPriceMatrix(
  parsedItems: ParsedItem[],
  matchedItems: MatchedItem[],
  estimates: PriceEstimate[]
): StoreRanking[] {
  const matrix: Record<string, Record<string, PriceCell>> = {};

  for (let i = 0; i < parsedItems.length; i++) {
    const itemKey = `item_${i}`;
    const parsed = parsedItems[i];
    const matched = matchedItems[i];
    matrix[itemKey] = {};

    for (const storeId of STORE_IDS) {
      const offer = matched?.offersByStore[storeId] || null;

      if (offer) {
        matrix[itemKey][storeId] = {
          price: offer.price,
          original_price: offer.originalPrice,
          unit: offer.unit || 'Stk',
          type: 'offer',
          valid_to: offer.validTo,
          product_name: offer.productNameEn || offer.productName,
          product_name_de: offer.productName,
        };
      } else {
        const estimate = estimates.find(
          e => e.product.toLowerCase() === parsed.normalized_de.toLowerCase() ||
               e.product.toLowerCase() === parsed.normalized_en.toLowerCase()
        );

        if (estimate && estimate.prices[storeId]) {
          matrix[itemKey][storeId] = {
            price: estimate.prices[storeId],
            original_price: null,
            unit: estimate.unit,
            type: 'estimate',
            valid_to: null,
            product_name: parsed.normalized_en || parsed.normalized_de,
            product_name_de: parsed.normalized_de,
          };
        } else {
          const otherPrices = Object.values(estimate?.prices || {}).filter(p => p > 0);
          const avgPrice = otherPrices.length > 0
            ? Math.round(otherPrices.reduce((a, b) => a + b, 0) / otherPrices.length * 100) / 100
            : 1.99;

          matrix[itemKey][storeId] = {
            price: avgPrice,
            original_price: null,
            unit: estimate?.unit || 'Stk',
            type: 'estimate',
            valid_to: null,
            product_name: parsed.normalized_en || parsed.normalized_de,
            product_name_de: parsed.normalized_de,
          };
        }
      }
    }
  }

  const rankings: StoreRanking[] = STORE_IDS.map(storeId => {
    let totalCost = 0;
    let offerCount = 0;
    const items: StoreItemDetail[] = [];

    for (let i = 0; i < parsedItems.length; i++) {
      const itemKey = `item_${i}`;
      const cell = matrix[itemKey][storeId];
      const qty = parsedItems[i].qty || 1;
      const itemCost = cell.price * qty;
      totalCost += itemCost;

      if (cell.type === 'offer') offerCount++;

      const savings = cell.original_price ? Math.round((cell.original_price - cell.price) * qty * 100) / 100 : null;

      items.push({
        name: cell.product_name,
        name_de: cell.product_name_de,
        price: cell.price,
        original_price: cell.original_price,
        unit: cell.unit,
        type: cell.type,
        qty,
        valid_to: cell.valid_to,
        savings,
      });
    }

    totalCost = Math.round(totalCost * 100) / 100;

    return {
      store_id: storeId,
      store_name: STORE_NAMES[storeId] || `Store ${storeId}`,
      store_brand_color: STORE_COLORS[storeId] || '#9CA3AF',
      total_cost: totalCost,
      offer_count: offerCount,
      items,
    };
  });

  rankings.sort((a, b) => {
    const aOfferRatio = a.offer_count / parsedItems.length;
    const bOfferRatio = b.offer_count / parsedItems.length;
    const aScore = a.total_cost * (1 + (1 - aOfferRatio) * 0.15);
    const bScore = b.total_cost * (1 + (1 - bOfferRatio) * 0.15);

    if (Math.abs(aScore - bScore) < 0.50) {
      return b.offer_count - a.offer_count;
    }
    return aScore - bScore;
  });

  return rankings;
}
