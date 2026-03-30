import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Contact Us — Feedback, Collaboration & Support",
  description:
    "Get in touch with Papierbox. Send us feedback, report bugs, or explore collaboration opportunities. We respond within 24 hours.",
};

export default function ContactLayout({ children }: { children: React.ReactNode }) {
  return children;
}
