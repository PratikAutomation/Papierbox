"use client";

import { useState, useEffect, useRef } from "react";
import { Offer, SearchResult } from "@/lib/types";

const POPULAR_SEARCHES = [
  "Avocado",
  "Chicken",
  "Butter",
  "Milk",
  "Eggs",
  "Bananas",
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

export default function Home() {
  const [query, setQuery] = useState("");
  const [city, setCity] = useState("hamburg");
  const [result, setResult] = useState<SearchResult | null>(null);
  const [loading, setLoading] = useState(false);
  const [suggestions, setSuggestions] = useState<string[]>([]);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [hasSearched, setHasSearched] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);
  const suggestionsRef = useRef<HTMLDivElement>(null);

  // Autocomplete
  useEffect(() => {
    if (query.length < 1) {
      setSuggestions([]);
      return;
    }
    const timeout = setTimeout(async () => {
      try {
        const res = await fetch(
          `/api/autocomplete?q=${encodeURIComponent(query)}`
        );
        const data = await res.json();
        setSuggestions(data.suggestions || []);
      } catch {
        setSuggestions([]);
      }
    }, 150);
    return () => clearTimeout(timeout);
  }, [query]);

  // Close suggestions on outside click
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
    const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return days[date.getDay()];
  }

  function getCityLabel(slug: string) {
    return CITIES.find((c) => c.value === slug)?.label || slug;
  }

  return (
    <>
      {/* Header */}
      <header className="fixed top-0 w-full z-50 bg-white/80 backdrop-blur-xl border-b border-zinc-100">
        <nav className="flex justify-between items-center px-6 py-4 max-w-7xl mx-auto">
          <div className="text-2xl font-headline font-bold tracking-tighter text-zinc-900">
            Papierbox
          </div>
          <div className="hidden md:flex items-center gap-8 font-headline font-medium text-sm tracking-tight">
            <a
              className="text-green-600 font-bold border-b-2 border-green-600 pb-1"
              href="#"
            >
              Markets
            </a>
            <a
              className="text-zinc-500 hover:text-zinc-800 transition-colors"
              href="#"
            >
              Deals
            </a>
            <a
              className="text-zinc-500 hover:text-zinc-800 transition-colors"
              href="#"
            >
              Insights
            </a>
            <a
              className="text-zinc-500 hover:text-zinc-800 transition-colors"
              href="#"
            >
              Watchlist
            </a>
          </div>
          <div className="flex items-center gap-4">
            <button className="p-2 hover:bg-zinc-100 rounded-lg transition-all active:scale-90 duration-200">
              <span className="material-symbols-outlined text-zinc-600">
                language
              </span>
            </button>
            <button className="p-2 hover:bg-zinc-100 rounded-lg transition-all active:scale-90 duration-200">
              <span className="material-symbols-outlined text-zinc-600">
                account_circle
              </span>
            </button>
          </div>
        </nav>
      </header>

      <main className="pt-20">
        {/* Hero */}
        <section className="py-12 md:py-20 px-6 max-w-7xl mx-auto text-center">
          <div className="max-w-4xl mx-auto">
            <h1 className="font-headline font-extrabold text-4xl md:text-6xl tracking-tight mb-6 leading-tight text-zinc-900">
              Stop overpaying for groceries.
            </h1>
            <p className="text-zinc-500 text-lg md:text-xl mb-12 max-w-2xl mx-auto font-medium">
              Compare prices across German supermarkets in seconds. We track
              thousands of offers so you don&apos;t have to.
            </p>

            {/* Search Box */}
            <div className="bg-white p-4 md:p-6 rounded-[2rem] shadow-[0px_20px_40px_rgba(0,0,0,0.04)] border border-zinc-100">
              <div className="flex flex-col md:flex-row gap-4">
                {/* Product Input */}
                <div className="flex-1 relative">
                  <span className="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-zinc-400">
                    search
                  </span>
                  <input
                    ref={inputRef}
                    className="w-full pl-12 pr-4 py-4 bg-zinc-50 border-none rounded-2xl focus:ring-2 focus:ring-green-500/30 focus:bg-white transition-all font-medium placeholder-zinc-400 outline-none"
                    placeholder="Search any product..."
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
                  {/* Autocomplete Dropdown */}
                  {showSuggestions && suggestions.length > 0 && (
                    <div
                      ref={suggestionsRef}
                      className="absolute top-full left-0 right-0 mt-2 bg-white rounded-2xl shadow-xl border border-zinc-100 overflow-hidden z-50"
                    >
                      {suggestions.map((s) => (
                        <button
                          key={s}
                          className="w-full text-left px-5 py-3 hover:bg-zinc-50 font-medium text-zinc-700 transition-colors flex items-center gap-3"
                          onClick={() => {
                            setQuery(s);
                            setShowSuggestions(false);
                            handleSearch(s);
                          }}
                        >
                          <span className="material-symbols-outlined text-zinc-300 text-sm">
                            search
                          </span>
                          {s}
                        </button>
                      ))}
                    </div>
                  )}
                </div>

                {/* City Select */}
                <div className="flex-1 relative">
                  <span className="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-zinc-400">
                    location_on
                  </span>
                  <select
                    className="w-full pl-12 pr-4 py-4 bg-zinc-50 border-none rounded-2xl focus:ring-2 focus:ring-green-500/30 transition-all font-medium appearance-none text-zinc-600 outline-none"
                    value={city}
                    onChange={(e) => setCity(e.target.value)}
                  >
                    {CITIES.map((c) => (
                      <option key={c.value} value={c.value}>
                        {c.label}
                      </option>
                    ))}
                  </select>
                </div>
              </div>

              <button
                onClick={() => handleSearch()}
                disabled={loading || !query.trim()}
                className="w-full mt-4 bg-[#22c55e] text-white font-headline font-bold py-4 rounded-full shadow-lg shadow-green-200 hover:brightness-105 active:scale-[0.98] transition-all flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {loading ? (
                  <span className="animate-spin material-symbols-outlined">
                    progress_activity
                  </span>
                ) : (
                  <span className="material-symbols-outlined">
                    travel_explore
                  </span>
                )}
                {loading ? "Searching..." : "Compare Prices"}
              </button>
            </div>

            {/* Popular Chips */}
            <div className="mt-8 flex flex-wrap justify-center gap-2">
              <span className="text-zinc-400 text-sm font-medium py-1.5 px-2">
                Popular:
              </span>
              {POPULAR_SEARCHES.map((term) => (
                <button
                  key={term}
                  onClick={() => {
                    setQuery(term);
                    handleSearch(term);
                  }}
                  className="bg-white border border-zinc-100 hover:bg-zinc-50 px-5 py-1.5 rounded-full text-sm font-semibold text-zinc-600 transition-all shadow-sm hover:shadow active:scale-95"
                >
                  {term}
                </button>
              ))}
            </div>
          </div>
        </section>

        {/* Results */}
        {hasSearched && (
          <section className="max-w-5xl mx-auto px-6 pb-24 space-y-6">
            {loading ? (
              <div className="flex flex-col items-center justify-center py-20 gap-4">
                <span className="material-symbols-outlined text-5xl text-green-500 animate-spin">
                  progress_activity
                </span>
                <p className="text-zinc-400 font-medium">
                  Finding the best prices...
                </p>
              </div>
            ) : result && result.totalOffers > 0 ? (
              <>
                {/* Suggestion Banner */}
                {result.isSuggestion && (
                  <div className="flex items-center gap-3 bg-amber-50 px-6 py-4 rounded-2xl border border-amber-100">
                    <span className="material-symbols-outlined text-amber-600">
                      lightbulb
                    </span>
                    <p className="text-amber-800 font-medium text-sm">
                      No exact match for &quot;{query}&quot; — here are today&apos;s best deals instead
                    </p>
                  </div>
                )}

                {/* Summary Bar */}
                <div className="flex flex-col md:flex-row justify-between items-center gap-4 bg-zinc-100/50 p-6 rounded-3xl border border-zinc-200/50">
                  <div>
                    <h2 className="font-headline font-bold text-2xl text-zinc-900">
                      {result.isSuggestion
                        ? "Today's Best Deals"
                        : `${result.product} in ${getCityLabel(result.city)}`}
                    </h2>
                    <p className="text-zinc-500 font-medium text-sm">
                      {result.totalOffers} offer
                      {result.totalOffers !== 1 ? "s" : ""} found this week
                    </p>
                  </div>
                  {result.bestPrice !== null && (
                    <div className="bg-green-50 px-6 py-4 rounded-2xl border border-green-100 text-center md:text-right">
                      <div className="text-[#006e2f] font-bold text-lg">
                        Best price: €{result.bestPrice.toFixed(2)} at{" "}
                        {result.offers[0]?.storeName}
                      </div>
                      {result.savingsAmount !== null &&
                        result.savingsAmount > 0 && (
                          <div className="text-green-600/80 text-xs font-bold flex items-center justify-center md:justify-end gap-1 uppercase tracking-wider">
                            <span className="material-symbols-outlined text-sm">
                              savings
                            </span>
                            you save €{result.savingsAmount.toFixed(2)}!
                          </div>
                        )}
                    </div>
                  )}
                </div>

                {/* Price Cards */}
                <div className="grid gap-4">
                  {result.offers.map((offer, index) => (
                    <PriceCard
                      key={offer.id}
                      offer={offer}
                      isBest={index === 0}
                      formatDate={formatDate}
                    />
                  ))}
                </div>
              </>
            ) : (
              <div className="flex flex-col items-center justify-center py-20 gap-4">
                <span className="material-symbols-outlined text-5xl text-zinc-300">
                  search_off
                </span>
                <p className="text-zinc-400 font-medium text-lg">
                  No offers found for &quot;{query}&quot;
                </p>
                <p className="text-zinc-400 text-sm">
                  Try searching for: Butter, Milk, Eggs, or Avocado
                </p>
              </div>
            )}
          </section>
        )}
      </main>

      {/* Footer */}
      <footer className="w-full rounded-t-3xl mt-12 bg-zinc-100">
        <div className="flex flex-col md:flex-row justify-between items-start px-8 py-12 max-w-7xl mx-auto gap-12">
          <div className="max-w-xs space-y-4">
            <div className="font-headline font-bold text-2xl text-zinc-900">
              Papierbox
            </div>
            <p className="font-body text-xs text-zinc-500 leading-relaxed">
              Helping expats navigate German grocery prices. All offers are based
              on official weekly leaflets. Prices updated daily.
            </p>
          </div>
          <div className="grid grid-cols-2 gap-12 md:gap-24">
            <div>
              <h4 className="font-headline font-bold text-[10px] uppercase tracking-[0.2em] text-zinc-400 mb-6">
                Platform
              </h4>
              <ul className="space-y-4 font-body text-xs">
                <li>
                  <a
                    className="text-zinc-500 hover:text-green-600 hover:underline transition-all"
                    href="#"
                  >
                    About
                  </a>
                </li>
                <li>
                  <a
                    className="text-zinc-500 hover:text-green-600 hover:underline transition-all"
                    href="#"
                  >
                    Store Partners
                  </a>
                </li>
                <li>
                  <a
                    className="text-zinc-500 hover:text-green-600 hover:underline transition-all"
                    href="#"
                  >
                    Contact
                  </a>
                </li>
              </ul>
            </div>
            <div>
              <h4 className="font-headline font-bold text-[10px] uppercase tracking-[0.2em] text-zinc-400 mb-6">
                Legal
              </h4>
              <ul className="space-y-4 font-body text-xs">
                <li>
                  <a
                    className="text-zinc-500 hover:text-green-600 hover:underline transition-all"
                    href="#"
                  >
                    Impressum
                  </a>
                </li>
                <li>
                  <a
                    className="text-zinc-500 hover:text-green-600 hover:underline transition-all"
                    href="#"
                  >
                    Datenschutz
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div className="max-w-7xl mx-auto px-8 py-8 border-t border-zinc-200/50 flex flex-col md:flex-row justify-between items-center gap-4">
          <p className="font-body text-[10px] text-zinc-400">
            © 2026 Papierbox. Prices from public weekly offers.
          </p>
          <div className="flex items-center gap-4 font-body text-[10px] text-zinc-400">
            <span className="material-symbols-outlined text-sm">language</span>
            <span>Region: Germany</span>
          </div>
        </div>
      </footer>
    </>
  );
}

