import type { Metadata } from 'next'
import Link from 'next/link'
import { supabase } from '@/lib/supabase'

export const revalidate = 86400
export const dynamic = 'force-static'

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const CITIES: Record<string, string> = {
  hamburg: 'Hamburg',
  berlin: 'Berlin',
  munich: 'München',
  cologne: 'Köln',
  frankfurt: 'Frankfurt',
  stuttgart: 'Stuttgart',
  duesseldorf: 'Düsseldorf',
  leipzig: 'Leipzig',
  dresden: 'Dresden',
  hannover: 'Hannover',
  nuremberg: 'Nürnberg',
  bremen: 'Bremen',
  regensburg: 'Regensburg',
  heidelberg: 'Heidelberg',
  freiburg: 'Freiburg',
  aachen: 'Aachen',
  goettingen: 'Göttingen',
  mannheim: 'Mannheim',
  karlsruhe: 'Karlsruhe',
  bonn: 'Bonn',
  muenster: 'Münster',
  augsburg: 'Augsburg',
  wuerzburg: 'Würzburg',
  kiel: 'Kiel',
  dortmund: 'Dortmund',
}

const STORES: Record<string, { name: string; slug: string; color: string }> = {
  '1': { name: 'Lidl', slug: 'lidl', color: '#0050AA' },
  '2': { name: 'Aldi Süd', slug: 'aldi-sued', color: '#00A0E2' },
  '3': { name: 'Penny', slug: 'penny', color: '#CC0000' },
  '4': { name: 'Kaufland', slug: 'kaufland', color: '#E30613' },
  '5': { name: 'Netto', slug: 'netto', color: '#FFCC00' },
}

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface Offer {
  store_id: string
  product_name: string
  price: number
  original_price: number | null
  unit: string | null
  valid_to: string
  is_offer: boolean
  category_en: string | null
}

interface StoreGroup {
  storeId: string
  storeName: string
  storeSlug: string
  storeColor: string
  offerCount: number
  topDeals: Offer[]
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function getISOWeek(date: Date): number {
  const d = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate()))
  const dayNum = d.getUTCDay() || 7
  d.setUTCDate(d.getUTCDate() + 4 - dayNum)
  const yearStart = new Date(Date.UTC(d.getUTCFullYear(), 0, 1))
  return Math.ceil(((d.getTime() - yearStart.getTime()) / 86400000 + 1) / 7)
}

function formatPrice(price: number): string {
  return price.toFixed(2).replace('.', ',')
}

function savingPct(price: number, originalPrice: number): number {
  return Math.round(((originalPrice - price) / originalPrice) * 100)
}

// ---------------------------------------------------------------------------
// Static params
// ---------------------------------------------------------------------------

export async function generateStaticParams() {
  return Object.keys(CITIES).map((city) => ({ city }))
}

// ---------------------------------------------------------------------------
// Metadata
// ---------------------------------------------------------------------------

export async function generateMetadata({
  params,
}: {
  params: Promise<{ city: string }>
}): Promise<Metadata> {
  const { city } = await params
  const cityName = CITIES[city] ?? city
  const baseUrl = 'https://www.papierbox.eu'
  const canonicalUrl = `${baseUrl}/angebote/${city}`

  return {
    title: `Supermarkt Angebote ${cityName} diese Woche | Papierbox`,
    description: `Alle aktuellen Angebote von Lidl, Aldi, Penny, Kaufland & Netto in ${cityName}. Günstigste Preise diese Woche — täglich aktualisiert.`,
    alternates: {
      canonical: canonicalUrl,
      languages: {
        de: canonicalUrl,
        en: canonicalUrl,
        'x-default': canonicalUrl,
      },
    },
    openGraph: {
      url: canonicalUrl,
      title: `Supermarkt Angebote ${cityName} diese Woche | Papierbox`,
      description: `Alle aktuellen Angebote von Lidl, Aldi, Penny, Kaufland & Netto in ${cityName}. Günstigste Preise diese Woche — täglich aktualisiert.`,
    },
  }
}

