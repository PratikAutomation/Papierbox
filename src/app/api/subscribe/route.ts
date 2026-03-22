import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const email = (body.email || "").trim().toLowerCase();
    const city = (body.city || "hamburg").trim();
    const lang = (body.lang || "en").trim();

    if (!email || !email.includes("@") || email.length < 5) {
      return NextResponse.json({ error: "Valid email required" }, { status: 400 });
    }

    const supabase = createClient(supabaseUrl, supabaseAnonKey);

    const { error } = await supabase.from("subscribers").upsert(
      { email, city, lang, is_active: true },
      { onConflict: "email" }
    );

    if (error) {
      console.error("Subscribe error:", error);
      return NextResponse.json({ error: "Could not subscribe" }, { status: 500 });
    }

    return NextResponse.json({ success: true });
  } catch {
    return NextResponse.json({ error: "Internal error" }, { status: 500 });
  }
}
