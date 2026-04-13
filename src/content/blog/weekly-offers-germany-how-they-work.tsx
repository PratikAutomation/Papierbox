import React from "react";
import type { BlogPost } from "@/lib/blog";

const content = () => (
  <>
    <p>
      Here's something that took me a few months to fully appreciate: German supermarket prices are not fixed. Not just "they change sometimes" — they change every single week, on a schedule, for a significant portion of the store's range. Understanding this system is probably the highest-leverage thing you can do to spend less on groceries.
    </p>

    <h2>What Are Angebote / Prospekte?</h2>
    <p>
      Every major German supermarket chain publishes a weekly Prospekt — a catalogue of items that are on special offer that week. "Angebote" just means "offers." The Prospekt is the leaflet (physical or digital) listing them.
    </p>
    <p>
      These aren't small discounts. We're talking about the kind of price drops that make a genuine difference: butter going from €1.89 to €1.09, chicken breast from €6.99/kg to €3.99/kg, coffee from €5.49 to €3.29. For items you buy regularly, this matters.
    </p>
    <p>
      The discounts happen because stores are using offers strategically — to drive footfall, clear seasonal stock, or match a competitor. You don't need to understand why. You just need to know when.
    </p>

    <h2>When Do the New Offers Start?</h2>
    <p>
      This varies by chain, and it matters if you're planning your shopping day:
    </p>
    <ul>
      <li><strong>Lidl:</strong> New offers typically start Monday, with some categories (especially non-food) refreshing on Thursday</li>
      <li><strong>Aldi Süd:</strong> New offers start Monday for most food; Thursday for the special buys (non-food)</li>
      <li><strong>Penny:</strong> Monday</li>
      <li><strong>Kaufland:</strong> Thursday (their week runs Thursday to Wednesday)</li>
      <li><strong>Netto:</strong> Monday</li>
    </ul>
    <p>
      So if you're at Kaufland on a Wednesday and see something on offer, it's the last day of that deal. Thursday morning, the new prices kick in. Worth timing your visit accordingly.
    </p>

    <h2>How Much Can You Actually Save?</h2>
    <p>
      On individual items, the savings can be substantial — 30–60% on things that go on offer. The compound effect across a full weekly shop is where it gets interesting.
    </p>
    <p>
      Let's say you're buying milk, butter, eggs, chicken, pasta, and yoghurt in a given week. If each of those is on offer somewhere this week, and you check before you go, you might spend €18 instead of €27. That's €9 saved in one shop. Do that roughly 3 out of 4 weeks (offers rotate, you won't always hit everything) and you're looking at €25–35 saved per month from planning around deals.
    </p>
    <p>
      That's €300–400 per year. On the same food. With zero lifestyle change.
    </p>

    <h2>How to Find This Week's Offers</h2>
    <p>
      A few options, from most effort to least:
    </p>
    <ul>
      <li><strong>Physical Prospekte:</strong> Grab them from the entrance of any store. They're free. A bit retro, but some people love a physical leaflet.</li>
      <li><strong>KaufDa app:</strong> The main app Germans use for this. Has all the major chains, shows your local stores' current leaflets. Works well, but you have to scroll through a lot of images.</li>
      <li><strong>Marktguru:</strong> Similar to KaufDa, slightly different interface. Try both and use whichever you prefer.</li>
      <li><strong>Store apps:</strong> Each chain has their own app. Useful for their loyalty points if they offer them.</li>
      <li><strong>Papierbox:</strong> The fastest option if you have a specific product in mind. Search for what you want to buy and see which store has the best price this week, across all five chains at once. No scrolling through leaflets — just a search result. <a href="https://www.papierbox.eu" className="text-[#22c55e] font-bold underline hover:no-underline">papierbox.eu</a></li>
    </ul>

    <h2>A Practical Strategy That Actually Fits Your Life</h2>
    <p>
      You don't need to become a couponing obsessive. Here's a simple approach: before your weekly shop, spend two minutes checking what's on offer across the main stores. Build your protein choice around whoever has a good deal this week. Do the same for dairy. For everything else, just go to your usual store.
    </p>
    <p>
      If you can't face checking every week, at minimum check when you're planning to buy something more expensive — a bigger cut of meat, cheese, coffee, wine, anything over €4 or €5. That's where the single-item savings are biggest and most worth the 60 seconds of checking.
    </p>
    <p>
      The German shoppers who've been doing this for decades don't think of it as effort anymore. It's just habit. "What's on offer this week?" is a question that pays dividends every time you ask it.
    </p>
  </>
);

export const weeklyOffersPost: BlogPost = {
  slug: "weekly-offers-germany-how-they-work",
  title: "Germany's Weekly Supermarket Offers: How the System Works",
  titleDe: "Deutschlands wöchentliche Supermarktangebote: So funktioniert das System",
  description: "German supermarkets rotate deals every week — and the same product can be 50% cheaper on offer. Here's how to use this system to actually save money.",
  descriptionDe: "Deutsche Supermärkte wechseln wöchentlich ihre Angebote — und dasselbe Produkt kann im Angebot 50% günstiger sein. So nutzt man das System.",
  date: "2026-03-30",
  readingTime: "5 min read",
  content,
};
