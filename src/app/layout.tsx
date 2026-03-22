import type { Metadata } from "next";
import { Plus_Jakarta_Sans, Inter, Bricolage_Grotesque } from "next/font/google";
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
  metadataBase: new URL("https://papierbox.eu"),
  title: {
    default: "Papierbox — Find the Cheapest Groceries in Germany",
    template: "%s | Papierbox",
  },
  description:
    "Compare supermarket prices across Germany in seconds. Search any product, pick your city, see the cheapest prices from Lidl, Aldi, Penny, Kaufland & Netto. Free for expats & students.",
  keywords: [
    "grocery prices germany",
    "supermarket comparison germany",
    "cheap groceries germany",
    "expat germany groceries",
    "Aldi offers",
    "Lidl offers",
    "Penny offers",
    "Kaufland offers",
    "Netto offers",
    "Lebensmittel Preisvergleich",
    "Supermarkt Angebote Deutschland",
    "billig einkaufen Deutschland",
    "grocery price comparison",
    "cheapest supermarket germany",
    "Prospekte Angebote vergleichen",
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
    url: "https://papierbox.eu",
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
    canonical: "https://papierbox.eu",
    languages: {
      "en": "https://papierbox.eu",
      "de": "https://papierbox.eu",
    },
  },
  category: "shopping",
  icons: {
    icon: "/logo.png",
    apple: "/logo.png",
  },
};

// JSON-LD Structured Data
const jsonLd = {
  "@context": "https://schema.org",
  "@type": "WebApplication",
  name: "Papierbox",
  url: "https://papierbox.eu",
  description:
    "Compare grocery prices across German supermarkets. Find the cheapest deals from Lidl, Aldi, Penny, Kaufland and Netto.",
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
    url: "https://papierbox.eu",
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
};

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
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
        />
      </head>
      <body
        className={`${plusJakartaSans.variable} ${inter.variable} ${bricolageGrotesque.variable} font-body grainy-bg text-[#1a1c1c] antialiased selection:bg-[#22c55e] selection:text-white`}
      >
        {children}
      </body>
    </html>
  );
}
