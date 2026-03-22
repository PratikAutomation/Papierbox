"use client";

import { useState, useEffect, useRef } from "react";
import { Offer, SearchResult } from "@/lib/types";
import Header from "@/components/Header";
import Footer from "@/components/Footer";

// ============================================================
// TRANSLATIONS
// ============================================================

type Lang = "en" | "de";

const t: Record<Lang, Record<string, string>> = {
  en: {
    headline: "Stop overpaying for groceries.",
    subtext: "Don't get fleeced on fruit. 🍎 We track the deals so you can keep the cash.",
    subtextHighlight: "Your wallet will thank you later.",
    searchPlaceholder: "Search any product...",
    imLookingFor: "I'm looking for...",
    cityPlaceholder: "Select your city",
    whereYouAt: "Where you at?",
    compareBtn: "Compare Prices",
    go: "GO!",
    searching: "Searching...",
    popular: "Popular:",
    trendingStickers: "Trending stickers:",
    findingPrices: "Finding the best prices...",
    noMatch: "No exact match for",
    bestDealsInstead: "here are today's best deals instead",
    todaysBestDeals: "Today's Best Deals",
    inCity: "in",
    offersFound: "offer|offers",
    typicalPricesFound: "typical price|typical prices",
    foundThisWeek: "found this week",
    found: "found",
    killerDeals: "killer deals found",
    isWinning: "is winning:",
    savingYou: "Saving you",
    perItem: "per snack!",
    bestPrice: "Best price:",
    at: "at",
    youSave: "you save",
    typicalPricesBelow: "Typical prices below",
    noOffers: "No offers found for",
    trySearching: "Try searching for: Butter, Milk, Eggs, or Avocado",
    goatDeal: "GOAT Deal",
    bestValue: "Best Value",
    typicalPrice: "TYPICAL PRICE",
    validUntil: "Valid until",
    till: "TILL",
    viewLeaflet: "View Leaflet",
    seeLeaflet: "SEE LEAFLET",
    openDeal: "OPEN DEAL",
    unit: "Unit:",
    estimated: "Estimated — actual price may vary",
    footerDesc: "Helping expats navigate German grocery prices. All offers are based on official weekly leaflets. Prices updated regularly.",
    platform: "Platform",
    about: "About",
    storePartners: "Store Partners",
    contact: "Contact",
    legal: "Legal",
    impressum: "Impressum",
    datenschutz: "Privacy Policy",
    copyright: "© 2026 Papierbox. Prices from public weekly offers.",
    region: "Region: Germany",
  },
  de: {
    headline: "Nie wieder zu viel für Lebensmittel zahlen.",
    subtext: "Lass dich nicht übers Ohr hauen. 🍎 Wir tracken die Deals, damit du das Geld behältst.",
    subtextHighlight: "Deine Geldbörse wird es dir danken.",
    searchPlaceholder: "Produkt suchen...",
    imLookingFor: "Ich suche nach...",
    cityPlaceholder: "Stadt wählen",
    whereYouAt: "Wo bist du?",
    compareBtn: "Preise vergleichen",
    go: "LOS!",
    searching: "Suche läuft...",
    popular: "Beliebt:",
    trendingStickers: "Beliebte Suchen:",
    findingPrices: "Beste Preise werden gesucht...",
    noMatch: "Kein Ergebnis für",
    bestDealsInstead: "hier sind die besten Angebote von heute",
    todaysBestDeals: "Beste Angebote heute",
    inCity: "in",
    offersFound: "Angebot|Angebote",
    typicalPricesFound: "Normalpreis|Normalpreise",
    foundThisWeek: "diese Woche gefunden",
    found: "gefunden",
    killerDeals: "Hammer-Angebote gefunden",
    isWinning: "gewinnt:",
    savingYou: "Du sparst",
    perItem: "pro Stück!",
    bestPrice: "Bester Preis:",
    at: "bei",
    youSave: "du sparst",
    typicalPricesBelow: "Normalpreise unten",
    noOffers: "Keine Angebote gefunden für",
    trySearching: "Versuche: Butter, Milch, Eier oder Avocado",
    goatDeal: "TOP Angebot",
    bestValue: "Bester Preis",
    typicalPrice: "NORMALPREIS",
    validUntil: "Gültig bis",
    till: "BIS",
    viewLeaflet: "Prospekt ansehen",
    seeLeaflet: "PROSPEKT",
    openDeal: "DEAL ÖFFNEN",
    unit: "Einheit:",
    estimated: "Schätzpreis — tatsächlicher Preis kann abweichen",
    footerDesc: "Wir helfen Expats, die besten Lebensmittelpreise in Deutschland zu finden. Alle Angebote basieren auf offiziellen Prospekten.",
    platform: "Plattform",
    about: "Über uns",
    storePartners: "Partnergeschäfte",
    contact: "Kontakt",
    legal: "Rechtliches",
    impressum: "Impressum",
    datenschutz: "Datenschutz",
    copyright: "© 2026 Papierbox. Preise aus öffentlichen Wochenangeboten.",
    region: "Region: Deutschland",
  },
};

