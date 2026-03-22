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
  title: "Papierbox — Find the Cheapest Groceries in Germany",
  description:
    "Compare supermarket prices across Germany. Search any product, pick your city, see the cheapest prices from Lidl, Aldi, Penny, Kaufland, Rewe & more.",
  keywords:
    "grocery prices germany, supermarket comparison, cheap groceries, expat germany, Aldi, Lidl, Penny",
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
      </head>
      <body
        className={`${plusJakartaSans.variable} ${inter.variable} ${bricolageGrotesque.variable} font-body grainy-bg text-[#1a1c1c] antialiased selection:bg-[#22c55e] selection:text-white`}
      >
        {children}
      </body>
    </html>
  );
}
