"use client";

import { useState } from "react";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import Link from "next/link";

export default function OurStory() {
  const [lang, setLang] = useState<"en" | "de">("en");

  const t = {
    en: {
      heroHeadline: "I was spending €100 more than I needed to. Every. Single. Month.",
      heroSubtitle: "Here's how I fixed it.",
      block1Title: "The Arrival",
      block1Text: "Three years ago, I moved to Germany. I spoke zero German. Shopping was terrifying. I'd stand in Aldi staring at labels, grabbing whatever looked familiar, praying it wasn't cat food. 😰",
      block2Title: "The Prospekt Trap",
      block2Text: "Then I discovered Prospekte — those weekly leaflets every German swears by. So I downloaded KaufDa, Marktguru, and three other apps. Every week I'd spend 30 minutes scrolling through digital brochures, comparing Lidl vs Aldi vs Penny...",
      block3Title: "The Breaking Point",
      block3Monday: "Monday: Bought chicken at Kaufland — €6.49",
      block3Tuesday: "Tuesday: Saw the SAME chicken at Penny — €4.99",
      block3Lost: "That's €1.50 gone. On ONE item.",
      block3Continues: "This kept happening. Butter, milk, rice — always the wrong store at the wrong time. By month's end: €50-100 wasted. That's a weekend trip to Prague. Gone on groceries.",
      block4Title: "The Fix",
      block4Line1: "So I built Papierbox.",
      block4Line2: "One search. Every supermarket. Cheapest first.",
      block4Line3: "No brochures. No 5 apps. No guessing.",
      block4Line4: "Type what you need. See where to buy it.",
      block4Highlight: "It takes 5 seconds to save real money.",
      block5Text: "Whether you just landed in Germany or you've been here for years — grocery shopping doesn't have to feel like a treasure hunt.",
      ctaButton: "Start Saving Now →",
    },
    de: {
      heroHeadline: "Ich habe jeden Monat €100 mehr ausgegeben als nötig. Jeden. Einzelnen. Monat.",
      heroSubtitle: "So habe ich das geändert.",
      block1Title: "Die Ankunft",
      block1Text: "Vor drei Jahren bin ich nach Deutschland gezogen. Kein Wort Deutsch. Einkaufen war der Horror. Ich stand bei Aldi vor Regalen voller Etiketten, die ich nicht lesen konnte, und hoffte einfach, dass es kein Katzenfutter war. 😰",
      block2Title: "Die Prospekt-Falle",
      block2Text: "Dann entdeckte ich Prospekte. KaufDa, Marktguru und drei andere Apps. Jede Woche 30 Minuten lang durch digitale Prospekte scrollen, Lidl mit Aldi vergleichen...",
      block3Title: "Der Wendepunkt",
      block3Monday: "Montag: Hähnchen bei Kaufland gekauft — €6,49",
      block3Tuesday: "Dienstag: Dasselbe Hähnchen bei Penny gesehen — €4,99",
      block3Lost: "€1,50 weg. Bei EINEM Artikel.",
      block3Continues: "Das passierte immer wieder. Butter, Milch, Reis — immer der falsche Laden zur falschen Zeit. Am Monatsende: €50-100 verschwendet. Das ist ein Wochenendtrip nach Prag. Weg für Lebensmittel.",
      block4Title: "Die Lösung",
      block4Line1: "Also habe ich Papierbox gebaut.",
      block4Line2: "Eine Suche. Alle Supermärkte. Günstigster Preis zuerst.",
      block4Line3: "Keine Prospekte. Keine 5 Apps. Kein Raten.",
      block4Line4: "Tippe ein, was du brauchst. Sieh, wo du es kaufen kannst.",
      block4Highlight: "Es dauert 5 Sekunden, um echtes Geld zu sparen.",
      block5Text: "Ob du gerade in Deutschland angekommen bist oder schon seit Jahren hier lebst — Einkaufen muss sich nicht wie eine Schatzsuche anfühlen.",
      ctaButton: "Jetzt sparen →",
    },
  };

  const l = t[lang];

  return (
    <>
      <Header lang={lang} setLang={setLang} />
      <main className="pt-32 pb-16 grainy-bg">
        {/* Hero */}
        <section className="max-w-4xl mx-auto px-6 mb-20">
          <h1 className="font-headline font-black text-4xl md:text-6xl tracking-tight leading-[1.1] text-[#1a1c1c] mb-6">
            {l.heroHeadline}
          </h1>
          <p className="font-headline font-bold text-2xl md:text-3xl text-[#22c55e] squiggle">
            {l.heroSubtitle}
          </p>
        </section>

        {/* Story Blocks */}
        <section className="max-w-4xl mx-auto px-6 space-y-12">

          {/* Block 1 - The Arrival */}
          <div
            className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] p-8 md:p-12 shadow-neo rotate-[-1deg] hover:rotate-0 transition-transform duration-300"
          >
            <h2 className="font-headline font-black text-2xl md:text-3xl text-[#22c55e] mb-4 uppercase tracking-tight">
              {l.block1Title}
            </h2>
            <p className="font-body text-lg md:text-xl text-[#1a1c1c] leading-relaxed">
              {l.block1Text}
            </p>
          </div>

          {/* Block 2 - The Prospekt Trap */}
          <div
            className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] p-8 md:p-12 shadow-neo rotate-[1deg] hover:rotate-0 transition-transform duration-300"
          >
            <h2 className="font-headline font-black text-2xl md:text-3xl text-[#22c55e] mb-4 uppercase tracking-tight">
              {l.block2Title}
            </h2>
            <p className="font-body text-lg md:text-xl text-[#1a1c1c] leading-relaxed">
              {l.block2Text}
            </p>
          </div>

          {/* Block 3 - The Breaking Point */}
          <div
            className="bg-white border-4 border-[#1a1c1c] rounded-[2.5rem] p-8 md:p-12 shadow-neo"
          >
            <h2 className="font-headline font-black text-2xl md:text-3xl text-[#22c55e] mb-6 uppercase tracking-tight">
              {l.block3Title}
            </h2>

            {/* Price comparison mini-card */}
            <div className="bg-[#f9f9f9] border-4 border-[#1a1c1c] rounded-[1.5rem] p-6 mb-6 space-y-3">
              <p className="font-body font-bold text-lg text-[#1a1c1c]">
                {l.block3Monday}
              </p>
              <p className="font-body font-bold text-lg text-[#1a1c1c]">
                {l.block3Tuesday}
              </p>
              <p className="font-headline font-black text-xl text-[#22c55e] mt-4">
                {l.block3Lost}
              </p>
            </div>

            <p className="font-body text-lg md:text-xl text-[#1a1c1c] leading-relaxed">
              {l.block3Continues}
            </p>
          </div>

          {/* Block 4 - The Fix */}
          <div
            className="bg-[#22c55e] border-4 border-[#1a1c1c] rounded-[2.5rem] p-8 md:p-16 shadow-neo text-center"
          >
            <h2 className="font-headline font-black text-3xl md:text-5xl text-white mb-8 uppercase tracking-tight">
              {l.block4Title}
            </h2>
            <div className="space-y-4 mb-8">
              <p className="font-headline font-bold text-xl md:text-2xl text-white">
                {l.block4Line1}
              </p>
              <p className="font-headline font-bold text-xl md:text-2xl text-white">
                {l.block4Line2}
              </p>
              <p className="font-headline font-bold text-xl md:text-2xl text-white">
                {l.block4Line3}
              </p>
              <p className="font-headline font-bold text-xl md:text-2xl text-white">
                {l.block4Line4}
              </p>
            </div>
            <div className="inline-block bg-white border-4 border-[#1a1c1c] rounded-[1.5rem] px-8 py-4 shadow-[4px_4px_0px_0px_#1a1c1c]">
              <p className="font-headline font-black text-2xl md:text-3xl text-[#1a1c1c]">
                {l.block4Highlight}
              </p>
            </div>
          </div>

          {/* Block 5 - CTA */}
          <div
            className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] p-8 md:p-12 shadow-neo text-center"
          >
            <p className="font-body text-lg md:text-xl text-[#1a1c1c] leading-relaxed mb-8">
              {l.block5Text}
            </p>
            <Link
              href="/"
              className="inline-block bg-[#22c55e] text-white font-headline font-black text-lg md:text-xl px-10 py-5 rounded-full border-4 border-[#1a1c1c] shadow-neo hover:shadow-neo-hover hover:translate-x-[2px] hover:translate-y-[2px] transition-all active:translate-x-[4px] active:translate-y-[4px] active:shadow-none"
            >
              {l.ctaButton}
            </Link>
          </div>

        </section>
      </main>
      <Footer lang={lang} />
    </>
  );
}
