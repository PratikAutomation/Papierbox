import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        "primary": "#006e2f",
        "primary-container": "#22c55e",
        "primary-fixed": "#6bff8f",
        "primary-fixed-dim": "#4ae176",
        "on-primary": "#ffffff",
        "on-primary-container": "#004b1e",
        "on-primary-fixed": "#002109",
        "secondary": "#545f73",
        "secondary-container": "#d5e0f8",
        "secondary-fixed": "#d8e3fb",
        "on-secondary-fixed": "#111c2d",
        "tertiary": "#795900",
        "tertiary-container": "#daa300",
        "tertiary-fixed": "#ffdf9f",
        "tertiary-fixed-dim": "#f9bd22",
        "on-tertiary-fixed": "#261a00",
        "surface": "#f9f9f9",
        "surface-dim": "#dadada",
        "surface-bright": "#f9f9f9",
        "surface-container-lowest": "#ffffff",
        "surface-container-low": "#f3f3f3",
        "surface-container": "#eeeeee",
        "surface-container-high": "#e8e8e8",
        "surface-container-highest": "#e2e2e2",
        "on-surface": "#1a1c1c",
        "on-surface-variant": "#3d4a3d",
        "outline": "#1a1c1c",
        "outline-variant": "#bccbb9",
        "error": "#ba1a1a",
        "inverse-surface": "#2f3131",
        "inverse-primary": "#4ae176",
      },
      fontFamily: {
        headline: ["var(--font-headline)", "Plus Jakarta Sans", "Bricolage Grotesque", "sans-serif"],
        body: ["var(--font-body)", "Inter", "sans-serif"],
      },
      borderRadius: {
        DEFAULT: "0.5rem",
        lg: "1rem",
        xl: "1.5rem",
        "2xl": "2rem",
        "3xl": "1.5rem",
        full: "9999px",
      },
      boxShadow: {
        'neo': '4px 4px 0px 0px #1a1c1c',
        'neo-hover': '2px 2px 0px 0px #1a1c1c',
      },
    },
  },
  plugins: [],
};
export default config;
