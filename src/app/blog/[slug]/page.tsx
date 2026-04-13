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

  // Call content() server-side — functions can't cross the server→client boundary,
  // but the resulting ReactNode can be passed as children
  const renderedContent = post.content();

  return (
    <BlogPostClient
      title={post.title}
      titleDe={post.titleDe}
      description={post.description}
      descriptionDe={post.descriptionDe}
      date={post.date}
      readingTime={post.readingTime}
      slug={post.slug}
    >
      {renderedContent}
    </BlogPostClient>
  );
}
