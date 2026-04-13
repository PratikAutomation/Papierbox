import { MetadataRoute } from "next";

const CITIES = [
  "hamburg","berlin","munich","cologne","frankfurt","stuttgart","duesseldorf",
  "leipzig","dresden","hannover","nuremberg","bremen","regensburg","heidelberg",
  "freiburg","aachen","goettingen","mannheim","karlsruhe","bonn","muenster",
  "augsburg","wuerzburg","kiel","dortmund",
];

const STORES = ["lidl","aldi-sued","penny","kaufland","netto"];

// Hardcoded to avoid importing React/JSX files at sitemap runtime
const BLOG_POSTS = [
  { slug: "cheapest-supermarkets-germany-expats-2026", date: "2026-04-10" },
  { slug: "lidl-vs-aldi-which-is-cheaper", date: "2026-04-08" },
  { slug: "how-to-save-money-groceries-germany", date: "2026-04-05" },
  { slug: "german-supermarket-guide-beginners", date: "2026-04-02" },
  { slug: "weekly-offers-germany-how-they-work", date: "2026-03-30" },
  { slug: "aldi-sued-vs-aldi-nord-difference", date: "2026-03-27" },
  { slug: "student-grocery-budget-germany", date: "2026-03-24" },
  { slug: "kaufland-vs-penny-vs-netto", date: "2026-03-20" },
];

export default function sitemap(): MetadataRoute.Sitemap {
  const baseUrl = "https://www.papierbox.eu";
  const now = new Date();

  const staticPages: MetadataRoute.Sitemap = [
    { url: baseUrl, lastModified: now, changeFrequency: "daily", priority: 1 },
    { url: `${baseUrl}/blog`, lastModified: now, changeFrequency: "weekly", priority: 0.9 },
    { url: `${baseUrl}/angebote`, lastModified: now, changeFrequency: "daily", priority: 0.9 },
    { url: `${baseUrl}/preisvergleich`, lastModified: now, changeFrequency: "weekly", priority: 0.8 },
    { url: `${baseUrl}/story`, lastModified: now, changeFrequency: "monthly", priority: 0.6 },
    { url: `${baseUrl}/how-it-works`, lastModified: now, changeFrequency: "monthly", priority: 0.6 },
    { url: `${baseUrl}/impressum`, lastModified: now, changeFrequency: "yearly", priority: 0.3 },
    { url: `${baseUrl}/privacy`, lastModified: now, changeFrequency: "yearly", priority: 0.3 },
  ];

  const cityPages: MetadataRoute.Sitemap = CITIES.map((city) => ({
    url: `${baseUrl}/angebote/${city}`,
    lastModified: now,
    changeFrequency: "daily",
    priority: 0.85,
  }));

  const cityStorePages: MetadataRoute.Sitemap = CITIES.flatMap((city) =>
    STORES.map((store) => ({
      url: `${baseUrl}/angebote/${city}/${store}`,
      lastModified: now,
      changeFrequency: "daily",
      priority: 0.8,
    }))
  );

  const blogPages: MetadataRoute.Sitemap = BLOG_POSTS.map((post) => ({
    url: `${baseUrl}/blog/${post.slug}`,
    lastModified: new Date(post.date),
    changeFrequency: "monthly",
    priority: 0.75,
  }));

  return [...staticPages, ...cityPages, ...cityStorePages, ...blogPages];
}
