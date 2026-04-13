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

const STORES_BY_SLUG: Record<string, { id: string; name: string; color: string }> = {
  'lidl': { id: '1', name: 'Lidl', color: '#0050AA' },
  'aldi-sued': { id: '2', name: 'Aldi Süd', color: '#00A0E2' },
  'penny': { id: '3', name: 'Penny', color: '#CC0000' },
  'kaufland': { id: '4', name: 'Kaufland', color: '#E30613' },
  'netto': { id: '5', name: 'Netto', color: '#FFCC00' },
}

const STORE_SLUGS = Object.keys(STORES_BY_SLUG)

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface Offer {
  store_id: string
  brand: string | null
  product_name: string
  product_name_en: string | null
  category_en: string | null
  price: number
  original_price: number | null
  unit: string | null
  valid_from: string
  valid_to: string
  is_offer: boolean
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function formatPrice(price: number): string {
  return price.toFixed(2).replace('.', ',')
}

function savingPct(price: number, originalPrice: number): number {
  return Math.round(((originalPrice - price) / originalPrice) * 100)
}

function formatDateDE(iso: string): string {
  const [year, month, day] = iso.split('-')
  return `${day}.${month}.${year}`
}

// ---------------------------------------------------------------------------
// Static params: 25 cities × 5 stores = 125 combinations
// ---------------------------------------------------------------------------

export async function generateStaticParams() {
  const params: { city: string; store: string }[] = []
  for (const city of Object.keys(CITIES)) {
    for (const store of STORE_SLUGS) {
      params.push({ city, store })
    }
  }
  return params
}

// ---------------------------------------------------------------------------
// Metadata
// ---------------------------------------------------------------------------

export async function generateMetadata({
  params,
}: {
  params: Promise<{ city: string; store: string }>
}): Promise<Metadata> {
  const { city, store } = await params
  const cityName = CITIES[city] ?? city
  const storeInfo = STORES_BY_SLUG[store]
  const storeName = storeInfo?.name ?? store
  const baseUrl = 'https://www.papierbox.eu'
  const canonicalUrl = `${baseUrl}/angebote/${city}/${store}`

  // Fetch count + valid_to for description
  const today = new Date().toISOString().split('T')[0]
  const { data, count } = await supabase
    .from('offers')
    .select('valid_to', { count: 'exact', head: false })
    .eq('store_id', storeInfo?.id ?? '')
    .lte('valid_from', today)
    .gte('valid_to', today)
    .eq('is_offer', true)
    .limit(1)

  const offerCount = count ?? 0
  const validTo = data?.[0]?.valid_to ? formatDateDE(data[0].valid_to) : ''
  const validToStr = validTo ? `, gültig bis ${validTo}` : ''

  return {
    title: `${storeName} Angebote ${cityName} diese Woche | Papierbox`,
    description: `Alle ${storeName} Angebote in ${cityName} — ${offerCount} Angebote${validToStr}. Günstigste Preise vergleichen auf Papierbox.`,
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
      title: `${storeName} Angebote ${cityName} diese Woche | Papierbox`,
      description: `Alle ${storeName} Angebote in ${cityName} — ${offerCount} Angebote${validToStr}. Günstigste Preise vergleichen auf Papierbox.`,
    },
  }
}

// ---------------------------------------------------------------------------
// Page component
// ---------------------------------------------------------------------------

