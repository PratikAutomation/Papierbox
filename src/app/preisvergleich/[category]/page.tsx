import type { Metadata } from 'next'
import Link from 'next/link'
import { supabase } from '@/lib/supabase'

export const dynamic = 'force-static'
export const revalidate = 86400

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function slugify(s: string): string {
  return s.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '')
}

function deslugify(slug: string, categories: string[]): string | undefined {
  return categories.find((c) => slugify(c) === slug)
}

const STORE_NAMES: Record<string, string> = {
  '1': 'Lidl',
  '2': 'Aldi Süd',
  '3': 'Penny',
  '4': 'Kaufland',
  '5': 'Netto',
}

function formatEur(price: number): string {
  return price.toFixed(2).replace('.', ',')
}

function formatDate(iso: string): string {
  const d = new Date(iso)
  return d.toLocaleDateString('de-DE', { day: '2-digit', month: '2-digit', year: 'numeric' })
}

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface Offer {
  store_id: string
  brand: string | null
  product_name: string
  price: number
  original_price: number | null
  unit: string | null
  valid_to: string
}

// ---------------------------------------------------------------------------
// Data fetching
// ---------------------------------------------------------------------------

async function getAllCategories(): Promise<string[]> {
  const today = new Date().toISOString().split('T')[0]
  const { data } = await supabase
    .from('offers')
    .select('category_en')
    .lte('valid_from', today)
    .gte('valid_to', today)
    .eq('is_offer', true)

  if (!data) return []
  return [...new Set(data.map((r) => r.category_en).filter(Boolean) as string[])]
}

async function getOffersForCategory(categoryEn: string): Promise<Offer[]> {
  const today = new Date().toISOString().split('T')[0]
  const { data, error } = await supabase
    .from('offers')
    .select('store_id, brand, product_name, price, original_price, unit, valid_to')
    .eq('category_en', categoryEn)
    .lte('valid_from', today)
    .gte('valid_to', today)
    .eq('is_offer', true)
    .order('price', { ascending: true })

  if (error || !data) return []
  return data as Offer[]
}

// ---------------------------------------------------------------------------
// generateStaticParams
// ---------------------------------------------------------------------------

export async function generateStaticParams(): Promise<{ category: string }[]> {
  const categories = await getAllCategories()
  return categories.map((cat) => ({ category: slugify(cat) }))
}

// ---------------------------------------------------------------------------
// generateMetadata
// ---------------------------------------------------------------------------

export async function generateMetadata({
  params,
}: {
  params: { category: string }
}): Promise<Metadata> {
  const categories = await getAllCategories()
  const categoryEn = deslugify(params.category, categories) ?? params.category
  const offers = await getOffersForCategory(categoryEn)

  const count = offers.length
  const latestValidTo = offers.reduce((acc, o) => (o.valid_to > acc ? o.valid_to : acc), '')
  const validToDisplay = latestValidTo ? formatDate(latestValidTo) : ''

  return {
    title: `${categoryEn} Preisvergleich Supermarkt Deutschland | Papierbox`,
    description: `${categoryEn} günstig kaufen: Preise bei Lidl, Aldi, Penny, Kaufland & Netto vergleichen. Aktuell ${count} Angebote${validToDisplay ? ` — gültig bis ${validToDisplay}` : ''}.`,
    alternates: {
      canonical: `https://www.papierbox.eu/preisvergleich/${params.category}`,
    },
  }
}

// ---------------------------------------------------------------------------
// Page component
// ---------------------------------------------------------------------------

