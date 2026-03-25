"use client";

import Link from "next/link";
import Image from "next/image";

interface HeaderProps {
  lang: "en" | "de";
  setLang: (lang: "en" | "de") => void;
}

export default function Header({ lang, setLang }: HeaderProps) {
  return (
    <header className="fixed top-0 w-full z-50 glass-header">
      <nav className="flex justify-between items-center px-6 py-4 max-w-7xl mx-auto">
        <Link href="/" className="flex items-center gap-3 hover:opacity-80 transition-opacity">
          <Image
            src="/logo.png"
            alt="Papierbox"
            width={48}
            height={48}
            className="h-12 w-auto"
            priority
          />
          <span className="text-[#1a1c1c] font-headline font-black text-xl tracking-tight uppercase">
            Papierbox
          </span>
        </Link>
        <div className="flex items-center gap-6 font-headline font-bold text-sm">
          <div className="flex items-center gap-2 bg-white px-2 py-2 rounded-full border-2 border-[#1a1c1c] shadow-[2px_2px_0px_0px_#1a1c1c]">
            <button
              onClick={() => setLang("en")}
              className={`px-3 py-1 rounded-full transition-all ${
                lang === "en"
                  ? "bg-[#22c55e] text-white"
                  : "text-[#1a1c1c] hover:bg-gray-100"
              }`}
            >
              EN
            </button>
            <button
              onClick={() => setLang("de")}
              className={`px-3 py-1 rounded-full transition-all ${
                lang === "de"
                  ? "bg-[#22c55e] text-white"
                  : "text-[#1a1c1c] hover:bg-gray-100"
              }`}
            >
              DE
            </button>
          </div>
        </div>
      </nav>
    </header>
  );
}
