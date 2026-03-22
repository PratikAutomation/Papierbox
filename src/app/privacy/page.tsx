"use client";

import { useState } from "react";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import Link from "next/link";

type Lang = "en" | "de";

export default function Privacy() {
  const [lang, setLang] = useState<Lang>("en");

  const t = {
    en: {
      title: "Privacy Policy",
      subtitle: "Datenschutzerklärung — Last updated: March 2026",
      intro: "We take your privacy seriously. This page explains what data we collect, why, and how we handle it. Short version: we collect almost nothing.",
      s1Title: "1. Who We Are",
      s1Text: "Papierbox is a grocery price comparison service operated from Germany. We help expats and students find the cheapest groceries across German supermarkets.",
      s1Contact: "Contact: info@papierbox.eu",
      s2Title: "2. What Data We Collect",
      s2Intro: "We collect minimal data to operate the service:",
      s2Items: [
        "Search queries — What products you search for (not linked to your identity)",
        "City selection — Which city you select (not your exact location)",
        "Anonymous analytics — Page views, device type, country (via Vercel Analytics)",
      ],
      s2NotCollect: "What we do NOT collect:",
      s2NotItems: [
        "No personal information (name, email, phone)",
        "No account or login required",
        "No cookies for tracking or advertising",
        "No IP address storage",
        "No location tracking or GPS data",
        "No data sold to third parties — ever",
      ],
      s3Title: "3. Analytics",
      s3Text: "We use Vercel Analytics for anonymous, aggregated usage statistics (page views, geographic region, device type). This helps us understand which features are used and improve the service. No personal data is collected or stored by our analytics.",
      s4Title: "4. Data Sources",
      s4Text: "All price data displayed on Papierbox is sourced from publicly available weekly promotional materials (Prospekte/leaflets) of German supermarkets. We extract factual pricing information for comparison purposes. We do not have partnerships with or endorsements from any supermarket chain.",
      s5Title: "5. Cookies",
      s5Text: "Papierbox does not use cookies for tracking, advertising, or user profiling. The site may use essential technical cookies required by our hosting provider (Vercel) for basic functionality such as load balancing.",
      s6Title: "6. Third-Party Services",
      s6Intro: "We use the following third-party services:",
      s6Items: [
        "Vercel — Hosting and deployment (vercel.com/legal/privacy-policy)",
        "Supabase — Database (supabase.com/privacy)",
        "Anthropic Claude API — Data extraction, no user data is sent to this service",
      ],
      s7Title: "7. Data Retention",
      s7Text: "Price data is refreshed twice weekly and old offers are replaced. We do not maintain historical user data because we do not collect user data.",
      s8Title: "8. Your Rights (GDPR)",
      s8Intro: "Under the EU General Data Protection Regulation (GDPR), you have the right to:",
      s8Items: [
        "Access any personal data we hold about you (we hold none)",
        "Request deletion of your data",
        "Object to data processing",
        "File a complaint with a supervisory authority",
      ],
      s8Text: "Since we do not collect personal data, these rights are automatically fulfilled. If you have any concerns, contact us at info@papierbox.eu.",
      s9Title: "9. Children's Privacy",
      s9Text: "Papierbox does not knowingly collect data from children under 16. The service is a general grocery price comparison tool with no age-restricted content.",
      s10Title: "10. Changes to This Policy",
      s10Text: "We may update this privacy policy from time to time. Changes will be posted on this page with an updated date. No notification is required as we do not collect contact information.",
      s11Title: "11. Contact",
      s11Text: "For any privacy-related questions:",
      s11Email: "Email: info@papierbox.eu",
      s11Web: "Web: papierbox.eu",
      backHome: "← Back to Home",
    },
    de: {
      title: "Datenschutzerklärung",
      subtitle: "Privacy Policy — Zuletzt aktualisiert: März 2026",
      intro: "Wir nehmen Datenschutz ernst. Diese Seite erklärt, welche Daten wir erheben, warum und wie wir damit umgehen. Kurzversion: Wir erheben fast nichts.",
      s1Title: "1. Wer wir sind",
      s1Text: "Papierbox ist ein Lebensmittel-Preisvergleichsdienst mit Sitz in Deutschland. Wir helfen Expats und Studenten, die günstigsten Lebensmittel in deutschen Supermärkten zu finden.",
      s1Contact: "Kontakt: info@papierbox.eu",
      s2Title: "2. Welche Daten wir erheben",
      s2Intro: "Wir erheben minimale Daten für den Betrieb des Dienstes:",
      s2Items: [
        "Suchanfragen — Welche Produkte Sie suchen (nicht mit Ihrer Identität verknüpft)",
        "Stadtauswahl — Welche Stadt Sie wählen (nicht Ihr genauer Standort)",
        "Anonyme Analysen — Seitenaufrufe, Gerätetyp, Land (über Vercel Analytics)",
      ],
      s2NotCollect: "Was wir NICHT erheben:",
      s2NotItems: [
        "Keine persönlichen Daten (Name, E-Mail, Telefon)",
        "Kein Konto oder Login erforderlich",
        "Keine Cookies für Tracking oder Werbung",
        "Keine IP-Adress-Speicherung",
        "Kein Standort-Tracking oder GPS-Daten",
        "Keine Daten werden an Dritte verkauft — niemals",
      ],
      s3Title: "3. Analysen",
      s3Text: "Wir verwenden Vercel Analytics für anonyme, aggregierte Nutzungsstatistiken (Seitenaufrufe, Region, Gerätetyp). Dies hilft uns zu verstehen, welche Funktionen genutzt werden. Es werden keine personenbezogenen Daten erhoben.",
      s4Title: "4. Datenquellen",
      s4Text: "Alle auf Papierbox angezeigten Preisdaten stammen aus öffentlich verfügbaren wöchentlichen Werbeprospekten deutscher Supermärkte. Wir extrahieren faktische Preisinformationen zu Vergleichszwecken. Wir haben keine Partnerschaften mit Supermarktketten.",
      s5Title: "5. Cookies",
      s5Text: "Papierbox verwendet keine Cookies für Tracking, Werbung oder Nutzerprofilierung. Die Website kann technisch notwendige Cookies verwenden, die vom Hosting-Anbieter (Vercel) für grundlegende Funktionalität benötigt werden.",
      s6Title: "6. Drittanbieter-Dienste",
      s6Intro: "Wir nutzen folgende Drittanbieter-Dienste:",
      s6Items: [
        "Vercel — Hosting und Bereitstellung (vercel.com/legal/privacy-policy)",
        "Supabase — Datenbank (supabase.com/privacy)",
        "Anthropic Claude API — Datenextraktion, keine Nutzerdaten werden übermittelt",
      ],
      s7Title: "7. Datenspeicherung",
      s7Text: "Preisdaten werden zweimal wöchentlich aktualisiert und alte Angebote ersetzt. Wir speichern keine historischen Nutzerdaten, da wir keine Nutzerdaten erheben.",
      s8Title: "8. Ihre Rechte (DSGVO)",
      s8Intro: "Gemäß der EU-Datenschutz-Grundverordnung (DSGVO) haben Sie das Recht auf:",
      s8Items: [
        "Auskunft über gespeicherte personenbezogene Daten (wir speichern keine)",
        "Löschung Ihrer Daten",
        "Widerspruch gegen die Datenverarbeitung",
        "Beschwerde bei einer Aufsichtsbehörde",
      ],
      s8Text: "Da wir keine personenbezogenen Daten erheben, sind diese Rechte automatisch erfüllt. Bei Fragen kontaktieren Sie uns unter info@papierbox.eu.",
      s9Title: "9. Datenschutz für Kinder",
      s9Text: "Papierbox erhebt wissentlich keine Daten von Kindern unter 16 Jahren. Der Dienst ist ein allgemeines Preisvergleichstool ohne altersbeschränkte Inhalte.",
      s10Title: "10. Änderungen dieser Richtlinie",
      s10Text: "Wir können diese Datenschutzerklärung von Zeit zu Zeit aktualisieren. Änderungen werden auf dieser Seite mit aktualisiertem Datum veröffentlicht.",
      s11Title: "11. Kontakt",
      s11Text: "Für datenschutzbezogene Fragen:",
      s11Email: "E-Mail: info@papierbox.eu",
      s11Web: "Web: papierbox.eu",
      backHome: "← Zurück zur Startseite",
    },
  };

  const l = t[lang];

  return (
    <>
      <Header lang={lang} setLang={setLang} />

      <main className="pt-32 pb-16">
        <section className="max-w-3xl mx-auto px-6">
          {/* Back link */}
          <Link
            href="/"
            className="inline-flex items-center gap-2 text-on-surface-variant font-bold text-sm hover:text-primary transition-colors mb-8"
          >
            {l.backHome}
          </Link>

          {/* Main Card */}
          <div className="bg-white border-4 border-[#1a1c1c] shadow-neo rounded-[2rem] p-8 md:p-14">
            <h1 className="font-headline font-black text-4xl md:text-5xl text-on-surface mb-2">
              {l.title}
            </h1>
            <p className="text-on-surface-variant font-medium text-sm mb-8">
              {l.subtitle}
            </p>

            {/* Intro */}
            <div className="bg-[#22c55e]/10 border-2 border-dashed border-[#22c55e] rounded-2xl p-6 mb-10">
              <p className="text-on-surface font-bold">{l.intro}</p>
            </div>

            <div className="space-y-10">
              {/* Section 1 */}
              <div>
                <h2 className="font-headline font-black text-xl text-[#22c55e] mb-3">{l.s1Title}</h2>
                <p className="text-on-surface-variant font-medium leading-relaxed">{l.s1Text}</p>
                <p className="text-on-surface-variant font-medium mt-2">{l.s1Contact}</p>
              </div>

              {/* Section 2 */}
              <div>
                <h2 className="font-headline font-black text-xl text-[#22c55e] mb-3">{l.s2Title}</h2>
                <p className="text-on-surface-variant font-bold mb-3">{l.s2Intro}</p>
                <ul className="space-y-2 mb-6">
                  {l.s2Items.map((item, i) => (
                    <li key={i} className="flex items-start gap-3">
                      <span className="text-[#22c55e] font-black mt-0.5">+</span>
                      <span className="text-on-surface-variant font-medium">{item}</span>
                    </li>
                  ))}
                </ul>
                <p className="text-on-surface font-black mb-3">{l.s2NotCollect}</p>
                <ul className="space-y-2">
                  {l.s2NotItems.map((item, i) => (
                    <li key={i} className="flex items-start gap-3">
                      <span className="text-red-500 font-black mt-0.5">✕</span>
                      <span className="text-on-surface-variant font-medium">{item}</span>
                    </li>
                  ))}
                </ul>
              </div>

              {/* Sections 3-7 */}
              {[
                { title: l.s3Title, text: l.s3Text },
                { title: l.s4Title, text: l.s4Text },
                { title: l.s5Title, text: l.s5Text },
              ].map((section, i) => (
                <div key={i}>
                  <h2 className="font-headline font-black text-xl text-[#22c55e] mb-3">{section.title}</h2>
                  <p className="text-on-surface-variant font-medium leading-relaxed">{section.text}</p>
                </div>
              ))}

              {/* Section 6 - with list */}
              <div>
                <h2 className="font-headline font-black text-xl text-[#22c55e] mb-3">{l.s6Title}</h2>
                <p className="text-on-surface-variant font-bold mb-3">{l.s6Intro}</p>
                <ul className="space-y-2">
                  {l.s6Items.map((item, i) => (
                    <li key={i} className="flex items-start gap-3">
                      <span className="text-[#22c55e] font-black mt-0.5">→</span>
                      <span className="text-on-surface-variant font-medium">{item}</span>
                    </li>
                  ))}
                </ul>
              </div>

              {/* Section 7 */}
              <div>
                <h2 className="font-headline font-black text-xl text-[#22c55e] mb-3">{l.s7Title}</h2>
                <p className="text-on-surface-variant font-medium leading-relaxed">{l.s7Text}</p>
              </div>

              {/* Section 8 - GDPR with list */}
              <div>
                <h2 className="font-headline font-black text-xl text-[#22c55e] mb-3">{l.s8Title}</h2>
                <p className="text-on-surface-variant font-bold mb-3">{l.s8Intro}</p>
                <ul className="space-y-2 mb-4">
                  {l.s8Items.map((item, i) => (
                    <li key={i} className="flex items-start gap-3">
                      <span className="text-[#22c55e] font-black mt-0.5">✓</span>
                      <span className="text-on-surface-variant font-medium">{item}</span>
                    </li>
                  ))}
                </ul>
                <p className="text-on-surface-variant font-medium leading-relaxed">{l.s8Text}</p>
              </div>

              {/* Sections 9-10 */}
              {[
                { title: l.s9Title, text: l.s9Text },
                { title: l.s10Title, text: l.s10Text },
              ].map((section, i) => (
                <div key={i}>
                  <h2 className="font-headline font-black text-xl text-[#22c55e] mb-3">{section.title}</h2>
                  <p className="text-on-surface-variant font-medium leading-relaxed">{section.text}</p>
                </div>
              ))}

              {/* Section 11 - Contact */}
              <div className="bg-[#1a1c1c] text-white rounded-2xl p-6">
                <h2 className="font-headline font-black text-xl mb-3">{l.s11Title}</h2>
                <p className="font-medium mb-2">{l.s11Text}</p>
                <p className="font-bold">{l.s11Email}</p>
                <p className="font-bold">{l.s11Web}</p>
              </div>
            </div>
          </div>
        </section>
      </main>

      <Footer lang={lang} />
    </>
  );
}
