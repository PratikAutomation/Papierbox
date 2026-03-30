"use client";

import { useState } from "react";
import Header from "@/components/Header";
import Footer from "@/components/Footer";

export default function Contact() {
  const [lang, setLang] = useState<"en" | "de">("en");
  const [form, setForm] = useState({ firstName: "", lastName: "", topic: "feedback", message: "" });
  const [status, setStatus] = useState<"idle" | "sending" | "sent" | "error">("idle");

  const t = {
    en: {
      headline: "Get in Touch",
      subtitle: "Feedback, ideas, collaboration — we'd love to hear from you.",
      firstName: "First Name",
      lastName: "Last Name",
      topic: "Topic",
      topicFeedback: "Feedback",
      topicBug: "Bug Report",
      topicCollab: "Collaboration",
      topicPress: "Press / Media",
      topicOther: "Other",
      message: "Your Message",
      messagePlaceholder: "Tell us what's on your mind...",
      send: "Send Message",
      sending: "Sending...",
      sent: "Message sent! We'll get back to you soon.",
      error: "Something went wrong. Try emailing us directly.",
      email: "Or email us directly at",
      response: "We typically respond within 24 hours.",
    },
    de: {
      headline: "Kontakt",
      subtitle: "Feedback, Ideen, Zusammenarbeit — wir freuen uns von dir zu hören.",
      firstName: "Vorname",
      lastName: "Nachname",
      topic: "Thema",
      topicFeedback: "Feedback",
      topicBug: "Fehlermeldung",
      topicCollab: "Zusammenarbeit",
      topicPress: "Presse / Medien",
      topicOther: "Sonstiges",
      message: "Deine Nachricht",
      messagePlaceholder: "Was möchtest du uns mitteilen...",
      send: "Nachricht senden",
      sending: "Wird gesendet...",
      sent: "Nachricht gesendet! Wir melden uns bald bei dir.",
      error: "Etwas ist schiefgelaufen. Schreib uns direkt per E-Mail.",
      email: "Oder schreib uns direkt an",
      response: "Wir antworten in der Regel innerhalb von 24 Stunden.",
    },
  };

  const l = t[lang];

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!form.firstName || !form.message) return;

    setStatus("sending");
    try {
      const res = await fetch("/api/contact", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ...form, lang }),
      });
      if (res.ok) {
        setStatus("sent");
        setForm({ firstName: "", lastName: "", topic: "feedback", message: "" });
      } else {
        setStatus("error");
      }
    } catch {
      setStatus("error");
    }
  }

  return (
    <>
      <Header lang={lang} setLang={setLang} />
      <main className="pt-32 pb-16 grainy-bg">
        <section className="max-w-3xl mx-auto px-6">
          {/* Hero */}
          <div className="mb-12">
            <h1 className="font-headline font-black text-4xl md:text-6xl tracking-tight leading-[1.1] text-[#1a1c1c] mb-4">
              {l.headline} <span className="text-[#22c55e]">.</span>
            </h1>
            <p className="font-headline font-bold text-lg md:text-xl text-[#1a1c1c] opacity-50">
              {l.subtitle}
            </p>
          </div>

          {/* Form Card */}
          {status === "sent" ? (
            <div className="bg-[#22c55e] border-4 border-[#1a1c1c] rounded-[2rem] p-8 md:p-12 shadow-neo text-center">
              <div className="text-6xl mb-4">✅</div>
              <h2 className="font-headline font-black text-2xl md:text-3xl text-white mb-2">
                {l.sent}
              </h2>
              <p className="text-white/70 font-bold">{l.response}</p>
            </div>
          ) : (
            <form onSubmit={handleSubmit}>
              <div className="bg-white border-4 border-[#1a1c1c] rounded-[2rem] p-8 md:p-12 shadow-neo">

                {/* Name Row */}
                <div className="flex flex-col md:flex-row gap-4 mb-6">
                  <div className="flex-1">
                    <label className="font-headline font-black text-sm text-[#1a1c1c] uppercase tracking-widest mb-2 block">
                      {l.firstName} *
                    </label>
                    <input
                      type="text"
                      required
                      value={form.firstName}
                      onChange={(e) => setForm({ ...form, firstName: e.target.value })}
                      className="w-full px-5 py-4 bg-[#f5f5f5] border-2 border-[#1a1c1c]/10 rounded-xl font-bold text-[#1a1c1c] focus:border-[#22c55e] focus:ring-0 outline-none transition-all"
                    />
                  </div>
                  <div className="flex-1">
                    <label className="font-headline font-black text-sm text-[#1a1c1c] uppercase tracking-widest mb-2 block">
                      {l.lastName}
                    </label>
                    <input
                      type="text"
                      value={form.lastName}
                      onChange={(e) => setForm({ ...form, lastName: e.target.value })}
                      className="w-full px-5 py-4 bg-[#f5f5f5] border-2 border-[#1a1c1c]/10 rounded-xl font-bold text-[#1a1c1c] focus:border-[#22c55e] focus:ring-0 outline-none transition-all"
                    />
                  </div>
                </div>

                {/* Topic */}
                <div className="mb-6">
                  <label className="font-headline font-black text-sm text-[#1a1c1c] uppercase tracking-widest mb-2 block">
                    {l.topic}
                  </label>
                  <select
                    value={form.topic}
                    onChange={(e) => setForm({ ...form, topic: e.target.value })}
                    className="w-full px-5 py-4 bg-[#f5f5f5] border-2 border-[#1a1c1c]/10 rounded-xl font-bold text-[#1a1c1c] focus:border-[#22c55e] focus:ring-0 outline-none transition-all appearance-none cursor-pointer"
                  >
                    <option value="feedback">{l.topicFeedback}</option>
                    <option value="bug">{l.topicBug}</option>
                    <option value="collaboration">{l.topicCollab}</option>
                    <option value="press">{l.topicPress}</option>
                    <option value="other">{l.topicOther}</option>
                  </select>
                </div>

                {/* Message */}
                <div className="mb-8">
                  <label className="font-headline font-black text-sm text-[#1a1c1c] uppercase tracking-widest mb-2 block">
                    {l.message} *
                  </label>
                  <textarea
                    required
                    rows={5}
                    value={form.message}
                    onChange={(e) => setForm({ ...form, message: e.target.value })}
                    placeholder={l.messagePlaceholder}
                    className="w-full px-5 py-4 bg-[#f5f5f5] border-2 border-[#1a1c1c]/10 rounded-xl font-bold text-[#1a1c1c] placeholder:text-[#1a1c1c]/20 focus:border-[#22c55e] focus:ring-0 outline-none transition-all resize-none"
                  />
                </div>

                {/* Submit */}
                <button
                  type="submit"
                  disabled={status === "sending"}
                  className="w-full bg-[#22c55e] text-white font-headline font-black text-lg py-5 rounded-full border-4 border-[#1a1c1c] shadow-neo hover:shadow-neo-hover hover:translate-x-[2px] hover:translate-y-[2px] transition-all active:translate-x-[4px] active:translate-y-[4px] active:shadow-none disabled:opacity-50"
                >
                  {status === "sending" ? l.sending : l.send}
                </button>

                {status === "error" && (
                  <p className="text-red-500 font-bold text-center mt-4">{l.error}</p>
                )}
              </div>
            </form>
          )}

          {/* Email Fallback */}
          <div className="text-center mt-8">
            <p className="text-[#1a1c1c]/40 font-bold text-sm">
              {l.email}{" "}
              <a href="mailto:info@papierbox.eu" className="text-[#22c55e] font-black hover:underline">
                info@papierbox.eu
              </a>
            </p>
            <p className="text-[#1a1c1c]/25 font-bold text-xs mt-2">{l.response}</p>
          </div>
        </section>
      </main>
      <Footer lang={lang} />
    </>
  );
}
