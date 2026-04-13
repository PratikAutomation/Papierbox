import { notFound } from "next/navigation";
import { Metadata } from "next";
import { ALL_POSTS } from "@/lib/blog";
import BlogPostClient from "./blog-post-client";

export function generateStaticParams() {
  return ALL_POSTS.map((post) => ({ slug: post.slug }));
}

export async function generateMetadata({ params }: { params: { slug: string } }): Promise<Metadata> {
  const post = ALL_POSTS.find((p) => p.slug === params.slug);
  if (!post) return {};
  return {
    title: `${post.title} | Papierbox`,
    description: post.description,
    alternates: { canonical: `https://www.papierbox.eu/blog/${post.slug}` },
    openGraph: {
      title: post.title,
      description: post.description,
      url: `https://www.papierbox.eu/blog/${post.slug}`,
      type: "article",
      publishedTime: post.date,
    },
  };
}

export default function BlogPostPage({ params }: { params: { slug: string } }) {
  const post = ALL_POSTS.find((p) => p.slug === params.slug);
  if (!post) return notFound();
  return <BlogPostClient post={post} />;
}
