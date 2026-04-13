"use client";

import { useState, useEffect, useRef } from "react";
import { Offer, SearchResult, CompareResult, StoreRanking } from "@/lib/types";
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
    alertTitle: "Never miss a deal again",
    alertDesc: "We'll ping you when prices drop in",
    alertPlaceholder: "your@email.com",
    alertButton: "ALERT ME",
    alertSent: "You're in! We'll keep you posted.",
    alertPrivacy: "No spam. Unsubscribe anytime.",
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
    alertTitle: "Nie wieder ein Angebot verpassen",
    alertDesc: "Wir benachrichtigen dich bei Preisänderungen in",
    alertPlaceholder: "deine@email.de",
    alertButton: "BENACHRICHTIGE MICH",
    alertSent: "Du bist dabei! Wir halten dich auf dem Laufenden.",
    alertPrivacy: "Kein Spam. Jederzeit abmelden.",
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

const DAYS_EN = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
const DAYS_DE = ["SO", "MO", "DI", "MI", "DO", "FR", "SA"];

const POPULAR_SEARCHES = [
  { emoji: "🍓", name: "Strawberries" },
  { emoji: "🧈", name: "Butter" },
  { emoji: "🍕", name: "Pizza" },
  { emoji: "🍫", name: "Chocolate" },
  { emoji: "🥛", name: "Yoghurt" },
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
  const [city, setCity] = useState("");
  const [result, setResult] = useState<SearchResult | null>(null);
  const [loading, setLoading] = useState(false);
  const [suggestions, setSuggestions] = useState<string[]>([]);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [hasSearched, setHasSearched] = useState(false);
  const [alertEmail, setAlertEmail] = useState("");
  const [alertSubmitted, setAlertSubmitted] = useState(false);
  const [missingField, setMissingField] = useState<"product" | "city" | null>(null);
  const [mode, setMode] = useState<"search" | "list">("search");
  const [listText, setListText] = useState("");
  const [listPhoto, setListPhoto] = useState<string | null>(null);
  const [compareResult, setCompareResult] = useState<CompareResult | null>(null);
  const [compareLoading, setCompareLoading] = useState(false);
  const [showCelebration, setShowCelebration] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);
  const suggestionsRef = useRef<HTMLDivElement>(null);
  const resultsRef = useRef<HTMLDivElement>(null);
  const compareResultsRef = useRef<HTMLDivElement>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const l = t[lang];

  function handleSubscribe() {
    if (!alertEmail.includes("@")) return;
    // 1. Save to Supabase
    fetch("/api/subscribe", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email: alertEmail, city, lang }),
    }).catch(() => {});
    // 2. Send email notification via Web3Forms
    fetch("https://api.web3forms.com/submit", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        access_key: "79d8e709-6ea4-4a6c-85d5-d2aaf91b7641",
        subject: `[Papierbox] New Subscriber: ${alertEmail}`,
        from_name: "Papierbox Alerts",
        name: "Subscriber Alert",
        email: alertEmail,
        message: `New email subscriber!\n\nEmail: ${alertEmail}\nCity: ${city}\nLanguage: ${lang}\nTime: ${new Date().toISOString()}`,
      }),
    }).catch(() => {});
    setAlertSubmitted(true);
  }

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
    setMissingField(null);

    if (!q.trim()) {
      setMissingField("product");
      setTimeout(() => setMissingField(null), 2000);
      return;
    }
    if (!city) {
      setMissingField("city");
      setTimeout(() => setMissingField(null), 2000);
      return;
    }

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
      // Auto-scroll to results on mobile
      setTimeout(() => {
        resultsRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
      }, 100);
    } catch {
      setResult(null);
    } finally {
      setLoading(false);
    }
  }

  const listItemCount = listText.split(/[\n,]+/).filter(l => l.trim()).length;

  async function handleCompare() {
    setMissingField(null);
    if (!listText.trim() && !listPhoto) {
      setMissingField("product");
      setTimeout(() => setMissingField(null), 2000);
      return;
    }
    if (!city) {
      setMissingField("city");
      setTimeout(() => setMissingField(null), 2000);
      return;
    }

    setCompareLoading(true);
    setHasSearched(true);
    try {
      const res = await fetch('/api/compare', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          items: listText || null,
          image: listPhoto || null,
          city,
        }),
      });
      const data = await res.json();
      if (data.data) {
        setCompareResult(data.data);
        setShowCelebration(true);
        setTimeout(() => {
          compareResultsRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
        }, 100);
      }
    } catch {
      setCompareResult(null);
    } finally {
      setCompareLoading(false);
    }
  }

  function handlePhotoUpload(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = (ev) => {
      const base64 = ev.target?.result as string;
      setListPhoto(base64);
    };
    reader.readAsDataURL(file);
  }

  function formatDate(dateStr: string) {
    const date = new Date(dateStr);
    const days = lang === "de" ? DAYS_DE : DAYS_EN;
    return days[date.getDay()];
  }

  function getCityLabel(slug: string) {
    return CITIES.find((c) => c.value === slug)?.label || slug;
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

          {/* Mode Toggle */}
          <div className="flex justify-center mb-8">
            <div className="inline-flex bg-white border-[3px] border-outline rounded-[2rem] p-1 shadow-neo-hover">
              <button
                onClick={() => setMode("search")}
                className={`px-6 py-3 rounded-[1.6rem] font-headline font-extrabold text-sm flex items-center gap-2 transition-all ${
                  mode === "search"
                    ? "bg-on-surface text-white shadow-neo-hover"
                    : "text-on-surface-variant hover:bg-gray-100"
                }`}
              >
                <span className="material-symbols-outlined text-xl">search</span>
                {lang === "en" ? "Search a product" : "Produkt suchen"}
              </button>
              <button
                onClick={() => setMode("list")}
                className={`px-6 py-3 rounded-[1.6rem] font-headline font-extrabold text-sm flex items-center gap-2 transition-all ${
                  mode === "list"
                    ? "bg-on-surface text-white shadow-neo-hover"
                    : "text-on-surface-variant hover:bg-gray-100"
                }`}
              >
                <span className="material-symbols-outlined text-xl">shopping_cart</span>
                {lang === "en" ? "Compare my list" : "Liste vergleichen"}
              </button>
            </div>
          </div>

          {mode === "search" && (
            <>
          {/* Search Box Neo-Brutalism Style */}
          <div className="bg-white p-2 md:p-3 rounded-[2.5rem] border-4 border-outline shadow-neo mb-10">
            <div className="flex flex-col md:flex-row gap-2">
              <div className="flex-1 relative">
                <span className="material-symbols-outlined absolute left-6 top-1/2 -translate-y-1/2 text-on-surface-variant text-2xl">
                  search
                </span>
                <input
                  ref={inputRef}
                  className={`w-full pl-16 pr-6 py-5 bg-transparent border-none rounded-3xl focus:ring-0 text-xl font-bold placeholder:text-slate-300 transition-all ${
                    missingField === "product" ? "ring-2 ring-red-400 bg-red-50/50 placeholder:text-red-400" : ""
                  }`}
                  placeholder={missingField === "product" ? (lang === "en" ? "Type a product first!" : "Erst ein Produkt eingeben!") : l.imLookingFor}
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
                  className={`w-full pl-16 pr-6 py-5 bg-transparent border-none rounded-3xl focus:ring-0 text-xl font-bold appearance-none cursor-pointer transition-all ${
                    missingField === "city" ? "ring-2 ring-red-400 bg-red-50/50 text-red-500" : ""
                  }`}
                  value={city}
                  onChange={(e) => { setCity(e.target.value); setMissingField(null); }}
                >
                  <option value="">{missingField === "city" ? (lang === "en" ? "⚠ Pick a city first!" : "⚠ Erst eine Stadt wählen!") : l.whereYouAt}</option>
                  {CITIES.map((c) => (
                    <option key={c.value} value={c.value}>
                      {c.label}
                    </option>
                  ))}
                </select>
              </div>
              <button
                onClick={() => handleSearch()}
                disabled={loading}
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
            </>
          )}

          {mode === "list" && (
            <>
              <div className="bg-white p-2 md:p-3 rounded-[2.5rem] border-4 border-outline shadow-neo mb-10">
                <div className="relative">
                  <span className="material-symbols-outlined absolute top-6 left-6 text-on-surface-variant text-2xl opacity-50">
                    format_list_bulleted
                  </span>
                  <textarea
                    className="w-full min-h-[180px] pl-16 pr-6 py-5 bg-transparent border-none rounded-t-[2rem] focus:ring-0 text-base font-semibold placeholder:text-slate-300 resize-y leading-relaxed"
                    placeholder={lang === "en"
                      ? "Type your grocery list here...\n\nExample:\nMilk\n2x Butter\nEggs\nChicken breast"
                      : "Einkaufsliste hier eingeben...\n\nBeispiel:\nMilch\n2x Butter\nEier\nHähnchenbrust"
                    }
                    value={listText}
                    onChange={(e) => setListText(e.target.value)}
                  />
                </div>
                <div className="flex items-center justify-between px-4 py-3 border-t-2 border-outline/5">
                  <div className="flex items-center gap-3">
                    <span className="bg-surface-container px-4 py-1.5 rounded-full font-headline font-extrabold text-sm text-on-surface-variant">
                      <strong className="text-primary-dark">{listItemCount}</strong> {lang === "en" ? "items" : "Artikel"}
                    </span>
                    <button
                      onClick={() => fileInputRef.current?.click()}
                      className="flex items-center gap-2 px-5 py-2.5 rounded-full border-2 border-outline bg-white font-headline font-extrabold text-sm shadow-neo-hover hover:translate-y-[-2px] hover:shadow-neo transition-all"
                    >
                      <span className="material-symbols-outlined text-lg text-primary-dark">photo_camera</span>
                      {lang === "en" ? "Upload Photo" : "Foto hochladen"}
                    </button>
                    <input
                      ref={fileInputRef}
                      type="file"
                      accept="image/*"
                      className="hidden"
                      onChange={handlePhotoUpload}
                    />
                    {listPhoto && (
                      <span className="text-primary font-bold text-sm flex items-center gap-1">
                        <span className="material-symbols-outlined text-sm">check_circle</span>
                        {lang === "en" ? "Photo added" : "Foto hinzugefugt"}
                      </span>
                    )}
                  </div>
                </div>
                <div className="flex flex-col md:flex-row gap-2 px-2 pb-2">
                  <div className="flex-1 relative">
                    <span className="material-symbols-outlined absolute left-6 top-1/2 -translate-y-1/2 text-on-surface-variant text-2xl">
                      location_on
                    </span>
                    <select
                      className={`w-full pl-16 pr-6 py-5 bg-surface-container-low border-2 border-outline/10 rounded-[2rem] focus:ring-0 text-xl font-bold appearance-none cursor-pointer transition-all ${
                        missingField === "city" ? "ring-2 ring-red-400 bg-red-50/50 text-red-500" : ""
                      }`}
                      value={city}
                      onChange={(e) => { setCity(e.target.value); setMissingField(null); }}
                    >
                      <option value="">{lang === "en" ? "Where you at?" : "Wo bist du?"}</option>
                      {CITIES.map((c) => (
                        <option key={c.value} value={c.value}>{c.label}</option>
                      ))}
                    </select>
                  </div>
                  <button
                    onClick={handleCompare}
                    disabled={compareLoading}
                    className="md:w-auto bg-primary text-white font-headline font-black text-xl px-10 py-5 rounded-[2rem] border-2 border-outline shadow-neo hover:scale-[1.02] active:scale-[0.98] transition-all flex items-center justify-center gap-3 neo-button disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    {compareLoading
                      ? (lang === "en" ? "Crunching..." : "Berechne...")
                      : (lang === "en" ? "FIND BEST STORE" : "BESTEN LADEN FINDEN")
                    }
                    <span className="material-symbols-outlined">arrow_forward</span>
                  </button>
                </div>
              </div>
            </>
          )}
        </section>

        {/* Results Section */}
        {hasSearched && (
          <section ref={resultsRef} className="max-w-5xl mx-auto px-6 scroll-mt-24">
            {mode === "search" && loading && (
              <div className="flex flex-col items-center justify-center py-20 gap-4">
                <span className="material-symbols-outlined text-5xl text-primary animate-spin">
                  progress_activity
                </span>
                <p className="text-on-surface-variant font-bold text-lg">{l.findingPrices}</p>
              </div>
            )}

            {mode === "search" && !loading && result && (result.totalOffers > 0 || result.totalRegular > 0) && (
              <>
                {/* Summary Bar */}
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-6 mb-12 bg-white border-4 border-outline p-8 rounded-[2.5rem] shadow-neo">
                  <div>
                    <h2 className="font-headline font-black text-3xl text-on-surface mb-1">
                      {result.product} {l.inCity} {getCityLabel(result.city)}
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

                {/* Price Alert Signup — appears after results */}
                <div className="mt-10 bg-[#1a1c1c] text-white rounded-[2.5rem] p-8 md:p-10 border-4 border-[#1a1c1c] relative overflow-hidden">
                  <div className="absolute top-4 right-6 text-5xl opacity-10 rotate-12 select-none">🔔</div>
                  {alertSubmitted ? (
                    <div className="flex items-center gap-4">
                      <span className="text-4xl">✅</span>
                      <div>
                        <p className="font-headline font-black text-2xl">{l.alertSent}</p>
                        <p className="text-white/60 font-medium text-sm mt-1">{l.alertPrivacy}</p>
                      </div>
                    </div>
                  ) : (
                    <>
                      <div className="flex items-center gap-3 mb-4">
                        <span className="material-symbols-outlined text-[#22c55e] text-3xl">notifications_active</span>
                        <h3 className="font-headline font-black text-2xl md:text-3xl">
                          {l.alertTitle}
                        </h3>
                      </div>
                      <p className="text-white/70 font-bold mb-6">
                        {l.alertDesc} <span className="text-[#22c55e] font-black">{getCityLabel(city)}</span>
                      </p>
                      <div className="flex flex-col sm:flex-row gap-3">
                        <input
                          type="email"
                          value={alertEmail}
                          onChange={(e) => setAlertEmail(e.target.value)}
                          placeholder={l.alertPlaceholder}
                          className="flex-1 px-6 py-4 rounded-full bg-white/10 border-2 border-white/20 text-white font-bold placeholder:text-white/30 focus:border-[#22c55e] focus:ring-0 outline-none transition-all"
                          onKeyDown={(e) => {
                            if (e.key === "Enter") handleSubscribe();
                          }}
                        />
                        <button
                          onClick={handleSubscribe}
                          className="px-8 py-4 bg-[#22c55e] text-white font-headline font-black rounded-full border-2 border-white/20 hover:scale-[1.02] active:scale-[0.98] transition-all neo-button whitespace-nowrap"
                        >
                          {l.alertButton} 🔔
                        </button>
                      </div>
                      <p className="text-white/30 text-xs font-medium mt-4">{l.alertPrivacy}</p>
                    </>
                  )}
                </div>
              </>
            )}

            {mode === "search" && !loading && !(result && (result.totalOffers > 0 || result.totalRegular > 0)) && (
              <div className="flex flex-col items-center justify-center py-20 gap-6 bg-white border-4 border-outline rounded-[2.5rem] shadow-neo">
                <span className="text-8xl">🔍</span>
                <p className="text-on-surface font-headline font-black text-3xl">
                  {l.noOffers} &quot;{query}&quot;
                </p>
                <p className="text-on-surface-variant font-bold text-lg">{l.trySearching}</p>
              </div>
            )}

            {mode === "list" && compareLoading && (
              <div className="flex flex-col items-center justify-center py-20 gap-4">
                <span className="material-symbols-outlined text-5xl text-primary animate-spin">
                  progress_activity
                </span>
                <p className="font-headline font-bold text-xl text-on-surface">
                  {lang === "en" ? "Crunching numbers across 5 stores..." : "Preise werden verglichen..."}
                </p>
                <p className="text-on-surface-variant font-semibold text-sm">
                  {lang === "en" ? "This takes ~5 seconds" : "Das dauert ~5 Sekunden"}
                </p>
              </div>
            )}

            {mode === "list" && compareResult && !compareLoading && (
              <div ref={compareResultsRef} className="scroll-mt-24">
                {/* Summary */}
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-6 mb-8 bg-white border-4 border-outline p-8 rounded-[2.5rem] shadow-neo">
                  <div>
                    <h2 className="font-headline font-black text-3xl text-on-surface mb-1">
                      {lang === "en" ? `Your Grocery List in ${getCityLabel(city)}` : `Deine Einkaufsliste in ${getCityLabel(city)}`}
                    </h2>
                    <div className="flex items-center gap-2">
                      <span className="flex h-3 w-3 rounded-full bg-primary animate-pulse"></span>
                      <p className="text-on-surface-variant font-bold text-lg uppercase tracking-tight">
                        {compareResult.total_items} {lang === "en" ? "items compared across 5 stores" : "Artikel in 5 Laden verglichen"}
                      </p>
                    </div>
                  </div>
                </div>

                {/* Store Ranking */}
                <div className="flex flex-col gap-3 mb-8">
                  {compareResult.store_rankings.map((ranking, index) => (
                    <StoreRankCard
                      key={ranking.store_id}
                      ranking={ranking}
                      index={index}
                      isWinner={index === 0}
                      maxCost={Math.max(...compareResult.store_rankings.map(r => r.total_cost))}
                    />
                  ))}
                </div>

                {/* Item Breakdown for winner */}
                <ItemBreakdown ranking={compareResult.store_rankings[0]} lang={lang} />
              </div>
            )}
          </section>
        )}
      </main>

      {/* Celebration Popup */}
      {showCelebration && compareResult && (
        <CelebrationPopup
          result={compareResult}
          lang={lang}
          onClose={() => setShowCelebration(false)}
        />
      )}

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

