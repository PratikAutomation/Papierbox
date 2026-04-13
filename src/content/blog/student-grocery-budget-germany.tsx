import React from "react";
import type { BlogPost } from "@/lib/blog";

const content = () => (
  <>
    <p>
      €30 a week for groceries sounds like a challenge. It's not, actually — if you know what you're doing. I'm not talking about eating plain rice every night. I mean actual meals that are filling, vaguely nutritious, and not depressing. Here's how the numbers work and what the week actually looks like.
    </p>

    <h2>The €30 Weekly Budget Reality Check</h2>
    <p>
      First, let's be honest about what €30 gets you. It's tight but totally viable for one person if you're cooking at home most nights and making smart choices. It doesn't work if you're buying pre-made meals, expensive branded products, or impulse-buying snacks. It absolutely works if you cook in batches and know which products are cheap and filling.
    </p>
    <p>
      The golden categories for student budgets: eggs, lentils, canned legumes, pasta, rice, potatoes, oats, frozen vegetables, and whatever protein is on offer that week. These form the backbone of eating cheaply in Germany without going insane.
    </p>

    <h2>The "Always on Deal Somewhere" Items</h2>
    <p>
      Some products rotate through offers so regularly that you can almost count on finding at least one chain offering them cheap each week:
    </p>
    <ul>
      <li><strong>Yoghurt:</strong> 4-packs go on offer constantly. Penny and Netto are particularly reliable here — €1.29–1.49 for a 4-pack of Greek style yoghurt isn't unusual on a deal week.</li>
      <li><strong>Eggs:</strong> 10-pack medium eggs hover around €1.79–2.19 most weeks. When they go on offer, you might see €1.49. Always worth checking.</li>
      <li><strong>Bread:</strong> Own-brand bread at the discounters is already cheap (€0.89–1.29 for a 750g loaf), and it goes on deal regularly.</li>
      <li><strong>Chicken:</strong> Chicken thighs or legs are reliably the cheapest protein source. On offer weeks, you can find them at €2.99–3.99/kg. Even off-offer, they're usually under €5/kg.</li>
      <li><strong>Seasonal vegetables:</strong> Whatever's in season is usually cheap. April = cabbage, carrots, leeks. Summer = courgettes, peppers, tomatoes. Winter = root vegetables, squash.</li>
    </ul>

    <h2>A Real Sample Week</h2>
    <p>
      Here's what a €30 week actually looks like, using realistic prices from current offers:
    </p>
    <ul>
      <li>Oats 1kg (Aldi own-brand): €1.19</li>
      <li>Milk 3.5% 1L × 2: €1.70</li>
      <li>Eggs 10-pack: €1.89</li>
      <li>Butter 250g: €1.19</li>
      <li>Pasta 500g × 2: €1.18</li>
      <li>Canned tomatoes × 3: €1.47</li>
      <li>Lentils 500g: €0.99</li>
      <li>Chicken thighs 1kg: €3.99</li>
      <li>Frozen spinach 750g: €1.19</li>
      <li>Potatoes 1.5kg bag: €1.29</li>
      <li>Carrots 1kg: €0.99</li>
      <li>Onions 1kg: €0.79</li>
      <li>Garlic: €0.49</li>
      <li>Olive oil 500ml (on offer): €2.49</li>
      <li>Yoghurt 4-pack: €1.39</li>
      <li>Bread 750g loaf: €0.99</li>
      <li>Cheese 400g block: €2.49</li>
      <li>Coffee 500g own-brand: €3.49</li>
    </ul>
    <p>
      Total: approximately €29.20. That covers breakfast (oats, eggs, yoghurt), lunches (bread, cheese, leftovers), and five or six dinners (pasta with tomato sauce, lentil curry, roast chicken with veg, fried rice). Not glamorous, but genuinely fine.
    </p>

    <h2>The €30 Traps to Avoid</h2>
    <p>
      Branded products. A branded pasta brand costs about twice as much as own-brand. On a tight budget that's a real cost. Lidl's own pasta (Combino) is perfectly fine. Aldi's is fine. Penny's is fine. Let it go.
    </p>
    <p>
      Pre-cut or prepared vegetables. Convenience pricing is brutal in Germany. A bag of pre-cut stir-fry veg costs €2.49. The same vegetables whole cost €0.60. You're paying €1.89 for someone to chop things for you. Do your own chopping.
    </p>
    <p>
      Drinks other than tap water. Germany has excellent tap water. Buy a water filter if you're paranoid, but the tap water is drinking quality almost everywhere. Buying sparkling water in bottles is a Pfand-returning exercise that adds €5+ to your weekly shop for no reason.
    </p>

    <h2>How to Go from €30 to €35 Without Noticing</h2>
    <p>
      The €30 budget is achievable but requires discipline. At €35 a week you can add a bit more variety: one nicer protein per week (salmon on offer, for example), some fruit beyond the cheapest options, an occasional treat like decent chocolate. This is a more sustainable long-term budget that doesn't feel like a punishment.
    </p>
    <p>
      The key to making either number work: check the weekly offers before you shop and build your protein and dairy choices around what's cheap that week. Takes two minutes. Saves €5–10 per shop. <a href="https://www.papierbox.eu" className="text-[#22c55e] font-bold underline hover:no-underline">Papierbox</a> compares all five main chains' current deals so you can see at a glance what's cheapest this week.
    </p>
  </>
);

export const studentBudgetPost: BlogPost = {
  slug: "student-grocery-budget-germany",
  title: "Grocery Shopping in Germany on a Student Budget: A Real Weekly Plan",
  titleDe: "Lebensmitteleinkauf in Deutschland mit Studentenbudget: Ein echter Wochenplan",
  description: "€30 a week for one person is doable in Germany — here's a real meal plan, actual prices, and which shortcuts are worth it and which aren't.",
  descriptionDe: "€30 pro Woche für eine Person ist in Deutschland machbar — hier ist ein echter Wochenplan, echte Preise und welche Abkürzungen sich lohnen.",
  date: "2026-03-24",
  readingTime: "7 min read",
  content,
};
