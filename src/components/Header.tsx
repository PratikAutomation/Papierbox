"use client";

import Link from "next/link";
import Image from "next/image";

interface HeaderProps {
  lang: "en" | "de";
  setLang: (lang: "en" | "de") => void;
}

export default function Header({ lang, setLang }: HeaderProps) {
  return (
    <header className="fixed top-0 w-full z-50 bg-white/95 backdrop-blur-md border-b-2 border-[#1a1c1c]/10">
      <nav className="flex justify-between items-center px-4 sm:px-6 py-2 sm:py-3 max-w-7xl mx-auto">
        <Link href="/" className="hover:opacity-80 transition-opacity shrink-0">
          <Image
            src="/logo.png"
            alt="Papierbox"
            width={524}
            height={476}
            className="h-10 sm:h-14 w-auto"
            priority
          />
        </Link>
        <div className="flex items-center font-headline font-bold text-sm">
          <div className="flex items-center gap-1 sm:gap-2 bg-white px-1.5 sm:px-2 py-1.5 sm:py-2 rounded-full border-2 border-[#1a1c1c] shadow-[2px_2px_0px_0px_#1a1c1c]">
            <button
              onClick={() => setLang("en")}
              className={`px-2.5 sm:px-3 py-1 rounded-full transition-all text-xs sm:text-sm ${
                lang === "en"
                  ? "bg-[#22c55e] text-white"
                  : "text-[#1a1c1c] hover:bg-gray-100"
              }`}
            >
              EN
            </button>
            <button
              onClick={() => setLang("de")}
              className={`px-2.5 sm:px-3 py-1 rounded-full transition-all text-xs sm:text-sm ${
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
