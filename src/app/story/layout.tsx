import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Our Story — How Papierbox Was Born",
  description:
    "From overspending €100/month on groceries as an expat in Germany to building Papierbox — a free tool that compares supermarket prices in seconds.",
  openGraph: {
    title: "Our Story — How Papierbox Was Born",
    description: "From overspending €100/month to saving real money. The story behind Papierbox.",
  },
};

export default function StoryLayout({ children }: { children: React.ReactNode }) {
  return children;
}
