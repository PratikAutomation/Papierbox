import Link from "next/link";
import Image from "next/image";

interface FooterProps {
  lang: "en" | "de";
}

const translations = {
  en: {
    description: "Helping expats defeat German grocery prices since 2024. No more price tag shocks.",
    explore: "Explore",
    ourStory: "Our Story",
    howItWorks: "How It Works",
    rules: "Rules",
    impressum: "Impressum",
    privacy: "Privacy",
    contact: "Contact Us",
    copyright: "© 2026 Papierbox — prices change, we don't sleep.",
    region: "Region: Germany (DE)",
  },
  de: {
    description: "Wir helfen Expats, die besten Lebensmittelpreise zu finden. Keine Preisschocks mehr.",
    explore: "Erkunden",
    ourStory: "Unsere Geschichte",
    howItWorks: "So funktioniert's",
    rules: "Rechtliches",
    impressum: "Impressum",
    privacy: "Datenschutz",
    contact: "Kontakt",
    copyright: "© 2026 Papierbox — Preise ändern sich, wir schlafen nicht.",
    region: "Region: Deutschland (DE)",
  },
};

export default function Footer({ lang }: FooterProps) {
  const t = translations[lang];

  return (
    <footer className="bg-white border-t-4 border-[#1a1c1c] py-20 mt-20 grainy-bg">
      <div className="max-w-7xl mx-auto px-8 grid grid-cols-1 md:grid-cols-3 gap-16">
        <div className="space-y-6">
          <Image src="/logo.png" alt="Papierbox" width={524} height={476} className="h-16 sm:h-20 w-auto" />
          <p className="text-[#3d4a3d] text-lg font-bold leading-tight">
            {t.description}
          </p>
        </div>
        <div className="flex flex-col gap-8">
          <h4 className="font-headline font-black text-xl uppercase tracking-widest text-[#22c55e]">
            {t.explore}
          </h4>
          <ul className="space-y-4 font-bold text-xl text-[#1a1c1c]">
            <li>
              <Link href="/story" className="hover:text-[#22c55e] transition-all hover:pl-2">
                {t.ourStory}
              </Link>
            </li>
            <li>
              <Link href="/how-it-works" className="hover:text-[#22c55e] transition-all hover:pl-2">
                {t.howItWorks}
              </Link>
            </li>
          </ul>
        </div>
        <div className="flex flex-col gap-8">
          <h4 className="font-headline font-black text-xl uppercase tracking-widest text-[#22c55e]">
            {t.rules}
          </h4>
          <ul className="space-y-4 font-bold text-xl text-[#1a1c1c]">
            <li>
              <Link href="/impressum" className="hover:text-[#22c55e] transition-all hover:pl-2">
                {t.impressum}
              </Link>
            </li>
            <li>
              <Link href="/privacy" className="hover:text-[#22c55e] transition-all hover:pl-2">
                {t.privacy}
              </Link>
            </li>
            <li>
              <Link href="/contact" className="hover:text-[#22c55e] transition-all hover:pl-2">
                {t.contact}
              </Link>
            </li>
          </ul>
        </div>
      </div>
      <div className="max-w-7xl mx-auto px-8 mt-20 pt-10 border-t-2 border-[#1a1c1c]/5">
        <div className="flex flex-col md:flex-row justify-between items-center gap-8 text-sm font-black text-[#3d4a3d] uppercase tracking-widest">
          <p>{t.copyright}</p>
          <div className="flex items-center gap-4 bg-white border-2 border-[#1a1c1c] px-6 py-3 rounded-full shadow-[2px_2px_0px_0px_#1a1c1c]">
            <span className="material-symbols-outlined text-lg">location_on</span>
            <span>{t.region}</span>
          </div>
        </div>
      </div>
    </footer>
  );
}
