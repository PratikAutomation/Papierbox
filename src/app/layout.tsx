import type { Metadata } from "next";
import { Plus_Jakarta_Sans, Inter, Bricolage_Grotesque } from "next/font/google";
import { Analytics } from '@vercel/analytics/next';
import "./globals.css";

const plusJakartaSans = Plus_Jakarta_Sans({
  subsets: ["latin"],
  variable: "--font-headline",
  weight: ["400", "500", "600", "700", "800"],
});

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-body",
  weight: ["400", "500", "600"],
});

const bricolageGrotesque = Bricolage_Grotesque({
  subsets: ["latin"],
  variable: "--font-headline-alt",
  weight: ["700", "800"],
});

export const metadata: Metadata = {
  metadataBase: new URL("https://www.papierbox.eu"),
  title: {
    default: "Papierbox — Compare Grocery Prices in Germany | Cheapest Supermarket Offers",
    template: "%s | Papierbox — Grocery Price Comparison Germany",
  },
  description:
    "Compare supermarket prices across Germany in 5 seconds. Search any product, pick your city, see the cheapest prices from Lidl, Aldi, Penny, Kaufland & Netto. Weekly offers, discounts & deals. Free for expats & students.",
  keywords: [
    // English — primary
    "grocery prices germany",
    "cheapest supermarket germany",
    "compare grocery prices germany",
    "supermarket price comparison germany",
    "cheap groceries germany",
    "best supermarket deals germany",
    "weekly supermarket offers germany",
    "discount groceries germany",
    "grocery shopping germany expat",
    "save money groceries germany",
    // English — store specific
    "Lidl offers this week",
    "Aldi offers this week",
    "Penny offers this week",
    "Kaufland offers this week",
    "Netto offers this week",
    "Lidl vs Aldi prices",
    "cheapest butter germany",
    "cheapest milk germany",
    "cheapest coffee germany",
    // German — primary
    "Lebensmittel Preisvergleich",
    "Supermarkt Preisvergleich Deutschland",
    "günstigster Supermarkt Deutschland",
    "Supermarkt Angebote diese Woche",
    "billig einkaufen Deutschland",
    "Prospekte Angebote vergleichen",
    "Lebensmittel Angebote Deutschland",
    "Discounter Angebote vergleichen",
    "Wochenangebote Supermarkt",
    "Spar Tipps Einkaufen Deutschland",
    // German — store specific
    "Lidl Angebote",
    "Aldi Angebote",
    "Penny Angebote",
    "Kaufland Angebote",
    "Netto Angebote",
    // Long-tail
    "where to buy cheapest groceries in germany",
    "expat grocery guide germany",
    "student grocery shopping germany",
    "how to save money on food in germany",
    "best grocery deals this week germany",
  ],
  authors: [{ name: "Papierbox" }],
  creator: "Papierbox",
  publisher: "Papierbox",
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
  openGraph: {
    type: "website",
    locale: "en_US",
    alternateLocale: "de_DE",
    url: "https://www.papierbox.eu",
    siteName: "Papierbox",
    title: "Papierbox — Stop Overpaying for Groceries in Germany",
    description:
      "Compare prices across Lidl, Aldi, Penny, Kaufland & Netto. Find the cheapest groceries in your German city in 5 seconds. Free for expats & students.",
    images: [
      {
        url: "/og-image.png",
        width: 1200,
        height: 630,
        alt: "Papierbox — Grocery Price Comparison for Germany",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: "Papierbox — Cheapest Groceries in Germany",
    description:
      "Search any product. Pick your city. See every supermarket's price, cheapest first. Free for expats & students.",
    images: ["/og-image.png"],
  },
  alternates: {
    canonical: "https://www.papierbox.eu",
    languages: {
      "en": "https://www.papierbox.eu",
      "de": "https://www.papierbox.eu",
      "x-default": "https://www.papierbox.eu",
    },
  },
  category: "shopping",
  icons: {
    icon: [
      { url: "/favicon.svg", type: "image/svg+xml" },
      { url: "/logo.png", type: "image/png", sizes: "192x192" },
    ],
    apple: "/logo.png",
  },
};

// JSON-LD: WebApplication + FAQ Schema (for rich snippets in Google)
const jsonLd = [
  {
    "@context": "https://schema.org",
    "@type": "WebApplication",
    name: "Papierbox",
    url: "https://www.papierbox.eu",
    description:
      "Free grocery price comparison tool for Germany. Compare weekly offers from Lidl, Aldi, Penny, Kaufland and Netto. Find the cheapest supermarket for any product.",
    applicationCategory: "ShoppingApplication",
    operatingSystem: "Web",
    offers: {
      "@type": "Offer",
      price: "0",
      priceCurrency: "EUR",
    },
    author: {
      "@type": "Organization",
      name: "Papierbox",
      url: "https://www.papierbox.eu",
    },
    audience: {
      "@type": "Audience",
      audienceType: "Expats, Students, Budget-conscious shoppers in Germany",
    },
    availableLanguage: ["English", "German"],
    countryOfOrigin: {
      "@type": "Country",
      name: "Germany",
    },
  },
  {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    mainEntity: [
      {
        "@type": "Question",
        name: "Which is the cheapest supermarket in Germany?",
        acceptedAnswer: {
          "@type": "Answer",
          text: "There is no single cheapest supermarket in Germany — it changes every week depending on which products are on offer. Lidl, Aldi, Penny, Kaufland, and Netto all rotate their weekly deals. Use Papierbox to compare prices across all 5 stores and find the cheapest option for any product in your city.",
        },
      },
      {
        "@type": "Question",
        name: "How can I compare grocery prices in Germany?",
        acceptedAnswer: {
          "@type": "Answer",
          text: "Visit papierbox.eu, search for any grocery product (like Butter, Kaffee, or Milch), select your German city, and see prices from Lidl, Aldi, Penny, Kaufland, and Netto sorted from cheapest to most expensive. It's free and requires no signup.",
        },
      },
      {
        "@type": "Question",
        name: "Wo kann man Lebensmittelpreise in Deutschland vergleichen?",
        acceptedAnswer: {
          "@type": "Answer",
          text: "Auf papierbox.eu können Sie Lebensmittelpreise von Lidl, Aldi, Penny, Kaufland und Netto kostenlos vergleichen. Einfach Produkt suchen, Stadt wählen und den günstigsten Preis finden — in 5 Sekunden.",
        },
      },
      {
        "@type": "Question",
        name: "What are the cheapest supermarkets in Germany for expats?",
        acceptedAnswer: {
          "@type": "Answer",
          text: "The cheapest supermarkets in Germany are the discounters: Aldi, Lidl, Penny, and Netto. However, prices vary each week. Kaufland also offers great deals on branded products. Papierbox compares all 5 stores so you always know which has the best price this week.",
        },
      },
      {
        "@type": "Question",
        name: "How much can I save on groceries in Germany by comparing prices?",
        acceptedAnswer: {
          "@type": "Answer",
          text: "By comparing prices before shopping, you can save €50-80 per month (€600-960 per year) on groceries in Germany. The same product can cost up to 60% more at one store compared to another in the same week.",
        },
      },
    ],
  },
];

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <head>
        <link
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
          rel="stylesheet"
        />
        <link rel="alternate" hrefLang="en" href="https://www.papierbox.eu" />
        <link rel="alternate" hrefLang="de" href="https://www.papierbox.eu" />
        <link rel="alternate" hrefLang="x-default" href="https://www.papierbox.eu" />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
        />
        <script
          dangerouslySetInnerHTML={{
            __html: `
              !function(t,e){var o,n,p,r;e.__SV||(window.posthog=e,e._i=[],e.init=function(i,s,a){function g(t,e){var o=e.split(".");2==o.length&&(t=t[o[0]],e=o[1]),t[e]=function(){t.push([e].concat(Array.prototype.slice.call(arguments,0)))}}(p=t.createElement("script")).type="text/javascript",p.crossOrigin="anonymous",p.async=!0,p.src=s.api_host.replace(".i.posthog.com","-assets.i.posthog.com")+"/static/array.js",(r=t.getElementsByTagName("script")[0]).parentNode.insertBefore(p,r);var u=e;for(void 0!==a?u=e[a]=[]:a="posthog",u.people=u.people||[],u.toString=function(t){var e="posthog";return"posthog"!==a&&(e+="."+a),t||(e+=" (stub)"),e},u.people.toString=function(){return u.toString(1)+".people (stub)"},o="init capture register register_once register_for_session unregister unregister_for_session getFeatureFlag getFeatureFlagPayload isFeatureEnabled reloadFeatureFlags updateEarlyAccessFeatureEnrollment getEarlyAccessFeatures on onFeatureFlags onSessionId getSurveys getActiveMatchingSurveys renderSurvey canRenderSurvey getNextSurveyStep identify setPersonProperties group resetGroups setPersonPropertiesForFlags resetPersonPropertiesForFlags setGroupPropertiesForFlags resetGroupPropertiesForFlags reset get_distinct_id getGroups get_session_id get_session_replay_url alias set_config startSessionRecording stopSessionRecording sessionRecordingStarted captureException loadToolbar get_property getSessionProperty createPersonProfile opt_in_capturing opt_out_capturing has_opted_in_capturing has_opted_out_capturing clear_opt_in_out_capturing debug getPageviewId".split(" "),n=0;n<o.length;n++)g(u,o[n]);e._i.push([i,s,a])},e.__SV=1)}(document,window.posthog||[]);
              posthog.init('phc_ky6UiOxDJCn24V2mD6ygYMbrdJVrw9DGnCjQCxfQSOV', {
                api_host: 'https://eu.i.posthog.com',
                person_profiles: 'identified_only',
              });
            `,
          }}
        />
      </head>
      <body
        className={`${plusJakartaSans.variable} ${inter.variable} ${bricolageGrotesque.variable} font-body grainy-bg text-[#1a1c1c] antialiased selection:bg-[#22c55e] selection:text-white`}
      >
        {children}
        <Analytics />
      </body>
    </html>
  );
}
