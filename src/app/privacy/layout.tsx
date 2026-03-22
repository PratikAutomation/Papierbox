import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Privacy Policy — Datenschutzerklärung",
  description: "Papierbox privacy policy. We collect almost nothing. No cookies, no tracking, no data sold.",
  robots: { index: false },
};

export default function PrivacyLayout({ children }: { children: React.ReactNode }) {
  return children;
}