function pluralize(template: string, count: number): string {
  const [singular, plural] = template.split("|");
  return count === 1 ? singular : plural;
}

const DAYS_EN = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
const DAYS_DE = ["SO", "MO", "DI", "MI", "DO", "FR", "SA"];

const POPULAR_SEARCHES = [
  { emoji: "🥑", name: "Avocado" },
  { emoji: "🍗", name: "Chicken" },
  { emoji: "🧈", name: "Butter" },
  { emoji: "🥛", name: "Milk" },
  { emoji: "🥚", name: "Eggs" },
];

const CITIES = [
  { label: "Hamburg", value: "hamburg" },
  { label: "Berlin", value: "berlin" },
  { label: "Munich", value: "munich" },
  { label: "Cologne", value: "cologne" },
  { label: "Frankfurt", value: "frankfurt" },
  { label: "Stuttgart", value: "stuttgart" },
  { label: "Düsseldorf", value: "duesseldorf" },
  { label: "Leipzig", value: "leipzig" },
  { label: "Dresden", value: "dresden" },
  { label: "Hannover", value: "hannover" },
  { label: "Nuremberg", value: "nuremberg" },
  { label: "Bremen", value: "bremen" },
  { label: "Regensburg", value: "regensburg" },
  { label: "Heidelberg", value: "heidelberg" },
  { label: "Freiburg", value: "freiburg" },
  { label: "Aachen", value: "aachen" },
  { label: "Göttingen", value: "goettingen" },
  { label: "Mannheim", value: "mannheim" },
  { label: "Karlsruhe", value: "karlsruhe" },
  { label: "Bonn", value: "bonn" },
  { label: "Münster", value: "muenster" },
  { label: "Augsburg", value: "augsburg" },
  { label: "Würzburg", value: "wuerzburg" },
  { label: "Kiel", value: "kiel" },
  { label: "Dortmund", value: "dortmund" },
];

// ============================================================
// MAIN COMPONENT
// ============================================================

