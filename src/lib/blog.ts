import React from "react";
import { cheapestSupermarketsPost } from "@/content/blog/cheapest-supermarkets-germany-expats-2026";
import { lidlVsAldiPost } from "@/content/blog/lidl-vs-aldi-which-is-cheaper";
import { saveMoneyGroceriesPost } from "@/content/blog/how-to-save-money-groceries-germany";
import { supermarketGuidePost } from "@/content/blog/german-supermarket-guide-beginners";
import { weeklyOffersPost } from "@/content/blog/weekly-offers-germany-how-they-work";
import { aldiSuedNordPost } from "@/content/blog/aldi-sued-vs-aldi-nord-difference";
import { studentBudgetPost } from "@/content/blog/student-grocery-budget-germany";
import { kauflandPennyNettoPost } from "@/content/blog/kaufland-vs-penny-vs-netto";

export interface BlogPost {
  slug: string;
  title: string;
  titleDe: string;
  description: string;
  descriptionDe: string;
  date: string;
  readingTime: string;
  content: () => React.ReactNode;
}

export const ALL_POSTS: BlogPost[] = [
  cheapestSupermarketsPost,
  lidlVsAldiPost,
  saveMoneyGroceriesPost,
  supermarketGuidePost,
  weeklyOffersPost,
  aldiSuedNordPost,
  studentBudgetPost,
  kauflandPennyNettoPost,
].sort((a, b) => (a.date > b.date ? -1 : 1));
