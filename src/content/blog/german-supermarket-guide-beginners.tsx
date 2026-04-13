import React from "react";
import type { BlogPost } from "@/lib/blog";

const content = () => (
  <>
    <p>
      Your first German supermarket experience will probably be fine. Your first checkout experience might not be. Someone behind you will sigh. You will panic. You will put something back in the wrong place. Welcome to Germany.
    </p>
    <p>
      Here's everything they should have handed you at the Bürgeramt.
    </p>

    <h2>Discounters vs. Vollsortimenter — What's the Difference?</h2>
    <p>
      German supermarkets split into two main categories. Discounters (Discounter) are the budget chains: Aldi, Lidl, Penny, Netto. Smaller stores, fewer SKUs, mostly own-brand products, very low prices. This is where most people do the bulk of their shopping.
    </p>
    <p>
      Vollsortimenter are the "full assortment" supermarkets: Rewe, Edeka, Kaufland (technically in between). They carry a much wider range of branded products, often have deli counters, bakeries, and more international foods. The prices are higher. Worth knowing for when you need something specific.
    </p>
    <p>
      Kaufland sits in an interesting middle position — discounter prices on some things, Vollsortimenter range. It's worth visiting once just to understand the landscape.
    </p>

    <h2>What Is Pfand and Why Does Everyone Have Bottles?</h2>
    <p>
      Pfand is a deposit system on drinks bottles and cans. When you buy a plastic bottle of water (€0.25 Pfand), a glass bottle of beer (€0.08), or an aluminium can (€0.25), you're paying a deposit. You return the empty to the Pfandautomat — a machine near the entrance of most supermarkets — and get the money back as a receipt you can spend in-store.
    </p>
    <p>
      The machines take a few seconds per item, beep a lot, and feel very German. Don't throw away your bottles. And yes, people do collect bottles from bins to return them — it's not stealing, it's resourcefulness.
    </p>
    <p>
      Quick tip: you can return bottles to any supermarket that sells that type of bottle — you don't have to go back to where you bought it. Most large supermarkets accept most bottles.
    </p>

    <h2>The Checkout Experience (Don't Be That Person)</h2>
    <p>
      German cashiers are fast. Faster than you think. They scan items at a pace that will alarm you the first time, and the items pile up at the end. You are expected to pack your own bags. There is no "bag packing person." There is no chatting while you figure out your wallet.
    </p>
    <p>
      The correct strategy: put your items on the belt, have your payment ready (card is usually fine — but check, some smaller stores are cash-only), and be ready to bag fast. Don't stand there chatting or sorting your receipt while people queue behind you. Move to the side, sort yourself out, then go.
    </p>
    <p>
      Bring a bag (Tasche). You can buy one at the checkout — usually €0.10–0.30 for a plastic one — but it adds up and the planet is having a rough time. Most people use a canvas bag or those big "bag for life" bags you see everywhere.
    </p>

    <h2>Store Hours — They're More Limited Than You Expect</h2>
    <p>
      Most German supermarkets close between 8pm and 10pm. Some close at 8pm on the dot. On Sundays, essentially all supermarkets are closed — by law. Petrol station shops and some bakeries stay open, but your grocery shopping options on Sunday are basically zero.
    </p>
    <p>
      This catches everyone off guard at first. Plan your week accordingly: big shop Saturday, backup supplies always in the house. German law restricts Sunday trading fairly strictly, and this is not changing anytime soon.
    </p>

    <h2>Prospekte — The Weekly Offer Leaflets</h2>
    <p>
      Every chain publishes a Prospekt each week — a digital or physical leaflet showing what's on sale. Germans are serious about these. They plan their shopping around them. The deals are often substantial: 30–50% off on specific items, sometimes more.
    </p>
    <p>
      You can find them in-store (paper versions near the entrance), via the store apps, or on apps like KaufDa and Marktguru. The easier approach is using <a href="https://www.papierbox.eu" className="text-[#22c55e] font-bold underline hover:no-underline">papierbox.eu</a>, which aggregates all five main chains so you can search for a specific product and see the current week's prices across all of them.
    </p>

    <h2>International Foods — Where to Find Them</h2>
    <p>
      The discounters carry surprisingly little international food most of the time. They rotate "international weeks" — a themed week where Lidl might carry Greek products, or Aldi has Italian imports — but day to day, the range is very German.
    </p>
    <p>
      For international groceries: look for Turkish supermarkets (often called Türkischer Supermarkt or specific chains like BIM or Koçtaş). They're excellent for produce, spices, halal meat, dairy, and often significantly cheaper than the German chains on fresh veg. Asian supermarkets exist in most mid-size and large German cities. Rewe and Edeka in city centres often carry more international products than the suburban branches.
    </p>
    <p>
      Also: Amazon Fresh and other delivery services have massively expanded their German-language product ranges. Not always cheapest, but useful for specific things you can't find locally.
    </p>

    <h2>English-Speaking Staff</h2>
    <p>
      You'll find varying levels of English in German supermarkets. City centres, university towns, and larger stores tend to have more staff who speak some English. Smaller stores in less urban areas may have very little. Learning the German names for basic items (Milch = milk, Butter = butter, Brot = bread, Käse = cheese, Fleisch = meat) goes a long way even if your German is minimal.
    </p>
    <p>
      The checkout process requires almost no language. "Haben Sie eine Payback-Karte?" means "Do you have a loyalty card?" — just say "Nein danke." You'll be fine.
    </p>
  </>
);

export const supermarketGuidePost: BlogPost = {
  slug: "german-supermarket-guide-beginners",
  title: "German Supermarkets Explained: A No-Nonsense Guide for Newcomers",
  titleDe: "Deutsche Supermärkte erklärt: Ein klarer Leitfaden für Neuankömmlinge",
  description: "Pfand, the checkout panic, Sunday closures, weekly Prospekte, where to find international foods — everything you wish someone had told you on arrival.",
  descriptionDe: "Pfand, die Kassenschlange, Sonntagsöffnung, Prospekte, internationale Lebensmittel — alles, was man dir bei der Ankunft hätte sagen sollen.",
  date: "2026-04-02",
  readingTime: "6 min read",
  content,
};