function PriceCard({
  offer,
  isBest,
  formatDate,
}: {
  offer: Offer;
  isBest: boolean;
  formatDate: (d: string) => string;
}) {
  return (
    <div
      className={`group flex flex-col md:flex-row ${isBest ? "bg-white" : "bg-white/70"} rounded-2xl overflow-hidden hover:shadow-xl hover:shadow-zinc-200/50 transition-all duration-300 border border-zinc-100`}
    >
      {/* Store color bar */}
      <div
        className="w-full h-1.5 md:h-auto md:w-2"
        style={{ backgroundColor: offer.storeBrandColor }}
      />

      <div className="flex-1 p-6 flex flex-col md:flex-row items-center justify-between gap-6">
        {/* Store info */}
        <div className="flex items-center gap-5 w-full md:w-auto">
          <div
            className="w-14 h-14 rounded-xl flex items-center justify-center font-headline font-black text-xl border border-zinc-100"
            style={{
              backgroundColor: offer.storeBrandColor + "15",
              color: offer.storeBrandColor,
            }}
          >
            {offer.storeName[0]}
          </div>
          <div>
            <h3 className="font-headline font-bold text-xl text-zinc-900 leading-tight">
              {offer.storeName}
            </h3>
            <div className="flex flex-wrap items-center gap-2 mt-1.5">
              {isBest && (
                <span className="bg-green-100 text-[#006e2f] text-[10px] font-bold px-2.5 py-0.5 rounded-full uppercase tracking-widest border border-green-200">
                  Best Value
                </span>
              )}
              <span className="text-zinc-500 text-sm font-medium">
                {offer.productName}
              </span>
            </div>
          </div>
        </div>

        {/* Price + date */}
        <div className="flex items-center gap-8 w-full md:w-auto justify-between md:justify-end">
          <div className="text-right">
            <div className="flex items-center gap-2 justify-end">
              {offer.originalPrice && (
                <span className="text-zinc-400 line-through text-sm font-medium">
                  €{offer.originalPrice.toFixed(2)}
                </span>
              )}
              <span className="font-headline font-extrabold text-3xl text-zinc-900">
                €{offer.price.toFixed(2)}
              </span>
            </div>
            <p className="text-zinc-400 text-xs font-medium">
              Unit: {offer.unit}
            </p>
          </div>
          <div className="flex flex-col items-end gap-2">
            <span
              className={`${isBest ? "bg-amber-50 text-amber-700 border-amber-100" : "bg-zinc-50 text-zinc-500 border-zinc-100"} text-[10px] font-bold px-3 py-1 rounded-full flex items-center gap-1 border`}
            >
              <span className="material-symbols-outlined text-xs">event</span>
              Valid until {formatDate(offer.validTo)}
            </span>
            {offer.sourceUrl && (
              <a
                href={offer.sourceUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="text-[#22c55e] font-bold text-sm hover:underline flex items-center gap-1"
              >
                View Leaflet
                <span className="material-symbols-outlined text-sm">
                  open_in_new
                </span>
              </a>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