export default async function CityStorePage({
  params,
}: {
  params: Promise<{ city: string; store: string }>
}) {
  const { city, store } = await params
  const cityName = CITIES[city] ?? city
  const storeInfo = STORES_BY_SLUG[store]
  const storeName = storeInfo?.name ?? store
  const baseUrl = 'https://www.papierbox.eu'
  const canonicalUrl = `${baseUrl}/angebote/${city}/${store}`

  const today = new Date().toISOString().split('T')[0]

  // Fetch all offers for this store
  const { data } = await supabase
    .from('offers')
    .select('*')
    .eq('store_id', storeInfo?.id ?? '')
    .lte('valid_from', today)
    .gte('valid_to', today)
    .eq('is_offer', true)
    .order('is_offer', { ascending: false })

  const offers: Offer[] = (data ?? []) as Offer[]
  const offerCount = offers.length

  // Determine date range from data
  const validFrom = offers[0]?.valid_from ?? today
  const validTo = offers[0]?.valid_to ?? today
  const validFromFmt = formatDateDE(validFrom)
  const validToFmt = formatDateDE(validTo)

  // JSON-LD
  const jsonLd = [
    {
      '@context': 'https://schema.org',
      '@type': 'ItemList',
      name: `${storeName} Angebote ${cityName}`,
      description: `Aktuelle ${storeName} Wochenangebote in ${cityName}, gültig ${validFromFmt} bis ${validToFmt}`,
      numberOfItems: offerCount,
      itemListElement: offers.slice(0, 50).map((offer, idx) => ({
        '@type': 'ListItem',
        position: idx + 1,
        name: offer.product_name,
        item: {
          '@type': 'Product',
          name: offer.product_name,
          offers: {
            '@type': 'Offer',
            price: offer.price.toFixed(2),
            priceCurrency: 'EUR',
            priceValidUntil: offer.valid_to,
            availability: 'https://schema.org/InStock',
          },
        },
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
          item: `${baseUrl}/angebote/${city}`,
        },
        {
          '@type': 'ListItem',
          position: 4,
          name: storeName,
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
          <nav className="flex items-center gap-2 text-sm font-body text-[#3d4a3d] mb-8 flex-wrap" aria-label="Breadcrumb">
            <Link href={baseUrl} className="hover:text-[#22C55E] transition-colors">Startseite</Link>
            <span className="text-[#1a1c1c]">/</span>
            <span className="font-semibold text-[#1a1c1c]">Angebote</span>
            <span className="text-[#1a1c1c]">/</span>
            <Link href={`/angebote/${city}`} className="hover:text-[#22C55E] transition-colors font-semibold">{cityName}</Link>
            <span className="text-[#1a1c1c]">/</span>
            <span className="font-semibold text-[#1a1c1c]">{storeName}</span>
          </nav>

          {/* Hero heading */}
          <div className="mb-10">
            <h1 className="font-headline font-black text-4xl sm:text-5xl text-[#1a1c1c] leading-tight mb-3">
              <span style={{ color: storeInfo?.color ?? '#22C55E' }}>{storeName}</span>{' '}
              Angebote {cityName}{' '}
              <span className="text-[#22C55E] text-3xl sm:text-4xl">
                — gültig {validFromFmt} bis {validToFmt}
              </span>
            </h1>
            <p className="font-body text-lg text-[#3d4a3d] font-semibold">
              {offerCount > 0 ? `${offerCount} Angebote diese Woche` : 'Keine aktuellen Angebote'}
            </p>
          </div>

          {/* Offer grid */}
          {offerCount === 0 ? (
            <div className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-10 text-center mb-14">
              <p className="font-headline font-black text-2xl text-[#1a1c1c] mb-3">
                Keine aktuellen Angebote
              </p>
              <p className="font-body text-[#3d4a3d]">
                Für {storeName} in {cityName} sind diese Woche keine Angebote verfügbar.
                Bitte schaue nächste Woche wieder vorbei.
              </p>
              <Link
                href={`/angebote/${city}`}
                className="inline-block mt-6 bg-[#22C55E] border-4 border-[#1a1c1c] rounded-2xl shadow-neo font-headline font-black text-white px-6 py-3 hover:shadow-neo-hover hover:-translate-y-0.5 transition-all"
              >
                Andere Supermärkte ansehen
              </Link>
            </div>
          ) : (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5 mb-14">
              {offers.map((offer, i) => {
                const saving =
                  offer.original_price && offer.original_price > offer.price
                    ? savingPct(offer.price, offer.original_price)
                    : 0

                return (
                  <div
                    key={i}
                    className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-6 flex justify-between items-start"
                  >
                    <div className="flex-1 min-w-0 pr-3">
                      <p className="font-headline font-black text-xl text-[#1a1c1c] leading-tight">
                        {offer.product_name}
                      </p>
                      {offer.brand && (
                        <p className="font-body text-sm text-[#3d4a3d] font-semibold mt-0.5">
                          {offer.brand}
                        </p>
                      )}
                      {offer.unit && (
                        <p className="font-body text-sm text-[#3d4a3d] mt-1">{offer.unit}</p>
                      )}
                    </div>
                    <div className="text-right shrink-0">
                      <p className="font-black text-2xl text-[#22C55E]">
                        €{formatPrice(offer.price)}
                      </p>
                      {offer.original_price && offer.original_price > offer.price && (
                        <p className="text-sm line-through text-[#3d4a3d]">
                          €{formatPrice(offer.original_price)}
                        </p>
                      )}
                      {saving > 0 && (
                        <p className="text-xs font-black text-[#22C55E]">-{saving}%</p>
                      )}
                    </div>
                  </div>
                )
              })}
            </div>
          )}

          {/* CTA section */}
          <div className="bg-[#22C55E] border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-8 flex flex-col sm:flex-row items-center justify-between gap-6">
            <div>
              <p className="font-headline font-black text-2xl text-white mb-1">
                Alle 5 Supermärkte in {cityName} vergleichen
              </p>
              <p className="font-body text-white/90 text-base">
                Finde den günstigsten Preis für jedes Produkt — kostenlos und ohne Anmeldung.
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