// ============================================================
// CELEBRATION POPUP
// ============================================================

function CelebrationPopup({
  result,
  lang,
  onClose,
}: {
  result: CompareResult;
  lang: Lang;
  onClose: () => void;
}) {
  const winner = result.store_rankings[0];
  if (!winner) return null;
  const worst = result.store_rankings[result.store_rankings.length - 1];

  return (
    <div
      className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-6"
      onClick={onClose}
    >
      <div
        className="bg-white border-4 border-outline rounded-[2.5rem] p-12 max-w-lg w-full text-center shadow-[8px_8px_0px_0px_#1a1c1c] relative animate-[popIn_0.4s_cubic-bezier(0.175,0.885,0.32,1.275)]"
        onClick={(e) => e.stopPropagation()}
      >
        <button onClick={onClose} className="absolute top-4 right-6 text-2xl text-on-surface-variant hover:text-on-surface">
          &times;
        </button>
        <div className="text-4xl mb-4 animate-bounce">&#127881; &#127882; &#10024;</div>
        <div className="font-headline font-extrabold text-base uppercase tracking-[3px] text-primary mb-1">
          {lang === "en" ? "THIS WEEK, GO TO" : "DIESE WOCHE, GEH ZU"}
        </div>
        <div className="font-headline font-black text-5xl md:text-6xl tracking-tighter text-on-surface mb-5">
          {winner.store_name.toUpperCase()}
        </div>
        <div className="inline-flex items-baseline gap-1 bg-primary text-white px-7 py-3 rounded-full font-headline font-black text-3xl border-[3px] border-outline shadow-neo-hover mb-4">
          <span className="text-xl">&euro;</span>{winner.total_cost.toFixed(2)}
        </div>
        {result.savings_vs_worst > 0 && (
          <div className="flex items-center justify-center gap-2 bg-amber-50 text-amber-800 px-5 py-2.5 rounded-full font-extrabold text-sm border-2 border-amber-400 mb-6 mx-auto w-fit">
            <span className="material-symbols-outlined text-lg">savings</span>
            {lang === "en"
              ? `You save \u20AC${result.savings_vs_worst.toFixed(2)} vs ${worst?.store_name}`
              : `Du sparst \u20AC${result.savings_vs_worst.toFixed(2)} vs ${worst?.store_name}`
            }
          </div>
        )}
        <div className="text-on-surface-variant text-sm font-semibold mb-6">
          <strong className="text-primary">{result.total_items}</strong> {lang === "en" ? "items compared across 5 stores" : "Artikel in 5 Laden verglichen"}
        </div>
        <button
          onClick={onClose}
          className="px-8 py-4 bg-on-surface text-white font-headline font-black rounded-full border-2 border-outline shadow-neo-hover hover:translate-y-[-2px] hover:shadow-neo transition-all inline-flex items-center gap-2"
        >
          {lang === "en" ? "SEE FULL BREAKDOWN" : "DETAILS ANZEIGEN"}
          <span className="material-symbols-outlined text-lg">arrow_downward</span>
        </button>
      </div>
    </div>
  );
}

