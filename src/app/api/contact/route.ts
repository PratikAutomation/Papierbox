import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_KEY!;
const WEB3FORMS_KEY = "79d8e709-6ea4-4a6c-85d5-d2aaf91b7641";

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const firstName = (body.firstName || "").trim();
    const lastName = (body.lastName || "").trim();
    const email = (body.email || "").trim();
    const topic = (body.topic || "other").trim();
    const message = (body.message || "").trim();
    const lang = (body.lang || "en").trim();

    if (!firstName || !email || !message) {
      return NextResponse.json({ error: "Name, email and message required" }, { status: 400 });
    }

    // 1. Save to Supabase
    const supabase = createClient(supabaseUrl, supabaseServiceKey);
    await supabase.from("contact_messages").insert({
      first_name: firstName,
      last_name: lastName,
      email,
      topic,
      message,
      lang,
    });

    // 2. Send email to info@papierbox.eu via Web3Forms
    await fetch("https://api.web3forms.com/submit", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        access_key: WEB3FORMS_KEY,
        subject: `[Papierbox] ${topic.toUpperCase()} from ${firstName} ${lastName}`,
        from_name: `${firstName} ${lastName}`,
        replyto: email,
        name: `${firstName} ${lastName}`,
        email: email,
        topic: topic,
        message: message,
        language: lang,
      }),
    });

    return NextResponse.json({ success: true });
  } catch {
    return NextResponse.json({ error: "Internal error" }, { status: 500 });
  }
}
