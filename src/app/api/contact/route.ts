import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_KEY!;

// Simple in-memory rate limiter: max 3 requests per IP per minute
const rateLimitMap = new Map<string, { count: number; resetAt: number }>();
const RATE_LIMIT = 3;
const RATE_WINDOW_MS = 60_000;

function isRateLimited(ip: string): boolean {
  const now = Date.now();
  const entry = rateLimitMap.get(ip);
  if (!entry || now > entry.resetAt) {
    rateLimitMap.set(ip, { count: 1, resetAt: now + RATE_WINDOW_MS });
    return false;
  }
  entry.count++;
  return entry.count > RATE_LIMIT;
}

export async function POST(request: NextRequest) {
  try {
    const ip = request.headers.get("x-forwarded-for")?.split(",")[0]?.trim() || "unknown";
    if (isRateLimited(ip)) {
      return NextResponse.json({ error: "Too many requests" }, { status: 429 });
    }

    const body = await request.json();
    const firstName = (body.firstName || "").trim().slice(0, 100);
    const lastName = (body.lastName || "").trim().slice(0, 100);
    const email = (body.email || "").trim().slice(0, 254);
    const topic = (body.topic || "other").trim().slice(0, 50);
    const message = (body.message || "").trim().slice(0, 5000);
    const lang = (body.lang || "en").trim().slice(0, 5);

    if (!firstName || !email || !message) {
      return NextResponse.json({ error: "Name, email and message required" }, { status: 400 });
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    const { error } = await supabase.from("contact_messages").insert({
      first_name: firstName,
      last_name: lastName,
      email,
      topic,
      message,
      lang,
    });

    if (error) {
      console.error("Contact form error:", error);
      return NextResponse.json({ error: "Could not save message" }, { status: 500 });
    }

    return NextResponse.json({ success: true });
  } catch {
    return NextResponse.json({ error: "Internal error" }, { status: 500 });
  }
}
