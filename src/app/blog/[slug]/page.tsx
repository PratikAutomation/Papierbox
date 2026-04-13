"use client";

import { useState } from "react";
import { notFound } from "next/navigation";
import Link from "next/link";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { ALL_POSTS } from "@/lib/blog";

export default function BlogPostPage({ params }: { params: { slug: string } }) {
  const [lang, setLang] = useState<"en" | "de">("en");
  const post = ALL_POSTS.find((p) => p.slug === params.slug);

  if (!post) return notFound();

  return (
    <>
      <Header lang={lang} setLang={setLang} />
      <main className="pt-32 pb-16 grainy-bg min-h-screen">
        <article className="max-w-2xl mx-auto px-6">
          {/* Breadcrumb */}
          <nav className="flex items-center gap-2 text-xs font-black uppercase tracking-widest text-on-surface-variant mb-10">
            <Link href="/" className="hover:text-primary transition-colors">Home</Link>
            <span>/</span>
            <Link href="/blog" className="hover:text-primary transition-colors">Blog</Link>
            <span>/</span>
            <span className="text-primary truncate max-w-[200px]">{post.title.split(":")[0]}</span>
          </nav>

          {/* Header */}
          <header className="mb-12">
            <div className="flex items-center gap-3 mb-4">
              <span className="text-xs font-black uppercase tracking-widest text-primary">{post.date}</span>
              <span className="text-xs font-bold text-on-surface-variant bg-white border-2 border-outline/20 rounded-full px-3 py-1">
                {post.readingTime}
              </span>
            </div>
            <h1 className="font-headline font-black text-3xl md:text-5xl leading-[1.1] text-on-surface mb-5">
              {lang === "en" ? post.title : post.titleDe}
            </h1>
            <p className="text-on-surface-variant text-lg font-medium leading-relaxed">
              {lang === "en" ? post.description : post.descriptionDe}
            </p>
          </header>

          {/* Article body */}
          <div className="prose-blog">
            {post.content()}
          </div>

          {/* CTA */}
          <div className="mt-16 bg-[#1a1c1c] text-white border-4 border-[#1a1c1c] rounded-[2rem] shadow-neo p-8 md:p-10">
            <p className="text-xs font-black uppercase tracking-widest text-primary mb-3">
              {lang === "en" ? "Try it now — it's free" : "Jetzt ausprobieren — kostenlos"}
            </p>
            <h2 className="font-headline font-black text-2xl md:text-3xl mb-4">
              {lang === "en"
                ? "See this week's cheapest prices in your city"
                : "Günstigste Preise diese Woche in deiner Stadt"}
            </h2>
            <p className="text-white/70 font-bold mb-6">
              {lang === "en"
                ? "Search any product. Compare Lidl, Aldi, Penny, Kaufland & Netto in 5 seconds. No signup needed."
                : "Produkt suchen. Lidl, Aldi, Penny, Kaufland & Netto vergleichen. In 5 Sekunden. Keine Anmeldung."}
            </p>
            <Link
              href="/"
              className="inline-block bg-primary text-white font-headline font-black text-lg px-8 py-4 rounded-full border-2 border-white/20 hover:scale-[1.02] active:scale-[0.98] transition-all"
            >
              {lang === "en" ? "Compare prices →" : "Preise vergleichen →"}
            </Link>
          </div>

          {/* Back link */}
          <div className="mt-10 text-center">
            <Link href="/blog" className="text-sm font-black text-on-surface-variant hover:text-primary transition-colors uppercase tracking-widest">
              ← {lang === "en" ? "All articles" : "Alle Artikel"}
            </Link>
          </div>
        </article>
      </main>
      <Footer lang={lang} />
    </>
  );
}