export default function Home() {
  const [lang, setLang] = useState<Lang>("en");
  const [query, setQuery] = useState("");
  const [city, setCity] = useState("hamburg");
  const [result, setResult] = useState<SearchResult | null>(null);
  const [loading, setLoading] = useState(false);
  const [suggestions, setSuggestions] = useState<string[]>([]);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [hasSearched, setHasSearched] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);
  const suggestionsRef = useRef<HTMLDivElement>(null);

  const l = t[lang];

  useEffect(() => {
    if (query.length < 1) {
      setSuggestions([]);
      return;
    }
    const timeout = setTimeout(async () => {
      try {
        const res = await fetch(`/api/autocomplete?q=${encodeURIComponent(query)}`);
        const data = await res.json();
        setSuggestions(data.suggestions || []);
      } catch {
        setSuggestions([]);
      }
    }, 150);
    return () => clearTimeout(timeout);
  }, [query]);

  useEffect(() => {
    function handleClick(e: MouseEvent) {
      if (
        suggestionsRef.current &&
        !suggestionsRef.current.contains(e.target as Node) &&
        inputRef.current &&
        !inputRef.current.contains(e.target as Node)
      ) {
        setShowSuggestions(false);
      }
    }
    document.addEventListener("mousedown", handleClick);
    return () => document.removeEventListener("mousedown", handleClick);
  }, []);

  async function handleSearch(searchQuery?: string) {
    const q = searchQuery || query;
    if (!q.trim()) return;
    setQuery(q);
    setLoading(true);
    setShowSuggestions(false);
    setHasSearched(true);
    try {
      const res = await fetch(
        `/api/search?product=${encodeURIComponent(q)}&city=${encodeURIComponent(city)}`
      );
      const data = await res.json();
      setResult(data.data);
    } catch {
      setResult(null);
    } finally {
      setLoading(false);
    }
  }

  function formatDate(dateStr: string) {
    const date = new Date(dateStr);
    const days = lang === "de" ? DAYS_DE : DAYS_EN;
    return days[date.getDay()];
  }

  function getCityLabel(slug: string) {
    return CITIES.find((c) => c.value === slug)?.label || slug;
  }

  function buildResultSummary() {
    if (!result) return "";
    const parts: string[] = [];
    if (result.totalOffers > 0) {
      parts.push(`${result.totalOffers} ${pluralize(l.offersFound, result.totalOffers)}`);
    }
    if (result.totalRegular > 0) {
      if (parts.length > 0) parts.push("+");
      parts.push(`${result.totalRegular} ${pluralize(l.typicalPricesFound, result.totalRegular)}`);
    }
    parts.push(result.totalOffers > 0 ? l.foundThisWeek : l.found);
    return parts.join(" ");
  }

  return (
    <div className="grainy-bg bg-background min-h-screen">
      {/* Header */}
      <Header lang={lang} setLang={setLang} />

      <main className="pt-32 pb-16">
        {/* Hero Section */}
        <section className="max-w-4xl mx-auto px-6 pt-12 pb-24 text-center">
          <h1 className="font-headline font-extrabold text-5xl md:text-8xl tracking-tighter mb-8 leading-[0.9] text-on-surface">
            {lang === "en" ? (
              <>
                Stop overpaying for <span className="squiggle">groceries.</span>
              </>
            ) : (
              <>
                Nie wieder zu viel für <span className="squiggle">Lebensmittel</span> zahlen.
              </>
            )}
          </h1>
          <p className="text-on-surface-variant text-xl md:text-2xl mb-12 max-w-2xl mx-auto font-medium">
            {l.subtext} <span className="text-primary font-bold">{l.subtextHighlight}</span>
          </p>

          {/* Search Box Neo-Brutalism Style */}
          <div className="bg-white p-2 md:p-3 rounded-[2.5rem] border-4 border-outline shadow-neo mb-10">
            <div className="flex flex-col md:flex-row gap-2">
              <div className="flex-1 relative">
                <span className="material-symbols-outlined absolute left-6 top-1/2 -translate-y-1/2 text-on-surface-variant text-2xl">
                  search
                </span>
                <input
                  ref={inputRef}
                  className="w-full pl-16 pr-6 py-5 bg-transparent border-none rounded-3xl focus:ring-0 text-xl font-bold placeholder:text-slate-300"
                  placeholder={l.imLookingFor}
                  type="text"
                  value={query}
                  onChange={(e) => {
                    setQuery(e.target.value);
                    setShowSuggestions(true);
                  }}
                  onFocus={() => setShowSuggestions(true)}
                  onKeyDown={(e) => {
                    if (e.key === "Enter") handleSearch();
                  }}
                />
                {showSuggestions && suggestions.length > 0 && (
                  <div
                    ref={suggestionsRef}
                    className="absolute top-full left-0 right-0 mt-2 bg-white rounded-2xl shadow-xl border-2 border-outline overflow-hidden z-50"
                  >
                    {suggestions.map((s) => (
                      <button
                        key={s}
                        className="w-full text-left px-5 py-3 hover:bg-primary/10 font-bold text-on-surface transition-colors flex items-center gap-3 border-b border-outline/10 last:border-b-0"
                        onClick={() => {
                          setQuery(s);
                          setShowSuggestions(false);
                          handleSearch(s);
                        }}
                      >
                        <span className="material-symbols-outlined text-on-surface-variant text-sm">
                          search
                        </span>
                        {s}
                      </button>
                    ))}
                  </div>
                )}
              </div>
              <div className="flex-1 relative md:border-l-2 border-outline/10">
                <span className="material-symbols-outlined absolute left-6 top-1/2 -translate-y-1/2 text-on-surface-variant text-2xl">
                  location_on
                </span>
                <select
                  className="w-full pl-16 pr-6 py-5 bg-transparent border-none rounded-3xl focus:ring-0 text-xl font-bold appearance-none cursor-pointer"
                  value={city}
                  onChange={(e) => setCity(e.target.value)}
                >
                  <option value="">{l.whereYouAt}</option>
                  {CITIES.map((c) => (
                    <option key={c.value} value={c.value}>
                      {c.label}
                    </option>
                  ))}
                </select>
              </div>
              <button
                onClick={() => handleSearch()}
                disabled={loading || !query.trim()}
                className="md:w-auto bg-primary text-white font-headline font-black text-xl px-10 py-5 rounded-[2rem] border-2 border-outline shadow-neo-hover hover:scale-[1.02] active:scale-[0.98] transition-all flex items-center justify-center gap-3 neo-button disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {l.go}
                <span className="material-symbols-outlined">arrow_forward</span>
              </button>
            </div>
          </div>

          {/* Trending Stickers */}
          <div className="flex flex-wrap justify-center gap-3">
            <span className="text-on-surface-variant text-sm font-black uppercase tracking-widest py-2 px-4">
              {l.trendingStickers}
            </span>
            {POPULAR_SEARCHES.map((item, idx) => {
              const rotations = ["rotate-1", "-rotate-2", "rotate-3", "-rotate-1", "rotate-2"];
              const hoverBgs = [
                "hover:bg-amber-100",
                "hover:bg-red-100",
                "hover:bg-yellow-100",
                "hover:bg-blue-100",
                "hover:bg-orange-100",
              ];
              return (
                <button
                  key={item.name}
                  onClick={() => {
                    setQuery(item.name);
                    handleSearch(item.name);
                  }}
                  className={`bg-white ${hoverBgs[idx]} px-6 py-2 rounded-xl border-2 border-outline shadow-neo-hover text-sm font-bold transition-all ${rotations[idx]} hover:rotate-0`}
                >
                  {item.emoji} {item.name}
                </button>
              );
            })}
          </div>
        </section>

        {/* Results Section */}
        {hasSearched && (
          <section className="max-w-5xl mx-auto px-6">
            {loading ? (
              <div className="flex flex-col items-center justify-center py-20 gap-4">
                <span className="material-symbols-outlined text-5xl text-primary animate-spin">
                  progress_activity
                </span>
                <p className="text-on-surface-variant font-bold text-lg">{l.findingPrices}</p>
              </div>
            ) : result && (result.totalOffers > 0 || result.totalRegular > 0) ? (
              <>
                {/* Suggestion Banner */}
                {result.isSuggestion && (
                  <div className="flex items-center gap-3 bg-amber-50 px-6 py-4 rounded-2xl border-2 border-outline mb-6">
                    <span className="material-symbols-outlined text-amber-600">lightbulb</span>
                    <p className="text-on-surface font-bold text-sm">
                      {l.noMatch} &quot;{query}&quot; &mdash; {l.bestDealsInstead}
                    </p>
                  </div>
                )}

                {/* Summary Bar */}
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-6 mb-12 bg-white border-4 border-outline p-8 rounded-[2.5rem] shadow-neo">
                  <div>
                    <h2 className="font-headline font-black text-3xl text-on-surface mb-1">
                      {result.isSuggestion
                        ? l.todaysBestDeals
                        : `${result.product} ${l.inCity} ${getCityLabel(result.city)}`}
                    </h2>
                    <div className="flex items-center gap-2">
                      <span className="flex h-3 w-3 rounded-full bg-primary animate-pulse"></span>
                      <p className="text-on-surface-variant font-bold text-lg uppercase tracking-tight">
                        {result.totalOffers} {l.killerDeals}
                      </p>
                    </div>
                  </div>
                  {result.bestPrice !== null && result.offers.length > 0 && (
                    <div className="bg-primary/10 px-8 py-5 rounded-2xl border-2 border-dashed border-primary">
                      <div className="text-primary font-black text-2xl">
                        {result.offers[0]?.storeName} {l.isWinning} €{result.bestPrice.toFixed(2)}
                      </div>
                      {result.savingsAmount !== null && result.savingsAmount > 0 && (
                        <div className="text-on-surface/60 text-sm font-bold flex items-center gap-2 mt-1">
                          <span className="material-symbols-outlined text-lg">celebration</span>
                          {l.savingYou} €{result.savingsAmount.toFixed(2)} {l.perItem}
                        </div>
                      )}
                    </div>
                  )}
                </div>

                {/* Offer Cards */}
                {result.offers.length > 0 && (
                  <div className="grid gap-6">
                    {result.offers.map((offer, index) => (
                      <OfferCard
                        key={offer.id}
                        offer={offer}
                        isBest={index === 0}
                        formatDate={formatDate}
                        lang={lang}
                        l={l}
                      />
                    ))}
                  </div>
                )}

                {/* Divider */}
                {result.offers.length > 0 && result.regularPrices.length > 0 && (
                  <div className="flex items-center gap-4 py-8">
                    <div className="flex-1 h-px border-t-2 border-dashed border-outline/20" />
                    <span className="text-on-surface-variant text-xs font-black uppercase tracking-widest bg-white px-4 py-2 rounded-full border-2 border-outline/10">
                      {l.typicalPricesBelow}
                    </span>
                    <div className="flex-1 h-px border-t-2 border-dashed border-outline/20" />
                  </div>
                )}

                {/* Regular Price Cards */}
                {result.regularPrices.length > 0 && (
                  <div className="grid gap-6">
                    {result.regularPrices.map((offer) => (
                      <RegularPriceCard key={offer.id} offer={offer} lang={lang} l={l} />
                    ))}
                  </div>
                )}
              </>
            ) : (
              <div className="flex flex-col items-center justify-center py-20 gap-6 bg-white border-4 border-outline rounded-[2.5rem] shadow-neo">
                <span className="text-8xl">🔍</span>
                <p className="text-on-surface font-headline font-black text-3xl">
                  {l.noOffers} &quot;{query}&quot;
                </p>
                <p className="text-on-surface-variant font-bold text-lg">{l.trySearching}</p>
              </div>
            )}
          </section>
        )}
      </main>

      {/* Footer */}
      <Footer lang={lang} />
    </div>
  );
}

