"use client";

import { useState } from "react";
import Link from "next/link";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { ALL_POSTS } from "@/lib/blog";

export default function BlogIndex() {
  const [lang, setLang] = useState<"en" | "de">("en");

  return (
    <>
      <Header lang={lang} setLang={setLang} />
      <main className="pt-32 pb-16 grainy-bg min-h-screen">
        <section className="max-w-4xl mx-auto px-6 mb-14">
          <span className="text-xs font-black uppercase tracking-widest text-[#22c55e]">
            Grocery guides &amp; tips
          </span>
          <h1 className="font-headline font-black text-4xl md:text-6xl tracking-tight leading-[1.1] text-[#1a1c1c] mt-3 mb-4">
            {lang === "en"
              ? "Grocery Shopping in Germany — Tips, Guides & Comparisons"
              : "Lebensmitteleinkauf in Deutschland — Tipps, Guides & Vergleiche"}
          </h1>
          <p className="text-[#3d4a3d] text-lg font-medium max-w-2xl">
            {lang === "en"
              ? "Honest, practical guides for expats and students navigating German supermarkets. No fluff."
              : "Ehrliche, praktische Guides für Expats und Studenten, die sich im deutschen Supermarkt zurechtfinden wollen. Ohne Blabla."}
          </p>
        </section>

        <section className="max-w-4xl mx-auto px-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {ALL_POSTS.map((post) => (
              <Link
                key={post.slug}
                href={`/blog/${post.slug}`}
                className="group bg-white border-4 border-[#1a1c1c] rounded-[2rem] p-7 shadow-neo hover:shadow-neo-hover hover:translate-x-[2px] hover:translate-y-[2px] transition-all duration-150 flex flex-col"
              >
                <div className="flex items-center gap-3 mb-4">
                  <span className="text-xs font-black uppercase tracking-widest text-[#22c55e]">
                    {post.date}
                  </span>
                  <span className="text-xs font-bold text-[#3d4a3d] bg-[#f3f3f3] border border-[#1a1c1c]/10 rounded-full px-2.5 py-0.5">
                    {post.readingTime}
                  </span>
                </div>
                <h2 className="font-headline font-black text-xl leading-snug text-[#1a1c1c] mb-3 group-hover:text-[#006e2f] transition-colors">
                  {lang === "en" ? post.title : post.titleDe}
                </h2>
                <p className="text-[#3d4a3d] text-sm leading-relaxed font-medium flex-1 mb-5">
                  {lang === "en" ? post.description : post.descriptionDe}
                </p>
                <span className="text-sm font-black text-[#22c55e] group-hover:underline">
                  {lang === "en" ? "Read more →" : "Weiterlesen →"}
                </span>
              </Link>
            ))}
          </div>
        </section>

        <section className="max-w-4xl mx-auto px-6 mt-16">
          <div className="bg-[#22c55e] border-4 border-[#1a1c1c] rounded-[2rem] p-8 md:p-12 shadow-neo text-center">
            <h2 className="font-headline font-black text-2xl md:text-3xl text-white mb-4">
              {lang === "en"
                ? "Ready to compare prices?"
                : "Bereit, Preise zu vergleichen?"}
            </h2>
            <p className="text-white font-bold text-lg mb-6 opacity-90">
              {lang === "en"
                ? "Search any product and see this week's best price across all 5 German supermarkets."
                : "Suche ein Produkt und sieh den günstigsten Preis dieser Woche in allen 5 deutschen Supermärkten."}
            </p>
            <Link
              href="/"
              className="inline-block bg-white text-[#1a1c1c] font-headline font-black text-lg px-8 py-4 rounded-full border-4 border-[#1a1c1c] shadow-[4px_4px_0px_0px_#1a1c1c] hover:shadow-[2px_2px_0px_0px_#1a1c1c] hover:translate-x-[2px] hover:translate-y-[2px] transition-all"
            >
              {lang === "en"
                ? "Find the cheapest prices →"
                : "Günstigste Preise finden →"}
            </Link>
          </div>
        </section>
      </main>
      <Footer lang={lang} />
    </>
  );
}