// ---------------------------------------------------------------------------
// Page component
// ---------------------------------------------------------------------------

export default async function CityHubPage({
  params,
}: {
  params: Promise<{ city: string }>
}) {
  const { city } = await params
  const cityName = CITIES[city] ?? city
  const baseUrl = 'https://www.papierbox.eu'
  const canonicalUrl = `${baseUrl}/angebote/${city}`

  const today = new Date().toISOString().split('T')[0]
  const now = new Date()
  const week = getISOWeek(now)
  const year = now.getFullYear()

  // Fetch offers
  const { data } = await supabase
    .from('offers')
    .select('store_id, product_name, price, original_price, unit, valid_to, is_offer, category_en')
    .lte('valid_from', today)
    .gte('valid_to', today)
    .eq('is_offer', true)
    .order('price', { ascending: true })

  const offers: Offer[] = (data ?? []) as Offer[]

  // Group by store
  const storeGroups: StoreGroup[] = Object.entries(STORES).map(([storeId, store]) => {
    const storeOffers = offers.filter((o) => String(o.store_id) === storeId)
    // Top 3: prioritise biggest savings, fallback to cheapest
    const withSavings = storeOffers
      .filter((o) => o.original_price && o.original_price > o.price)
      .sort((a, b) => {
        const aSave = savingPct(a.price, a.original_price!)
        const bSave = savingPct(b.price, b.original_price!)
        return bSave - aSave
      })
    const topDeals = withSavings.length >= 3
      ? withSavings.slice(0, 3)
      : [...withSavings, ...storeOffers.filter((o) => !withSavings.includes(o))].slice(0, 3)

    return {
      storeId,
      storeName: store.name,
      storeSlug: store.slug,
      storeColor: store.color,
      offerCount: storeOffers.length,
      topDeals,
    }
  })

  const totalOffers = offers.length

  // JSON-LD
  const jsonLd = [
    {
      '@context': 'https://schema.org',
      '@type': 'ItemList',
      name: `Supermarkt Angebote ${cityName} KW${week} ${year}`,
      description: `Aktuelle Wochenangebote in ${cityName} von Lidl, Aldi Süd, Penny, Kaufland und Netto`,
      numberOfItems: Object.keys(STORES).length,
      itemListElement: storeGroups.map((sg, idx) => ({
        '@type': 'ListItem',
        position: idx + 1,
        name: `${sg.storeName} Angebote ${cityName}`,
        url: `${canonicalUrl}/${sg.storeSlug}`,
      })),
    },
    {
      '@context': 'https://schema.org',
      '@type': 'BreadcrumbList',
      itemListElement: [
        {
          '@type': 'ListItem',
          position: 1,
          name: 'Startseite',
          item: baseUrl,
        },
        {
          '@type': 'ListItem',
          position: 2,
          name: 'Angebote',
          item: `${baseUrl}/angebote`,
        },
        {
          '@type': 'ListItem',
          position: 3,
          name: cityName,
          item: canonicalUrl,
        },
      ],
    },
  ]

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <main className="min-h-screen grainy-bg pb-20">
        {/* Header bar */}
        <div className="bg-white border-b-4 border-[#1a1c1c] py-4 px-6">
          <div className="max-w-6xl mx-auto flex items-center justify-between">
            <Link href={baseUrl} className="font-headline font-black text-2xl text-[#1a1c1c] hover:text-[#22C55E] transition-colors">
              Papierbox
            </Link>
            <Link
              href={baseUrl}
              className="font-body text-sm font-semibold text-[#22C55E] hover:underline"
            >
              Preise vergleichen &rarr;
            </Link>
          </div>
        </div>

        <div className="max-w-6xl mx-auto px-4 sm:px-6 pt-10">

          {/* Breadcrumb */}
          <nav className="flex items-center gap-2 text-sm font-body text-[#3d4a3d] mb-8" aria-label="Breadcrumb">
            <Link href={baseUrl} className="hover:text-[#22C55E] transition-colors">Startseite</Link>
            <span className="text-[#1a1c1c]">/</span>
            <span className="font-semibold text-[#1a1c1c]">Angebote</span>
            <span className="text-[#1a1c1c]">/</span>
            <span className="font-semibold text-[#1a1c1c]">{cityName}</span>
          </nav>

          {/* Hero heading */}
          <div className="mb-10">
            <h1 className="font-headline font-black text-4xl sm:text-5xl text-[#1a1c1c] leading-tight mb-3">
              Supermarkt Angebote {cityName}{' '}
              <span className="text-[#22C55E]">— KW{week} {year}</span>
            </h1>
            <p className="font-body text-lg text-[#3d4a3d] font-semibold">
              {totalOffers} Angebote aus 5 Supermärkten diese Woche
            </p>
            <p className="font-body text-base text-[#3d4a3d] mt-1">
              Diese Angebote gelten in allen Filialen in {cityName} und Umgebung.
            </p>
          </div>

          {/* Store cards grid */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-14">
            {storeGroups.map((sg) => (
              <Link
                key={sg.storeId}
                href={`/angebote/${city}/${sg.storeSlug}`}
                className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-6 flex flex-col gap-4 hover:shadow-neo-hover hover:-translate-y-0.5 transition-all"
              >
                {/* Store header */}
                <div className="flex items-center justify-between">
                  <span
                    className="font-headline font-black text-2xl"
                    style={{ color: sg.storeColor }}
                  >
                    {sg.storeName}
                  </span>
                  <span className="bg-[#f0fdf4] border-2 border-[#22C55E] text-[#22C55E] font-black text-sm px-3 py-1 rounded-full">
                    {sg.offerCount} Angebote
                  </span>
                </div>

                {/* Top 3 deals */}
                {sg.topDeals.length === 0 ? (
                  <p className="font-body text-sm text-[#3d4a3d]">Keine aktuellen Angebote</p>
                ) : (
                  <ul className="flex flex-col gap-3">
                    {sg.topDeals.map((deal, i) => (
                      <li key={i} className="flex items-start justify-between gap-2">
                        <div className="flex-1 min-w-0">
                          <p className="font-headline font-black text-sm text-[#1a1c1c] truncate">
                            {deal.product_name}
                          </p>
                          {deal.unit && (
                            <p className="font-body text-xs text-[#3d4a3d]">{deal.unit}</p>
                          )}
                        </div>
                        <div className="text-right shrink-0">
                          <p className="font-black text-base text-[#22C55E]">
                            €{formatPrice(deal.price)}
                          </p>
                          {deal.original_price && deal.original_price > deal.price && (
                            <p className="text-xs font-black text-[#22C55E]">
                              -{savingPct(deal.price, deal.original_price)}%
                            </p>
                          )}
                        </div>
                      </li>
                    ))}
                  </ul>
                )}

                {/* CTA */}
                <div className="mt-auto pt-2 border-t-2 border-[#f0f0f0]">
                  <span className="font-body text-sm font-semibold text-[#22C55E]">
                    Alle {sg.storeName} Angebote &rarr;
                  </span>
                </div>
              </Link>
            ))}
          </div>

          {/* CTA section */}
          <div className="bg-[#22C55E] border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-8 flex flex-col sm:flex-row items-center justify-between gap-6">
            <div>
              <p className="font-headline font-black text-2xl text-white mb-1">
                Produkt direkt suchen
              </p>
              <p className="font-body text-white/90 text-base">
                Preise von allen 5 Supermärkten auf einen Blick vergleichen.
              </p>
            </div>
            <a
              href="https://www.papierbox.eu"
              className="bg-white border-4 border-[#1a1c1c] rounded-2xl shadow-neo font-headline font-black text-[#1a1c1c] px-8 py-3 text-lg hover:shadow-neo-hover hover:-translate-y-0.5 transition-all whitespace-nowrap"
            >
              Jetzt vergleichen
            </a>
          </div>

        </div>
      </main>
    </>
  )
}