// ============================================================
// OFFER CARD (Neo-Brutalist)
// ============================================================

function OfferCard({
  offer,
  isBest,
  formatDate,
  lang,
  l,
}: {
  offer: Offer;
  isBest: boolean;
  formatDate: (d: string) => string;
  lang: Lang;
  l: Record<string, string>;
}) {
  // Get store emoji based on store name
  const getStoreEmoji = (storeName: string) => {
    const emojiMap: Record<string, string> = {
      penny: "🛒",
      rewe: "🍎",
      lidl: "🥑",
      aldi: "🛍️",
      edeka: "🌟",
      netto: "🐕",
      kaufland: "🏪",
    };
    return emojiMap[storeName.toLowerCase()] || "🏬";
  };

  return (
    <div
      className={`group bg-white ${
        isBest ? "border-4 border-outline" : "border-2 border-outline/20 hover:border-outline"
      } rounded-[2rem] overflow-hidden hover:translate-y-[-4px] hover:shadow-neo transition-all duration-300 relative`}
    >
      {isBest && (
        <div className="absolute top-4 right-4 z-10">
          <span className="bg-primary-fixed text-on-primary-fixed font-black text-xs px-4 py-2 rounded-full border-2 border-outline shadow-neo-hover uppercase">
            {l.goatDeal}
          </span>
        </div>
      )}
      <div className="p-8 flex flex-col md:flex-row items-center justify-between gap-8">
        <div className="flex items-center gap-6 w-full md:w-auto">
          <div
            className={`w-20 h-20 border-4 rounded-2xl flex items-center justify-center font-headline font-black text-3xl ${
              isBest ? "rotate-[-3deg]" : "rotate-[2deg]"
            }`}
            style={{
              backgroundColor: offer.storeBrandColor + "1A",
              borderColor: offer.storeBrandColor,
              color: offer.storeBrandColor,
            }}
          >
            {offer.storeName[0]} {getStoreEmoji(offer.storeName)}
          </div>
          <div>
            <h3 className="font-headline font-black text-2xl text-on-surface">
              {offer.storeName}
            </h3>
            <p className="text-on-surface-variant font-bold">
              {lang === "de" ? offer.productName : offer.productNameEn || offer.productName}
            </p>
          </div>
        </div>
        <div className="flex flex-col md:flex-row items-center gap-8 w-full md:w-auto justify-between md:justify-end border-t md:border-t-0 md:border-l-2 border-outline/10 pt-6 md:pt-0 md:pl-8">
          <div className="text-center md:text-right">
            <div className="flex items-center gap-3 justify-center md:justify-end">
              {offer.originalPrice && (
                <span className="text-on-surface-variant/40 line-through text-lg font-bold">
                  €{offer.originalPrice.toFixed(2)}
                </span>
              )}
              <span className={`font-headline font-black ${isBest ? "text-5xl" : "text-4xl"} text-on-surface`}>
                €{offer.price.toFixed(2)}
              </span>
            </div>
            <p className="text-primary font-black text-sm uppercase tracking-widest mt-1">
              {offer.unit}
            </p>
          </div>
          <div className="flex flex-col items-center md:items-end gap-3">
            <div className="bg-tertiary-fixed text-on-tertiary-fixed text-xs font-black px-4 py-2 rounded-full border-2 border-outline flex items-center gap-2">
              <span className="material-symbols-outlined text-sm">alarm</span>
              {l.till} {formatDate(offer.validTo)}
            </div>
            {offer.sourceUrl ? (
              <a
                href={offer.sourceUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="bg-black text-white px-6 py-3 rounded-full font-black text-sm flex items-center gap-2 hover:bg-primary transition-colors border-2 border-outline neo-button"
              >
                {l.seeLeaflet}
                <span className="material-symbols-outlined text-sm">launch</span>
              </a>
            ) : (
              <button className="text-on-surface font-black text-sm flex items-center gap-1 hover:text-primary transition-colors">
                {l.openDeal}
                <span className="material-symbols-outlined text-sm">arrow_outward</span>
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

// ============================================================
// REGULAR PRICE CARD (Neo-Brutalist)
// ============================================================

function RegularPriceCard({
  offer,
  lang,
  l,
}: {
  offer: Offer;
  lang: Lang;
  l: Record<string, string>;
}) {
  return (
    <div className="bg-white border-2 border-outline/10 rounded-[2rem] overflow-hidden hover:border-outline/30 transition-all duration-300 relative opacity-80 hover:opacity-100">
      <div className="p-8 flex flex-col md:flex-row items-center justify-between gap-8">
        <div className="flex items-center gap-6 w-full md:w-auto">
          <div
            className="w-20 h-20 bg-gray-50 border-4 border-gray-300 rounded-2xl flex items-center justify-center font-headline font-black text-gray-400 text-3xl rotate-[-2deg]"
          >
            {offer.storeName[0]}
          </div>
          <div>
            <h3 className="font-headline font-black text-2xl text-on-surface">
              {offer.storeName}
            </h3>
            <p className="text-on-surface-variant font-bold">
              {lang === "de" ? offer.productName : offer.productNameEn || offer.productName}
            </p>
          </div>
        </div>
        <div className="flex flex-col md:flex-row items-center gap-8 w-full md:w-auto justify-between md:justify-end md:border-l-2 border-outline/5 md:pl-8">
          <div className="text-center md:text-right">
            <div className="font-headline font-black text-4xl text-on-surface/60">
              ~€{offer.price.toFixed(2)}
            </div>
            <p className="text-on-surface-variant font-bold text-xs uppercase mt-1">
              {offer.unit}
            </p>
          </div>
          <div className="flex flex-col items-center md:items-end gap-3">
            <div className="bg-surface-container text-on-surface-variant text-xs font-black px-4 py-2 rounded-full border-2 border-outline/10 flex items-center gap-2">
              <span className="material-symbols-outlined text-sm">receipt_long</span>
              {l.typicalPrice}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
