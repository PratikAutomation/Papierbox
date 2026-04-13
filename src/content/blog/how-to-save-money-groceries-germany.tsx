import React from "react";
import type { BlogPost } from "@/lib/blog";

const content = () => (
  <>
    <p>
      When I first moved to Germany, I thought I was being pretty smart about grocery shopping. I went to Aldi, I bought own-brand stuff, I cooked at home most nights. By the end of month three I sat down and actually looked at what I'd spent. €340. On food. For one person.
    </p>
    <p>
      I got it down to around €270 within two months, without eating worse. Here's what actually moved the needle.
    </p>

    <h2>Shop the Weekly Prospekte (This Alone Saves €30+)</h2>
    <p>
      German supermarkets rotate their offers every week — usually Monday to Sunday, though some chains (Lidl, Kaufland) switch on Thursday. The deals are real. Not "50 cents off" real — sometimes 40–60% off real.
    </p>
    <p>
      The week I started planning around offers, I got chicken breast for €3.49/kg instead of €6.99. Butter at €1.09 instead of €1.89. Greek yoghurt 4-pack at €1.29 instead of €2.19. That one shop saved me about €18 compared to what I'd normally spend. And I didn't buy anything I wouldn't have bought anyway.
    </p>
    <p>
      The apps people use for this: KaufDa, Marktguru. Or just check papierbox.eu — it aggregates the current week's offers across all five main chains, so you can search by product and see who has the best price right now.
    </p>

    <h2>Go Own-Brand on Everything Except the Two or Three Things That Actually Matter to You</h2>
    <p>
      Here's the thing. Lidl's own-brand pasta is excellent. Aldi's own-brand olive oil is good. Penny's own-brand yoghurt is perfectly fine. You don't need Barilla. You don't need Bertolli. The markup on branded goods in Germany is substantial — often 60–100% more for essentially the same product.
    </p>
    <p>
      That said: pick your battles. If you genuinely care about a specific coffee brand, keep it. Life is short. But for everything else — flour, rice, canned tomatoes, cooking oil, frozen vegetables — own-brand will taste the same and cost significantly less. I kept my Lavazza. I switched everything else. Saves roughly €15–20 a month.
    </p>

    <h2>The "Gelbe Linie" and Equivalent Discount Racks</h2>
    <p>
      Lidl has a section in many stores — often near the end of an aisle — with yellow price tags marking down items near their best-before date. Other chains have equivalents. This is where you find premium items at steep discounts: €4.99 Parmesan for €1.50, fancy yoghurts at 50% off, sometimes cheese or deli items that are perfectly fine for another few days.
    </p>
    <p>
      Shopping here requires flexibility (you get what's there, not what you planned) but if you're cooking at home regularly, this is free money. Check it every time you're in the store. Takes 30 seconds.
    </p>

    <h2>Buy Seasonal Produce — and Actually Stick to It</h2>
    <p>
      Out-of-season produce in Germany is expensive. Strawberries in January cost about three times what they do in June. Asparagus (Spargel) in April/May is €3.99/kg at peak season; any other time of year it's €8+ imported.
    </p>
    <p>
      The boring but effective approach: build your meals around what's cheap that week, not what you felt like eating when you opened the recipe app. Cabbage, carrots, potatoes, and onions are almost always affordable year-round. Courgettes and peppers are cheap in summer. Root vegetables in winter. Frozen veg — peas, edamame, spinach, broccoli — are nutritionally comparable to fresh and significantly cheaper whenever you need them out of season.
    </p>

    <h2>Check Multiple Stores for the Big-Ticket Items</h2>
    <p>
      I don't mean do your entire shop at three different stores every week — that's exhausting and the fuel or transit cost eats the savings. But for expensive items (a larger cut of meat, coffee, cheese, alcohol), it's worth knowing which store has the best deal this week before you commit.
    </p>
    <p>
      A 500g bag of ground coffee varies from €3.49 (on offer at Lidl one week) to €5.99 at the same store out-of-offer. Kaufland often has branded goods on their weekly deal list. Penny and Netto regularly put protein on deep discount. If you're spending €5+ on something, two minutes of price-checking is worth it.
    </p>

    <h2>What Doesn't Work</h2>
    <p>
      Buying in huge bulk "to save money" — unless you have storage space and actually use it all. Germans tend to shop more frequently and in smaller quantities than UK or US habits, partly because of smaller kitchens and partly because the stores are right there. Don't overbuy.
    </p>
    <p>
      Meal prepping so hard you hate the food by Wednesday. Sustainable savings come from habits you'll keep. If batch-cooking lentil soup works for you, great. If it makes you miserable and you end up ordering pizza, it hasn't saved anything.
    </p>

    <h2>The Easiest Single Win</h2>
    <p>
      Honestly, it's just checking current prices before you shop. It takes two minutes and consistently saves €10–20 per shop when you know what's on offer this week. <a href="https://www.papierbox.eu" className="text-[#22c55e] font-bold underline hover:no-underline">Papierbox</a> does this across all five major chains — search for what you need and see who has it cheapest right now.
    </p>
  </>
);

export const saveMoneyGroceriesPost: BlogPost = {
  slug: "how-to-save-money-groceries-germany",
  title: "How I Cut My German Grocery Bill by €70 a Month (Without Eating Sad Food)",
  titleDe: "Wie ich meine deutschen Lebensmittelkosten um €70 pro Monat gesenkt habe (ohne traurig zu essen)",
  description: "Real tips that actually worked: weekly offers, own-brand swaps, the discount rack, seasonal shopping — with honest numbers and no meal-prep evangelism.",
  descriptionDe: "Echte Tipps, die wirklich funktioniert haben: Wochenangebote, Eigenmarken, Rabattregale, saisonales Einkaufen — mit ehrlichen Zahlen.",
  date: "2026-04-05",
  readingTime: "7 min read",
  content,
};
