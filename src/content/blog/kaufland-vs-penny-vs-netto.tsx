import React from "react";
import type { BlogPost } from "@/lib/blog";

const content = () => (
  <>
    <p>
      The Lidl vs Aldi debate gets all the attention. Understandable — both chains are everywhere, both are cheap, and arguing about them is a German expat rite of passage. But Kaufland, Penny, and Netto collectively serve millions of German shoppers every day, and they're worth understanding properly. Some of the best grocery deals in Germany happen at stores most expats walk past.
    </p>

    <h2>Kaufland: Genuinely Underrated</h2>
    <p>
      Kaufland is probably the most underrated supermarket in Germany, full stop. It's part of the same parent company as Lidl (Schwarz Group), but it operates like a proper hypermarket — bigger stores, wider range, actual service counters for meat and fish, and a broader selection of branded goods alongside own-brand.
    </p>
    <p>
      Here's what Kaufland does better than the pure discounters:
    </p>
    <ul>
      <li><strong>Fresh meat and fish:</strong> The butcher counter at Kaufland is a real counter with actual butchers. You can get cuts prepared to order. The quality is good. This doesn't exist at Aldi or Lidl.</li>
      <li><strong>Branded goods on offer:</strong> When Kaufland puts a branded item on their weekly deal list, it's often dramatically cheaper than you'd find anywhere else. Name-brand coffee, well-known cheese brands, branded snacks — their offer prices on these are competitive with the discounters' own-brand prices sometimes.</li>
      <li><strong>Range:</strong> If you need something specific — a particular type of flour, a specific spice, a product from your home country — Kaufland is more likely to have it than Aldi or Lidl.</li>
      <li><strong>Kaufland Card:</strong> Their loyalty scheme is actually useful. Points that convert to real discounts, not just vouchers for margarine.</li>
    </ul>
    <p>
      Their week runs Thursday to Wednesday. If you shop on Wednesday, you're seeing the end of the current offer cycle — things might be sold out. Thursday morning is when the new deals start. Worth timing your visit if you're planning around specific offers.
    </p>

    <h2>Penny: Cheap in Ways People Don't Expect</h2>
    <p>
      Penny gets unfairly dismissed. The stores are sometimes smaller and busier, and the brand doesn't have the same mainstream cool factor that Aldi and Lidl have developed. But the prices? Often excellent.
    </p>
    <p>
      Penny consistently performs well on:
    </p>
    <ul>
      <li><strong>Yoghurt and dairy:</strong> Their own-brand yoghurt is good and regularly goes on offer. €1.29 for a 4-pack of Greek yoghurt is a Penny special that comes around often.</li>
      <li><strong>Bread:</strong> Penny's own-brand bread is solid and cheap. Their in-store bakery (where present) is decent.</li>
      <li><strong>Soft drinks and beer:</strong> Own-brand cola, water, and budget beer options are among the cheapest at Penny compared to the other chains.</li>
      <li><strong>Protein offers:</strong> Penny regularly discounts chicken, mince, and pork cuts significantly. When it's a good Penny week for meat, it's worth making the trip.</li>
    </ul>
    <p>
      Their own-brand packaging is barebones — we're talking "yellow and white label with the product name in Arial" barebones — but the stuff inside is generally fine. Don't let the packaging put you off.
    </p>

    <h2>Netto: Inconsistent but Occasionally Brilliant</h2>
    <p>
      Netto (the Netto Marken-Discount, with the dog logo — not the Danish Netto chain, which is a completely different company) is the most variable of the three. Some weeks the deals are spectacular. Other weeks there's nothing that interesting. The store quality also varies more by location than you'd see at Kaufland or Penny.
    </p>
    <p>
      That said, when Netto has a good week, it's genuinely good. Milk at €0.79/litre, butter at €1.09, seasonal fruit at prices that undercut everyone. They also tend to have a decent selection of regional German products that you won't find at the other chains.
    </p>
    <p>
      The smart way to use Netto: don't rely on it as your primary shop, but check their weekly Prospekt every week. If there's something on your list and Netto has it on offer, that's your reason to go. In and out, get the deal, done.
    </p>
    <p>
      One thing Netto does well consistently: their own-brand cereals and muesli. If you eat a lot of oats or muesli, check Netto's own-brand prices before defaulting to another chain.
    </p>

    <h2>When to Shop at Each</h2>
    <p>
      Here's a rough guide:
    </p>
    <ul>
      <li><strong>Go to Kaufland</strong> when you need a specific branded product, want fresh meat from a counter, or their weekly deal list has something significant you need.</li>
      <li><strong>Go to Penny</strong> when their dairy or protein offers are good, or if it's conveniently on your route and you need the basics quickly.</li>
      <li><strong>Go to Netto</strong> when their weekly Prospekt has something on your list — specifically, don't go without checking first.</li>
    </ul>
    <p>
      All three publish their weekly offers Monday (Penny, Netto) or Thursday (Kaufland). The easiest way to see all of them at once — alongside Lidl and Aldi — is <a href="https://www.papierbox.eu" className="text-[#22c55e] font-bold underline hover:no-underline">papierbox.eu</a>. Search for whatever you need and compare prices across all five chains for this week. You might be surprised which one comes out on top.
    </p>
  </>
);

export const kauflandPennyNettoPost: BlogPost = {
  slug: "kaufland-vs-penny-vs-netto",
  title: "Kaufland vs Penny vs Netto: The Three Stores Nobody Talks About Enough",
  titleDe: "Kaufland vs Penny vs Netto: Die drei Läden, über die niemand genug spricht",
  description: "Everyone talks about Lidl and Aldi. But Kaufland, Penny, and Netto have some of the best deals in Germany — here's when each one is actually worth visiting.",
  descriptionDe: "Alle reden über Lidl und Aldi. Aber Kaufland, Penny und Netto haben einige der besten Angebote in Deutschland — hier ist, wann sich jeder lohnt.",
  date: "2026-03-20",
  readingTime: "6 min read",
  content,
};