// ============================================================
// STORE RANKING CARD
// ============================================================

function StoreRankCard({
  ranking,
  index,
  isWinner,
  maxCost,
}: {
  ranking: StoreRanking;
  index: number;
  isWinner: boolean;
  maxCost: number;
}) {
  const medals = ["\u{1F947}", "\u{1F948}", "\u{1F949}"];
  const barPercent = maxCost > 0 ? Math.round((ranking.total_cost / maxCost) * 100) : 0;
  const barColors = ['#22c55e', '#94a3b8', '#f97316', '#d1d5db', '#d1d5db'];

  return (
    <div className={`flex items-center gap-4 px-6 py-5 bg-white rounded-[2rem] transition-all hover:translate-y-[-2px] ${
      isWinner
        ? "border-4 border-outline shadow-neo"
        : "border-2 border-outline/10 hover:border-outline hover:shadow-neo-hover"
    }`}>
      <div className={`w-11 h-11 rounded-xl flex items-center justify-center text-xl font-black flex-shrink-0 ${
        index === 0 ? "bg-amber-100 border-2 border-amber-400" :
        index === 1 ? "bg-slate-100 border-2 border-slate-400" :
        index === 2 ? "bg-orange-100 border-2 border-orange-400" :
        "bg-gray-100 border-2 border-gray-300 font-headline text-on-surface-variant"
      }`}>
        {index < 3 ? medals[index] : index + 1}
      </div>
      <div className="flex-1 min-w-0">
        <div className="font-headline font-extrabold text-lg flex items-center gap-2">
          {ranking.store_name}
          {isWinner && (
            <span className="bg-primary text-white text-xs font-black px-2.5 py-0.5 rounded-full border-2 border-outline uppercase tracking-wider">
              Best Pick
            </span>
          )}
        </div>
        <div className="text-primary font-bold text-xs">
          {ranking.offer_count} {ranking.offer_count === 1 ? "item on sale" : "items on sale"} this week
        </div>
      </div>
      <div className="hidden sm:block flex-1 min-w-0">
        <div className="h-2.5 bg-gray-100 rounded-full overflow-hidden">
          <div
            className="h-full rounded-full transition-all duration-1000"
            style={{ width: `${barPercent}%`, backgroundColor: barColors[index] || '#d1d5db' }}
          />
        </div>
      </div>
      <div className={`font-headline font-black text-2xl flex-shrink-0 ${isWinner ? "text-primary" : ""}`}>
        &euro;{ranking.total_cost.toFixed(2)}
      </div>
    </div>
  );
}

