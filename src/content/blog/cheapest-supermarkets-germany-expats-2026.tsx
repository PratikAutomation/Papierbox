import React from "react";
import type { BlogPost } from "@/lib/blog";

const content = () => (
  <>
    <p>
      Nobody tells you this when you move to Germany: there is no single cheapest supermarket. You'll hear confident opinions from colleagues, flatmates, the guy at the Bürgeramt — everyone has a favourite. But the truth is, it changes. Every week. Which means the answer to "where should I shop?" is genuinely complicated, and also kind of liberating once you understand the system.
    </p>
    <p>
      Here's a quick rundown of the five main discount chains you'll encounter, what they're actually good at, and when it's worth going out of your way to visit each one.
    </p>

    <h2>1. Lidl — The Reliable All-Rounder</h2>
    <p>
      Lidl is probably where you'll end up shopping most often, especially as a newcomer. The stores are easy to navigate, the product quality is consistently decent, and the weekly Angebote (offers) cover a wide range — from olive oil to running shoes. Yes, Lidl sells clothes and kitchen gadgets on rotation. Germans treat this as completely normal.
    </p>
    <p>
      On dairy specifically, Lidl holds its own. Their own-brand butter typically runs around €1.49 for 250g, and their milk is usually €0.85–0.95 per litre. Not always the absolute cheapest, but close. Their fresh produce section has improved a lot in recent years. The discount rack at the back (look for yellow tags) often has stuff marked down 30–50% near end of day.
    </p>

    <h2>2. Aldi Süd — Cheapest on the Basics</h2>
    <p>
      For pure staples — butter, milk, eggs, flour, pasta — Aldi Süd is hard to beat. Their own-brand butter is frequently €1.19 for 250g, which is about €0.30 cheaper than what you'd pay at a Vollsortimenter like Rewe or Edeka. That sounds small until you scale it across a monthly shop.
    </p>
    <p>
      The store layout is minimal, the range is smaller than Lidl's, and there's usually a line. But if you know what you want, it's fast. Aldi's weekly specials (called Aldi Finds in the US but just Angebote here) tend to lean heavier on non-food: power tools, fitness equipment, camping gear. Sometimes brilliant, sometimes baffling.
    </p>

    <h2>3. Penny — Underestimated and Genuinely Cheap</h2>
    <p>
      Penny gets overlooked. It shouldn't. Their own-brand range is surprisingly good, and on certain categories — yoghurt, bread, soft drinks — they often undercut both Lidl and Aldi. Their weekly deals also tend to come through on protein: chicken, mince, pork cuts go on offer regularly and the prices can be genuinely low (€3.99/kg for chicken breast isn't unusual during a good week).
    </p>
    <p>
      The stores are smaller and sometimes feel a little chaotic, but the prices are real. Worth checking their Prospekt before a big shop.
    </p>

    <h2>4. Kaufland — For Branded Goods and Bigger Shops</h2>
    <p>
      Kaufland is technically part of the Schwarz Group (same parent as Lidl), but it operates more like a hypermarket. Bigger stores, more branded products, a proper meat and fish counter in many locations. If you want actual brand-name cereal or a specific pasta sauce you know from home, Kaufland is more likely to stock it than the pure discounters.
    </p>
    <p>
      Their weekly offers are often excellent on branded goods — you'll regularly see name-brand coffee, cheese, or chocolate go 30–40% off. The base prices on unbranded basics aren't always the lowest, but during a good deal week Kaufland can genuinely win. Genuinely underrated for expats who miss specific products.
    </p>

    <h2>5. Netto — Inconsistent but Worth Watching</h2>
    <p>
      Netto (the one branded with the dog — Netto Marken-Discount, not the Danish Netto) is the most variable of the five. Some weeks their deals are spectacular. Other weeks there's nothing interesting. Their store quality also varies more by location than the others.
    </p>
    <p>
      The smart move with Netto: don't rely on it as your primary store, but do check their weekly Prospekt. When they have something on offer, it's usually actually cheap — milk at €0.79/litre, butter at €1.09, that kind of thing.
    </p>

    <h2>The Real Strategy: Follow the Deals</h2>
    <p>
      All five chains publish weekly Prospekte — basically digital leaflets — every Monday or Thursday (it varies by chain). The same product can be 50–60% cheaper at one store this week compared to next week at the same store. Planning your big shop around what's currently on offer is how Germans actually save money on groceries. It's not complicated. It just requires checking before you go.
    </p>
    <p>
      That's exactly what Papierbox does — it pulls together the current week's offers from all five stores so you can see at a glance which one has the best price on whatever you're buying. Worth bookmarking before your next shop: <a href="https://www.papierbox.eu" className="text-[#22c55e] font-bold underline hover:no-underline">papierbox.eu</a>.
    </p>
  </>
);

export const cheapestSupermarketsPost: BlogPost = {
  slug: "cheapest-supermarkets-germany-expats-2026",
  title: "The 5 Cheapest Supermarkets in Germany (And What to Actually Buy Where)",
  titleDe: "Die 5 günstigsten Supermärkte in Deutschland (und was man wo kaufen sollte)",
  description: "Lidl, Aldi, Penny, Kaufland, Netto — here's an honest breakdown of which German supermarket wins on what, and why the answer changes every week.",
  descriptionDe: "Lidl, Aldi, Penny, Kaufland, Netto — ein ehrlicher Vergleich, welcher deutsche Supermarkt bei was gewinnt und warum sich die Antwort wöchentlich ändert.",
  date: "2026-04-10",
  readingTime: "6 min read",
  content,
};
