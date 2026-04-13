import type { Metadata } from 'next'
import Link from 'next/link'
import { supabase } from '@/lib/supabase'

export const dynamic = 'force-dynamic'
export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Lebensmittel Preisvergleich Deutschland | Papierbox',
  description:
    'Preisvergleich für alle Lebensmittelkategorien — Butter, Milch, Fleisch, Getränke und mehr. Alle 5 Supermärkte verglichen.',
  alternates: {
    canonical: 'https://www.papierbox.eu/preisvergleich',
  },
}

function slugify(s: string): string {
  return s.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '')
}

interface CategoryCount {
  category: string
  count: number
}

async function getCategories(): Promise<CategoryCount[]> {
  const today = new Date().toISOString().split('T')[0]
  const { data, error } = await supabase
    .from('offers')
    .select('category_en')
    .lte('valid_from', today)
    .gte('valid_to', today)
    .eq('is_offer', true)

  if (error || !data) return []

  const countMap = new Map<string, number>()
  for (const row of data) {
    if (!row.category_en) continue
    countMap.set(row.category_en, (countMap.get(row.category_en) ?? 0) + 1)
  }

  return Array.from(countMap.entries())
    .map(([category, count]) => ({ category, count }))
    .sort((a, b) => b.count - a.count)
}

export default async function PreisvergleichIndex() {
  const categories = await getCategories()

  return (
    <main className="pt-24 pb-20 grainy-bg min-h-screen">
      {/* Header */}
      <section className="max-w-5xl mx-auto px-6 mb-12 text-center">
        <p className="text-xs font-black uppercase tracking-widest text-[#22c55e] mb-3">
          Preisvergleich
        </p>
        <h1 className="font-headline font-black text-4xl md:text-6xl tracking-tight leading-[1.1] text-[#1a1c1c] mb-4">
          Lebensmittel Preisvergleich
          <br />
          <span className="text-[#22c55e]">— Alle Kategorien</span>
        </h1>
        <p className="font-body text-lg md:text-xl text-[#3d4a3d] font-semibold max-w-2xl mx-auto">
          Vergleiche Preise aus Lidl, Aldi, Penny, Kaufland &amp; Netto —
          wöchentlich aktualisiert.
        </p>
      </section>

      {/* Breadcrumb */}
      <nav className="max-w-5xl mx-auto px-6 mb-8" aria-label="Breadcrumb">
        <ol className="flex items-center gap-2 text-sm font-bold text-[#3d4a3d]">
          <li>
            <Link href="/" className="hover:text-[#22c55e] transition-colors">
              Papierbox
            </Link>
          </li>
          <li className="text-[#1a1c1c]/30">{'/'}</li>
          <li className="text-[#1a1c1c]">Preisvergleich</li>
        </ol>
      </nav>

      {categories.length === 0 ? (
        <section className="max-w-5xl mx-auto px-6">
          <div className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-12 text-center">
            <p className="font-headline font-black text-2xl text-[#1a1c1c] mb-2">
              Keine aktuellen Angebote
            </p>
            <p className="text-[#3d4a3d]">
              Gerade liegen keine aktiven Angebote vor. Schau bald wieder vorbei.
            </p>
          </div>
        </section>
      ) : (
        <section className="max-w-5xl mx-auto px-6">
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-5">
            {categories.map(({ category, count }) => (
              <Link
                key={category}
                href={`/preisvergleich/${slugify(category)}`}
                className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-6 hover:scale-[1.02] hover:-translate-y-0.5 transition-all block group"
              >
                <p className="font-headline font-black text-xl text-[#1a1c1c] group-hover:text-[#22c55e] transition-colors mb-1">
                  {category}
                </p>
                <p className="text-[#3d4a3d] text-sm font-semibold">
                  {count} {count === 1 ? 'Angebot' : 'Angebote'} diese Woche
                </p>
              </Link>
            ))}
          </div>
        </section>
      )}

      {/* CTA */}
      <section className="max-w-5xl mx-auto px-6 mt-16 text-center">
        <div className="bg-[#22c55e] border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-8 md:p-12">
          <p className="font-headline font-black text-2xl md:text-3xl text-white mb-4">
            Suche direkt nach einem Produkt
          </p>
          <p className="text-white/90 font-semibold mb-6">
            Butter, Milch, Kaffee — such einfach, was du brauchst.
          </p>
          <Link
            href="https://www.papierbox.eu"
            className="inline-block bg-white text-[#1a1c1c] font-headline font-black text-lg px-8 py-4 rounded-full border-4 border-[#1a1c1c] shadow-[4px_4px_0px_0px_#1a1c1c] hover:shadow-[2px_2px_0px_0px_#1a1c1c] hover:translate-x-[2px] hover:translate-y-[2px] transition-all"
          >
            Jetzt in deiner Stadt suchen &rarr;
          </Link>
        </div>
      </section>
    </main>
  )
}
