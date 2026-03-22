import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Impressum — Legal Disclosure",
  description: "Legal disclosure (Impressum) for Papierbox as required by German law § 5 TMG.",
  robots: { index: false },
};

export default function ImpressumLayout({ children }: { children: React.ReactNode }) {
  return children;
}