export default async function CategoryPage({
  params,
}: {
  params: { category: string }
}) {
  const categories = await getAllCategories()
  const categoryEn = deslugify(params.category, categories) ?? params.category
  const offers = await getOffersForCategory(categoryEn)

  // --- Compute aggregates ---
  const prices = offers.map((o) => o.price)
  const minPrice = prices.length > 0 ? Math.min(...prices) : null
  const maxPrice = prices.length > 0 ? Math.max(...prices) : null
  const avgPrice =
    prices.length > 0 ? prices.reduce((a, b) => a + b, 0) / prices.length : null

  // Cheapest offer overall
  const cheapestOffer = offers[0] ?? null
  const cheapestStoreName = cheapestOffer ? (STORE_NAMES[cheapestOffer.store_id] ?? 'Unbekannt') : null

  const savingsVsAvg =
    cheapestOffer && avgPrice !== null
      ? Math.max(0, avgPrice - cheapestOffer.price)
      : 0

  // Cheapest per store (first occurrence since sorted by price asc)
  const cheapestPerStore = new Map<string, Offer>()
  for (const offer of offers) {
    if (!cheapestPerStore.has(offer.store_id)) {
      cheapestPerStore.set(offer.store_id, offer)
    }
  }
  const storeRows = Array.from(cheapestPerStore.entries())
    .map(([storeId, offer]) => ({ storeId, storeName: STORE_NAMES[storeId] ?? storeId, offer }))
    .sort((a, b) => a.offer.price - b.offer.price)

  // Latest valid_to for display
  const latestValidTo = offers.reduce((acc, o) => (o.valid_to > acc ? o.valid_to : acc), '')

  // JSON-LD schemas
  const breadcrumbSchema = {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: [
      {
        '@type': 'ListItem',
        position: 1,
        name: 'Papierbox',
        item: 'https://www.papierbox.eu',
      },
      {
        '@type': 'ListItem',
        position: 2,
        name: 'Preisvergleich',
        item: 'https://www.papierbox.eu/preisvergleich',
      },
      {
        '@type': 'ListItem',
        position: 3,
        name: categoryEn,
        item: `https://www.papierbox.eu/preisvergleich/${params.category}`,
      },
    ],
  }

  const productSchema =
    minPrice !== null && maxPrice !== null
      ? {
          '@context': 'https://schema.org',
          '@type': 'Product',
          name: `${categoryEn} — Preisvergleich Deutschland`,
          description: `Aktuelle Preise für ${categoryEn} bei Lidl, Aldi, Penny, Kaufland und Netto in Deutschland.`,
          offers: {
            '@type': 'AggregateOffer',
            priceCurrency: 'EUR',
            lowPrice: minPrice.toFixed(2),
            highPrice: maxPrice.toFixed(2),
            offerCount: offers.length,
          },
        }
      : null

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }}
      />
      {productSchema && (
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(productSchema) }}
        />
      )}

      <main className="pt-24 pb-20 grainy-bg min-h-screen">
        <div className="max-w-5xl mx-auto px-6">

          {/* Breadcrumb */}
          <nav className="mb-8" aria-label="Breadcrumb">
            <ol className="flex items-center gap-2 text-sm font-bold text-[#3d4a3d]">
              <li>
                <Link href="/" className="hover:text-[#22c55e] transition-colors">
                  Papierbox
                </Link>
              </li>
              <li className="text-[#1a1c1c]/30">{'/'}</li>
              <li>
                <Link href="/preisvergleich" className="hover:text-[#22c55e] transition-colors">
                  Preisvergleich
                </Link>
              </li>
              <li className="text-[#1a1c1c]/30">{'/'}</li>
              <li className="text-[#1a1c1c]">{categoryEn}</li>
            </ol>
          </nav>

          {/* Page heading */}
          <section className="mb-10">
            <p className="text-xs font-black uppercase tracking-widest text-[#22c55e] mb-3">
              Preisvergleich
            </p>
            <h1 className="font-headline font-black text-4xl md:text-6xl tracking-tight leading-[1.1] text-[#1a1c1c] mb-4">
              {categoryEn} Preisvergleich
              <br />
              <span className="text-[#22c55e]">— Alle Supermärkte</span>
            </h1>
            <p className="font-body text-lg text-[#3d4a3d] font-semibold">
              Vergleiche {categoryEn}-Preise bei Lidl, Aldi, Penny, Kaufland &amp; Netto.
              {latestValidTo && (
                <> Angebote gültig bis <strong>{formatDate(latestValidTo)}</strong>.</>
              )}
            </p>
          </section>

          {offers.length === 0 ? (
            /* Empty state */
            <div className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-12 text-center">
              <p className="font-headline font-black text-2xl text-[#1a1c1c] mb-2">
                Keine aktuellen Angebote
              </p>
              <p className="text-[#3d4a3d] mb-6">
                Für &ldquo;{categoryEn}&rdquo; liegen gerade keine aktiven Angebote vor.
              </p>
              <Link
                href="/preisvergleich"
                className="inline-block font-headline font-black text-base px-6 py-3 rounded-full border-4 border-[#1a1c1c] shadow-neo hover:shadow-neo-hover hover:translate-x-[2px] hover:translate-y-[2px] transition-all bg-white"
              >
                &larr; Alle Kategorien
              </Link>
            </div>
          ) : (
            <>
              {/* Winner callout */}
              {cheapestOffer && (
                <div className="bg-[#22c55e]/10 border-4 border-[#22c55e] rounded-[2rem] p-6 mb-8">
                  <p className="text-xs font-black uppercase tracking-widest text-[#22c55e] mb-1">
                    Bester Preis
                  </p>
                  <p className="font-headline font-black text-2xl text-[#1a1c1c]">
                    {cheapestStoreName} &mdash; &euro;{formatEur(cheapestOffer.price)}
                    {cheapestOffer.unit && (
                      <span className="text-[#3d4a3d] text-base font-semibold ml-2">
                        / {cheapestOffer.unit}
                      </span>
                    )}
                  </p>
                  <p className="text-sm font-semibold text-[#3d4a3d] mt-1">
                    {cheapestOffer.brand ? `${cheapestOffer.brand} — ` : ''}
                    {cheapestOffer.product_name}
                  </p>
                  {savingsVsAvg > 0.01 && (
                    <p className="text-sm text-[#3d4a3d] mt-1">
                      Du sparst &euro;{formatEur(savingsVsAvg)} vs. Durchschnitt
                    </p>
                  )}
                </div>
              )}

              {/* Price comparison table — one row per store */}
              <section className="mb-10">
                <h2 className="font-headline font-black text-2xl text-[#1a1c1c] mb-4 uppercase tracking-tight">
                  Preisvergleich nach Supermarkt
                </h2>
                <div className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo overflow-hidden">
                  <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                      <thead>
                        <tr className="border-b-4 border-[#1a1c1c] bg-[#f9f9f9]">
                          <th className="text-left font-black font-headline uppercase tracking-wide px-6 py-4">
                            Supermarkt
                          </th>
                          <th className="text-left font-black font-headline uppercase tracking-wide px-4 py-4">
                            Produkt
                          </th>
                          <th className="text-right font-black font-headline uppercase tracking-wide px-6 py-4">
                            Preis
                          </th>
                          <th className="text-right font-black font-headline uppercase tracking-wide px-6 py-4">
                            Gespart
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        {storeRows.map(({ storeId, storeName, offer }, idx) => {
                          const saved =
                            offer.original_price != null && offer.original_price > offer.price
                              ? offer.original_price - offer.price
                              : null
                          const isFirst = idx === 0
                          return (
                            <tr
                              key={storeId}
                              className={`border-b-2 border-[#1a1c1c]/10 last:border-0 ${
                                isFirst ? 'bg-[#22c55e]/5' : 'hover:bg-[#f9f9f9]'
                              } transition-colors`}
                            >
                              <td className="px-6 py-4 font-headline font-black text-base">
                                {isFirst && (
                                  <span className="inline-block bg-[#22c55e] text-white text-xs font-black px-2 py-0.5 rounded-full mr-2 uppercase tracking-wide">
                                    Billigste
                                  </span>
                                )}
                                {storeName}
                              </td>
                              <td className="px-4 py-4 text-[#3d4a3d] font-semibold max-w-[200px]">
                                {offer.brand && (
                                  <span className="font-black text-[#1a1c1c]">
                                    {offer.brand}{' '}
                                  </span>
                                )}
                                {offer.product_name}
                              </td>
                              <td className="px-6 py-4 text-right font-headline font-black text-lg">
                                &euro;{formatEur(offer.price)}
                                {offer.unit && (
                                  <span className="text-[#3d4a3d] text-xs font-semibold ml-1">
                                    /{offer.unit}
                                  </span>
                                )}
                              </td>
                              <td className="px-6 py-4 text-right">
                                {saved != null && saved > 0 ? (
                                  <span className="inline-block bg-[#FBBF24] border-2 border-[#1a1c1c] rounded-full px-3 py-1 font-black text-xs text-[#1a1c1c] shadow-[2px_2px_0px_0px_#1a1c1c]">
                                    &minus;&euro;{formatEur(saved)}
                                  </span>
                                ) : (
                                  <span className="text-[#3d4a3d]/50 text-xs">—</span>
                                )}
                              </td>
                            </tr>
                          )
                        })}
                      </tbody>
                    </table>
                  </div>
                </div>
              </section>

              {/* Full offers list */}
              <section className="mb-12">
                <h2 className="font-headline font-black text-2xl text-[#1a1c1c] mb-4 uppercase tracking-tight">
                  Alle Angebote — günstigste zuerst
                </h2>
                <div className="space-y-3">
                  {offers.map((offer, idx) => {
                    const saved =
                      offer.original_price != null && offer.original_price > offer.price
                        ? offer.original_price - offer.price
                        : null
                    const storeName = STORE_NAMES[offer.store_id] ?? offer.store_id
                    return (
                      <div
                        key={idx}
                        className="bg-white border-4 border-[#1a1c1c] rounded-[1.5rem] shadow-neo p-5 flex items-center justify-between gap-4 hover:scale-[1.005] transition-transform"
                      >
                        <div className="flex-1 min-w-0">
                          <div className="flex items-center gap-2 flex-wrap mb-1">
                            <span className="font-headline font-black text-sm text-[#22c55e] uppercase tracking-wide">
                              {storeName}
                            </span>
                            {saved != null && saved > 0 && (
                              <span className="inline-block bg-[#FBBF24] border-2 border-[#1a1c1c] rounded-full px-2 py-0.5 font-black text-xs text-[#1a1c1c] shadow-[2px_2px_0px_0px_#1a1c1c]">
                                &minus;&euro;{formatEur(saved)}
                              </span>
                            )}
                          </div>
                          <p className="font-semibold text-[#1a1c1c] truncate">
                            {offer.brand && (
                              <span className="font-black">{offer.brand} </span>
                            )}
                            {offer.product_name}
                          </p>
                        </div>
                        <div className="text-right shrink-0">
                          <p className="font-headline font-black text-xl text-[#1a1c1c]">
                            &euro;{formatEur(offer.price)}
                          </p>
                          {offer.unit && (
                            <p className="text-[#3d4a3d] text-xs font-semibold">
                              / {offer.unit}
                            </p>
                          )}
                          {offer.original_price != null && offer.original_price > offer.price && (
                            <p className="text-[#3d4a3d] text-xs line-through">
                              &euro;{formatEur(offer.original_price)}
                            </p>
                          )}
                        </div>
                      </div>
                    )
                  })}
                </div>
              </section>

              {/* Stats summary */}
              {minPrice !== null && maxPrice !== null && avgPrice !== null && (
                <section className="mb-12">
                  <div className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-6 grid grid-cols-3 divide-x-2 divide-[#1a1c1c]/10 text-center">
                    <div className="px-4">
                      <p className="text-xs font-black uppercase tracking-widest text-[#3d4a3d] mb-1">
                        Günstigster
                      </p>
                      <p className="font-headline font-black text-2xl text-[#22c55e]">
                        &euro;{formatEur(minPrice)}
                      </p>
                    </div>
                    <div className="px-4">
                      <p className="text-xs font-black uppercase tracking-widest text-[#3d4a3d] mb-1">
                        Durchschnitt
                      </p>
                      <p className="font-headline font-black text-2xl text-[#1a1c1c]">
                        &euro;{formatEur(avgPrice)}
                      </p>
                    </div>
                    <div className="px-4">
                      <p className="text-xs font-black uppercase tracking-widest text-[#3d4a3d] mb-1">
                        Teuerster
                      </p>
                      <p className="font-headline font-black text-2xl text-[#1a1c1c]">
                        &euro;{formatEur(maxPrice)}
                      </p>
                    </div>
                  </div>
                </section>
              )}
            </>
          )}

          {/* CTA */}
          <section className="mt-4">
            <div className="bg-[#22c55e] border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-8 md:p-12 text-center">
              <p className="font-headline font-black text-2xl md:text-3xl text-white mb-2">
                Jetzt in deiner Stadt suchen
              </p>
              <p className="text-white/90 font-semibold mb-6">
                Such nach jedem Produkt — wir zeigen dir den günstigsten Preis in deiner Stadt.
              </p>
              <Link
                href="https://www.papierbox.eu"
                className="inline-block bg-white text-[#1a1c1c] font-headline font-black text-lg px-8 py-4 rounded-full border-4 border-[#1a1c1c] shadow-[4px_4px_0px_0px_#1a1c1c] hover:shadow-[2px_2px_0px_0px_#1a1c1c] hover:translate-x-[2px] hover:translate-y-[2px] transition-all"
              >
                Jetzt in deiner Stadt suchen &rarr;
              </Link>
            </div>
          </section>

        </div>
      </main>
    </>
  )
}
