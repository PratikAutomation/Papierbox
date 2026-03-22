"use client";

import { useState } from "react";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import Link from "next/link";

export default function HowItWorks() {
  const [lang, setLang] = useState<"en" | "de">("en");

  const t = {
    en: {
      heroHeadline: "Stupid simple. Seriously.",
      heroSubtitle: "Three steps between you and the best grocery deal in your city.",
      step1Number: "01",
      step1Title: "Search any product",
      step1Text: "Type what you need. In English or German. Misspell it — our search figures it out. Butter, Buttter, बटर — we got you.",
      step1Tag1: "English 🇬🇧",
      step1Tag2: "Deutsch 🇩🇪",
      step1Tag3: "Typo-proof 💪",
      step2Number: "02",
      step2Title: "Pick your city",
      step2Text: "We cover 25 German cities. Hamburg, Berlin, Munich, Regensburg, Heidelberg — wherever you are, we know what's cheap near you.",
      step2Tag: "25 cities and counting 📍",
      step3Number: "03",
      step3Title: "See every price. Cheapest first.",
      step3Text: "Every supermarket's price, sorted from cheapest to most expensive. Real offers from real weekly leaflets. See exactly how much you're saving.",
      step3Tag: "Updated twice a week 🔄",
      storesHeadline: "Supermarkets we track",
      storesSubtext: "More stores coming soon.",
      ctaButton: "Try it now — it's free →",
    },
    de: {
      heroHeadline: "Dumm einfach. Wirklich.",
      heroSubtitle: "Drei Schritte zwischen dir und dem besten Angebot.",
      step1Number: "01",
      step1Title: "Suche ein Produkt",
      step1Text: "Tippe ein, was du brauchst. Auf Englisch oder Deutsch. Vertipp dich ruhig — wir verstehen's trotzdem.",
      step1Tag1: "English 🇬🇧",
      step1Tag2: "Deutsch 🇩🇪",
      step1Tag3: "Tippfehler-sicher 💪",
      step2Number: "02",
      step2Title: "Wähle deine Stadt",
      step2Text: "25 deutsche Städte. Egal wo du bist, wir wissen, wo es günstig ist.",
      step2Tag: "25 Städte und mehr folgen 📍",
      step3Number: "03",
      step3Title: "Sieh alle Preise. Günstigster zuerst.",
      step3Text: "Alle Supermarkt-Preise, sortiert vom günstigsten zum teuersten. Echte Angebote aus echten Prospekten.",
      step3Tag: "Zweimal pro Woche aktualisiert 🔄",
      storesHeadline: "Supermärkte, die wir tracken",
      storesSubtext: "Weitere Stores folgen.",
      ctaButton: "Jetzt ausprobieren — kostenlos →",
    },
  };

  const l = t[lang];

  const stores = [
    { name: "Lidl", color: "#0050AA" },
    { name: "Aldi", color: "#00A0E3" },
    { name: "Penny", color: "#E30613" },
    { name: "Kaufland", color: "#E30613" },
    { name: "Netto", color: "#FFD500" },
  ];

  return (
    <>
      <Header lang={lang} setLang={setLang} />
      <main className="pt-32 pb-16 grainy-bg">

        {/* Hero */}
        <section className="max-w-4xl mx-auto px-6 mb-20 text-center">
          <h1 className="font-headline font-black text-5xl md:text-7xl tracking-tight leading-[1.1] text-[#1a1c1c] mb-6">
            {l.heroHeadline}
          </h1>
          <p className="font-body text-xl md:text-2xl text-[#3d4a3d] font-semibold">
            {l.heroSubtitle}
          </p>
        </section>

        {/* Steps */}
        <section className="max-w-5xl mx-auto px-6 space-y-12 mb-20">

          {/* Step 1 */}
          <div className="bg-white border-4 border-[#1a1c1c] rounded-[2.5rem] p-8 md:p-12 shadow-neo rotate-[-1deg] hover:rotate-0 transition-transform duration-300">
            <div className="font-headline font-black text-8xl md:text-9xl text-[#22c55e] leading-none mb-6">
              {l.step1Number}
            </div>
            <h2 className="font-headline font-black text-3xl md:text-4xl text-[#1a1c1c] mb-4 uppercase tracking-tight">
              {l.step1Title}
            </h2>
            <p className="font-body text-lg md:text-xl text-[#3d4a3d] leading-relaxed mb-6">
              {l.step1Text}
            </p>
            <div className="flex flex-wrap gap-3">
              <span className="inline-block bg-[#f9f9f9] border-2 border-[#1a1c1c] rounded-full px-4 py-2 font-headline font-bold text-sm text-[#1a1c1c] shadow-[2px_2px_0px_0px_#1a1c1c]">
                {l.step1Tag1}
              </span>
              <span className="inline-block bg-[#f9f9f9] border-2 border-[#1a1c1c] rounded-full px-4 py-2 font-headline font-bold text-sm text-[#1a1c1c] shadow-[2px_2px_0px_0px_#1a1c1c]">
                {l.step1Tag2}
              </span>
              <span className="inline-block bg-[#f9f9f9] border-2 border-[#1a1c1c] rounded-full px-4 py-2 font-headline font-bold text-sm text-[#1a1c1c] shadow-[2px_2px_0px_0px_#1a1c1c]">
                {l.step1Tag3}
              </span>
            </div>
          </div>

          {/* Step 2 */}
          <div className="bg-white border-4 border-[#1a1c1c] rounded-[2.5rem] p-8 md:p-12 shadow-neo rotate-[1deg] hover:rotate-0 transition-transform duration-300">
            <div className="font-headline font-black text-8xl md:text-9xl text-[#22c55e] leading-none mb-6">
              {l.step2Number}
            </div>
            <h2 className="font-headline font-black text-3xl md:text-4xl text-[#1a1c1c] mb-4 uppercase tracking-tight">
              {l.step2Title}
            </h2>
            <p className="font-body text-lg md:text-xl text-[#3d4a3d] leading-relaxed mb-6">
              {l.step2Text}
            </p>
            <div className="flex flex-wrap gap-3">
              <span className="inline-block bg-[#f9f9f9] border-2 border-[#1a1c1c] rounded-full px-4 py-2 font-headline font-bold text-sm text-[#1a1c1c] shadow-[2px_2px_0px_0px_#1a1c1c]">
                {l.step2Tag}
              </span>
            </div>
          </div>

          {/* Step 3 */}
          <div className="bg-white border-4 border-[#1a1c1c] rounded-[2.5rem] p-8 md:p-16 shadow-[6px_6px_0px_0px_#1a1c1c] hover:shadow-[8px_8px_0px_0px_#1a1c1c] transition-shadow duration-300">
            <div className="font-headline font-black text-8xl md:text-9xl text-[#22c55e] leading-none mb-6">
              {l.step3Number}
            </div>
            <h2 className="font-headline font-black text-3xl md:text-5xl text-[#1a1c1c] mb-4 uppercase tracking-tight">
              {l.step3Title}
            </h2>
            <p className="font-body text-lg md:text-xl text-[#3d4a3d] leading-relaxed mb-6">
              {l.step3Text}
            </p>
            <div className="flex flex-wrap gap-3">
              <span className="inline-block bg-[#22c55e] border-2 border-[#1a1c1c] rounded-full px-4 py-2 font-headline font-bold text-sm text-white shadow-[2px_2px_0px_0px_#1a1c1c]">
                {l.step3Tag}
              </span>
            </div>
          </div>

        </section>

        {/* Stores Section */}
        <section className="max-w-5xl mx-auto px-6 mb-20">
          <div className="bg-white border-4 border-[#1a1c1c] rounded-[2.5rem] p-8 md:p-12 shadow-neo text-center">
            <h2 className="font-headline font-black text-3xl md:text-4xl text-[#1a1c1c] mb-8 uppercase tracking-tight">
              {l.storesHeadline}
            </h2>
            <div className="flex flex-wrap justify-center gap-4 mb-6">
              {stores.map((store) => (
                <div
                  key={store.name}
                  className="bg-white border-4 border-[#1a1c1c] rounded-[1.5rem] px-8 py-4 shadow-[3px_3px_0px_0px_#1a1c1c] hover:shadow-[5px_5px_0px_0px_#1a1c1c] hover:-translate-x-[2px] hover:-translate-y-[2px] transition-all"
                  style={{
                    backgroundColor: store.color === "#FFD500" ? store.color : "white",
                  }}
                >
                  <span
                    className="font-headline font-black text-2xl"
                    style={{
                      color: store.color === "#FFD500" ? "#1a1c1c" : store.color,
                    }}
                  >
                    {store.name}
                  </span>
                </div>
              ))}
            </div>
            <p className="font-body text-lg text-[#3d4a3d] font-semibold">
              {l.storesSubtext}
            </p>
          </div>
        </section>

        {/* CTA */}
        <section className="max-w-3xl mx-auto px-6 text-center">
          <Link
            href="/"
            className="inline-block bg-[#22c55e] text-white font-headline font-black text-xl md:text-2xl px-12 py-6 rounded-full border-4 border-[#1a1c1c] shadow-neo hover:shadow-neo-hover hover:translate-x-[2px] hover:translate-y-[2px] transition-all active:translate-x-[4px] active:translate-y-[4px] active:shadow-none"
          >
            {l.ctaButton}
          </Link>
        </section>

      </main>
      <Footer lang={lang} />
    </>
  );
}
