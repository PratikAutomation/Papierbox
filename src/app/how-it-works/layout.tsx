import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "How It Works — 3 Steps to Cheaper Groceries",
  description:
    "Search any product in English or German, pick your city, see every supermarket's price sorted cheapest first. Papierbox covers 25 German cities and 5 supermarkets.",
  openGraph: {
    title: "How Papierbox Works — 3 Steps to Cheaper Groceries",
    description: "Search. Pick your city. See the cheapest price. That simple.",
  },
};

export default function HowItWorksLayout({ children }: { children: React.ReactNode }) {
  return children;
}
