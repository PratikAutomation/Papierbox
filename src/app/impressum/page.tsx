"use client";

import { useState } from "react";
import Header from "@/components/Header";
import Footer from "@/components/Footer";

export default function Impressum() {
  const [lang, setLang] = useState<"en" | "de">("en");

  const t = {
    en: {
      title: "Impressum",
      subtitle: "Legal Disclosure as required by § 5 TMG",
      section1Title: "Company Information",
      section1Company: "Papierbox",
      section1Country: "Germany",
      section2Title: "Contact",
      section2Email: "Email: info@papierbox.eu",
      section2Web: "Web: papierbox.eu",
      section3Title: "Responsible for Content",
      section3Subtitle: "According to § 55 Abs. 2 RStV",
      section3Name: "[Name placeholder]",
      section4Title: "Disclaimer",
      section4Text: "Prices shown are based on publicly available weekly offers and may vary by location. We strive for accuracy but cannot guarantee real-time correctness of all prices.",
      section5Title: "Data Sources",
      section5Text: "All price data is sourced from publicly available weekly promotional materials (Prospekte) of German supermarkets.",
      section6Title: "Privacy",
      section6Text: "We use anonymous analytics. No personal data is collected or sold.",
    },
    de: {
      title: "Impressum",
      subtitle: "Angaben gemäß § 5 TMG",
      section1Title: "Unternehmensangaben",
      section1Company: "Papierbox",
      section1Country: "Deutschland",
      section2Title: "Kontakt",
      section2Email: "E-Mail: info@papierbox.eu",
      section2Web: "Web: papierbox.eu",
      section3Title: "Verantwortlich für den Inhalt",
      section3Subtitle: "Gemäß § 55 Abs. 2 RStV",
      section3Name: "[Name Platzhalter]",
      section4Title: "Haftungsausschluss",
      section4Text: "Die angezeigten Preise basieren auf öffentlich verfügbaren Wochenangeboten und können je nach Standort variieren. Wir bemühen uns um Genauigkeit, können aber keine Echtzeit-Korrektheit aller Preise garantieren.",
      section5Title: "Datenquellen",
      section5Text: "Alle Preisdaten stammen aus öffentlich zugänglichen wöchentlichen Werbeprospekten deutscher Supermärkte.",
      section6Title: "Datenschutz",
      section6Text: "Wir verwenden anonyme Analysen. Es werden keine personenbezogenen Daten erhoben oder verkauft.",
    },
  };

  const l = t[lang];

  return (
    <>
      <Header lang={lang} setLang={setLang} />
      <main className="pt-32 pb-16 grainy-bg">
        <section className="max-w-3xl mx-auto px-6">

          {/* Main Card */}
          <div className="bg-white border-4 border-[#1a1c1c] shadow-neo rounded-[2rem] p-10 md:p-16">

            {/* Title */}
            <h1 className="font-headline font-black text-5xl md:text-6xl text-[#1a1c1c] mb-4 uppercase tracking-tight">
              {l.title}
            </h1>
            <p className="font-body text-lg text-[#3d4a3d] mb-12 font-semibold">
              {l.subtitle}
            </p>

            {/* Section 1 - Company Information */}
            <div className="mb-10">
              <h2 className="font-headline font-black text-2xl text-[#22c55e] mb-4 uppercase tracking-tight">
                {l.section1Title}
              </h2>
              <div className="font-body text-lg text-[#1a1c1c] space-y-2">
                <p className="font-bold">{l.section1Company}</p>
                <p>{l.section1Country}</p>
              </div>
            </div>

            {/* Section 2 - Contact */}
            <div className="mb-10">
              <h2 className="font-headline font-black text-2xl text-[#22c55e] mb-4 uppercase tracking-tight">
                {l.section2Title}
              </h2>
              <div className="font-body text-lg text-[#1a1c1c] space-y-2">
                <p>
                  <span className="font-bold">{l.section2Email.split(":")[0]}:</span>{" "}
                  <a href="mailto:info@papierbox.eu" className="text-[#22c55e] hover:underline font-semibold">
                    info@papierbox.eu
                  </a>
                </p>
                <p>
                  <span className="font-bold">{l.section2Web.split(":")[0]}:</span>{" "}
                  <a href="https://papierbox.eu" className="text-[#22c55e] hover:underline font-semibold">
                    papierbox.eu
                  </a>
                </p>
              </div>
            </div>

            {/* Section 3 - Responsible for Content */}
            <div className="mb-10">
              <h2 className="font-headline font-black text-2xl text-[#22c55e] mb-4 uppercase tracking-tight">
                {l.section3Title}
              </h2>
              <p className="font-body text-sm text-[#3d4a3d] italic mb-2">
                {l.section3Subtitle}
              </p>
              <p className="font-body text-lg text-[#1a1c1c] font-bold">
                {l.section3Name}
              </p>
            </div>

            {/* Divider */}
            <div className="border-t-2 border-[#1a1c1c] my-10"></div>

            {/* Section 4 - Disclaimer */}
            <div className="mb-10">
              <h2 className="font-headline font-black text-2xl text-[#22c55e] mb-4 uppercase tracking-tight">
                {l.section4Title}
              </h2>
              <p className="font-body text-base text-[#3d4a3d] leading-relaxed">
                {l.section4Text}
              </p>
            </div>

            {/* Section 5 - Data Sources */}
            <div className="mb-10">
              <h2 className="font-headline font-black text-2xl text-[#22c55e] mb-4 uppercase tracking-tight">
                {l.section5Title}
              </h2>
              <p className="font-body text-base text-[#3d4a3d] leading-relaxed">
                {l.section5Text}
              </p>
            </div>

            {/* Section 6 - Privacy */}
            <div>
              <h2 className="font-headline font-black text-2xl text-[#22c55e] mb-4 uppercase tracking-tight">
                {l.section6Title}
              </h2>
              <p className="font-body text-base text-[#3d4a3d] leading-relaxed">
                {l.section6Text}
              </p>
            </div>

          </div>

        </section>
      </main>
      <Footer lang={lang} />
    </>
  );
}