// ============================================================
// ITEM BREAKDOWN
// ============================================================

function ItemBreakdown({
  ranking,
  lang,
}: {
  ranking: StoreRanking;
  lang: Lang;
}) {
  const offers = ranking.items.filter(i => i.type === 'offer');
  const typical = ranking.items.filter(i => i.type !== 'offer');

  return (
    <div className="bg-white border-4 border-outline rounded-[2.5rem] overflow-hidden shadow-neo">
      <div className="px-7 py-5 border-b-[3px] border-outline flex items-center justify-between">
        <h3 className="font-headline font-extrabold text-xl flex items-center gap-2">
          <span className="material-symbols-outlined text-primary">receipt_long</span>
          {lang === "en" ? `Item breakdown at ${ranking.store_name}` : `Artikelaufstellung bei ${ranking.store_name}`}
        </h3>
        <span className="font-headline font-extrabold text-sm text-on-surface-variant">
          {ranking.items.length} {lang === "en" ? "items" : "Artikel"}
        </span>
      </div>

      {/* Offer items */}
      <ul className="divide-y divide-outline/5">
        {offers.map((item, i) => (
          <li key={`offer-${i}`} className="flex items-center gap-4 px-7 py-4 hover:bg-surface transition-colors">
            <div className="w-9 h-9 rounded-xl bg-primary/15 text-primary flex items-center justify-center flex-shrink-0">
              <span className="material-symbols-outlined text-lg">local_fire_department</span>
            </div>
            <div className="flex-1 min-w-0">
              <div className="font-bold text-sm">{item.name_de || item.name}{item.qty > 1 ? ` x${item.qty}` : ''}</div>
              <div className="text-xs font-semibold text-on-surface-variant">{item.unit}{item.valid_to ? ` \u00B7 Valid until ${item.valid_to}` : ''}</div>
            </div>
            <span className="bg-primary text-white text-xs font-extrabold px-2.5 py-0.5 rounded-full border-[1.5px] border-outline uppercase flex-shrink-0">
              {lang === "en" ? "ON SALE" : "ANGEBOT"}
            </span>
            <div className="text-right flex-shrink-0">
              {item.original_price && (
                <div className="text-xs text-on-surface-variant/40 line-through font-semibold">&euro;{item.original_price.toFixed(2)}</div>
              )}
              <div className="font-headline font-black text-lg">&euro;{item.price.toFixed(2)}</div>
              {item.savings && item.savings > 0 && (
                <div className="text-xs text-primary font-extrabold">save &euro;{item.savings.toFixed(2)}</div>
              )}
            </div>
          </li>
        ))}
      </ul>

      {/* Divider */}
      {offers.length > 0 && typical.length > 0 && (
        <div className="flex items-center gap-3 px-7 py-3 bg-surface">
          <div className="flex-1 border-t-2 border-dashed border-outline/10" />
          <span className="text-xs font-extrabold uppercase tracking-widest text-on-surface-variant whitespace-nowrap">
            {lang === "en" ? "Typical prices" : "Typische Preise"}
          </span>
          <div className="flex-1 border-t-2 border-dashed border-outline/10" />
        </div>
      )}

      {/* Typical price items — SAME visual style as offers (no gray/muted) */}
      <ul className="divide-y divide-outline/5">
        {typical.map((item, i) => (
          <li key={`typical-${i}`} className="flex items-center gap-4 px-7 py-4 hover:bg-surface transition-colors">
            <div className="w-9 h-9 rounded-xl bg-primary/15 text-primary flex items-center justify-center flex-shrink-0">
              <span className="material-symbols-outlined text-lg">shopping_basket</span>
            </div>
            <div className="flex-1 min-w-0">
              <div className="font-bold text-sm">{item.name_de || item.name}{item.qty > 1 ? ` x${item.qty}` : ''}</div>
              <div className="text-xs font-semibold text-on-surface-variant">{item.unit}</div>
            </div>
            <div className="text-right flex-shrink-0">
              <div className="font-headline font-black text-lg">&euro;{item.price.toFixed(2)}</div>
            </div>
          </li>
        ))}
      </ul>

      {/* Total */}
      <div className="flex items-center justify-between px-7 py-5 bg-on-surface text-white">
        <div>
          <div className="font-headline font-extrabold text-lg">
            {lang === "en" ? `TOTAL AT ${ranking.store_name.toUpperCase()}` : `GESAMT BEI ${ranking.store_name.toUpperCase()}`}
          </div>
          <div className="text-xs opacity-60 font-semibold">{ranking.items.length} {lang === "en" ? "items" : "Artikel"}</div>
        </div>
        <div className="font-headline font-black text-3xl">&euro;{ranking.total_cost.toFixed(2)}</div>
      </div>
    </div>
  );
}
