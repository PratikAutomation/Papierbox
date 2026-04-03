# Design System Specification: Editorial Grocery Fintech

## 1. Overview & Creative North Star
**The Creative North Star: "The Curated Larder"**
The objective of this design system is to move beyond the utilitarian "spreadsheet" feel of price comparison and adopt the sophisticated, high-trust aesthetic of modern neobanking. We are treating grocery data like a financial asset. 

To break the "standard template" look, we utilize **Editorial Asymmetry**. This means moving away from rigid, centered grids in favor of purposeful whitespace and overlapping elements. Headers should feel like magazine layouts—bold, oversized typography (`display-lg`) paired with generous `spacing-16` gutters. This creates a "premium" breathing room that feels intentional, not empty.

---

## 2. Colors & Surface Philosophy
The palette balances the vibrancy of fresh produce (`primary`) with the institutional authority of fintech (`on_secondary_fixed`).

### The "No-Line" Rule
**Explicit Instruction:** 1px solid borders for sectioning are strictly prohibited. 
Boundaries must be defined through background color shifts. For instance, a `surface_container_low` card should sit on a `surface` background. If you feel the need for a line, you haven't used enough tonal contrast.

### Surface Hierarchy & Nesting
Treat the UI as a series of physical layers, like stacked sheets of fine vellum.
*   **Base:** `surface` (#f9f9f9)
*   **Sectioning:** `surface_container_low` (#f3f3f3)
*   **Active Elements/Cards:** `surface_container_lowest` (#ffffff)
*   **Depth:** Use `surface_dim` (#dadada) only for inactive or backgrounded modal overlays.

### The "Glass & Signature Texture" Rule
To elevate the app's "soul," use **Glassmorphism** for floating navigation bars or sticky headers. Apply `surface_container_lowest` at 80% opacity with a `20px` backdrop blur. 
*   **Signature Gradient:** For primary CTAs, do not use flat green. Use a linear gradient: `primary` (#006e2f) to `primary_container` (#22c55e) at a 135° angle.

---

## 3. Typography
We use a dual-typeface system to balance editorial personality with data density.

*   **Display & Headlines (Plus Jakarta Sans):** Chosen for its geometric precision and modern "tech" feel. Use `display-md` for price totals to make them feel significant.
*   **UI & Body (Inter):** Reserved for high-readability tasks. `body-md` is your workhorse for product descriptions.
*   **The Hierarchy Play:** Always pair a `display-sm` headline with a `label-md` uppercase subheader (using `on_surface_variant`). The extreme scale contrast creates a premium, high-end feel.

---

## 4. Elevation & Depth
We eschew traditional "material" shadows for **Tonal Layering**.

*   **The Layering Principle:** Place `surface_container_lowest` (Pure White) cards on top of `surface_container` (#eeeeee) backgrounds. This creates a crisp, "lifted" look without a single drop shadow.
*   **Ambient Shadows:** If an element must float (e.g., a "Scan Receipt" FAB), use a shadow: `0px 20px 40px rgba(30, 41, 59, 0.06)`. Note the color is a tint of our Navy `on_secondary_fixed`, never pure black.
*   **The "Ghost Border" Fallback:** If accessibility requires a container boundary, use the `outline_variant` token at **15% opacity**. It should be felt, not seen.

---

## 5. Components

### Buttons
*   **Primary:** Gradient (`primary` to `primary_container`), `9999px` (Full) roundedness. 
*   **Secondary:** `surface_container_high` background with `on_surface` text. No border.
*   **States:** On hover, apply a `surface_bright` inner glow. On press, scale down to `0.97`.

### Cards & Lists
*   **The Divider Ban:** Never use horizontal lines between grocery items. Use `spacing-3` of vertical whitespace or alternating `surface` and `surface_container_low` backgrounds.
*   **Corner Radius:** All product cards must use `rounded-xl` (1.5rem).

### Input Fields
*   **Style:** Background-fill only using `surface_container_highest`. 
*   **Focus:** Transition the background to `surface_container_lowest` and add a `2px` "Ghost Border" using the `primary` token at 30% opacity.

### Comparison Chips
*   **Price Trend Chips:** Use `tertiary_fixed_dim` (Yellow) for "Neutral/Watch" prices and `primary_fixed` (Light Green) for "Best Value." These should be `rounded-full` with `label-sm` bold text.

---

## 6. Do’s and Don’ts

### Do
*   **DO** use `spacing-12` and `spacing-16` for page margins to create an "expensive" feel.
*   **DO** overlap images of groceries over card boundaries to break the "boxed-in" look.
*   **DO** use `plusJakartaSans` for any numerical data (prices, weights, savings).

### Don't
*   **DON'T** use 100% black (#000000). Use `on_surface` (#1a1c1c) for text to maintain softness.
*   **DON'T** use `rounded-none`. Even small elements like checkboxes must use at least `rounded-sm`.
*   **DON'T** crowd the screen. If you can't fit it without a divider line, move it to a sub-page or a progressive disclosure "See More" link.

### Accessibility Note
While we prioritize "Ghost Borders" and subtle shifts, ensure that the contrast ratio between `surface` and `on_surface` text remains at least 4.5:1. When using `tertiary` (Yellow) accents, always pair them with `on_tertiary_fixed` (Dark Brown/Black) for legibility.