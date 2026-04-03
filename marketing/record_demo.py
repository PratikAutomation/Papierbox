r"""
Record a YC-style product demo video of papierbox.eu
With auto-zoom on magic moments + glowing cursor spotlight.

Usage:
  cd C:\petroject\Project_1\marketing
  python record_demo.py
"""
import os
import time
from playwright.sync_api import sync_playwright

OUTPUT_DIR = os.path.dirname(os.path.abspath(__file__))
VIDEO_PATH = os.path.join(OUTPUT_DIR, "demo_videos")
os.makedirs(VIDEO_PATH, exist_ok=True)


def inject_cursor_spotlight(page):
    """Inject a glowing cursor spotlight that follows the mouse."""
    page.evaluate("""
        () => {
            // Create spotlight element
            const spot = document.createElement('div');
            spot.id = 'cursor-spotlight';
            spot.style.cssText = `
                position: fixed;
                width: 28px; height: 28px;
                border-radius: 50%;
                border: 3px solid rgba(34, 197, 94, 0.8);
                background: rgba(34, 197, 94, 0.12);
                pointer-events: none;
                z-index: 99999;
                transition: transform 0.15s ease-out, left 0.08s ease-out, top 0.08s ease-out;
                box-shadow: 0 0 20px rgba(34, 197, 94, 0.3), 0 0 6px rgba(34, 197, 94, 0.5);
                transform: translate(-50%, -50%);
            `;
            document.body.appendChild(spot);

            // Click ripple effect
            const ripple = document.createElement('div');
            ripple.id = 'cursor-ripple';
            ripple.style.cssText = `
                position: fixed;
                width: 28px; height: 28px;
                border-radius: 50%;
                border: 2px solid rgba(34, 197, 94, 0.6);
                pointer-events: none;
                z-index: 99998;
                transform: translate(-50%, -50%) scale(1);
                opacity: 0;
                transition: none;
            `;
            document.body.appendChild(ripple);

            // Follow mouse
            document.addEventListener('mousemove', (e) => {
                spot.style.left = e.clientX + 'px';
                spot.style.top = e.clientY + 'px';
                ripple.style.left = e.clientX + 'px';
                ripple.style.top = e.clientY + 'px';
            });

            // Click animation
            document.addEventListener('mousedown', (e) => {
                spot.style.transform = 'translate(-50%, -50%) scale(0.8)';
                ripple.style.transition = 'none';
                ripple.style.transform = 'translate(-50%, -50%) scale(1)';
                ripple.style.opacity = '0.8';
                ripple.style.left = e.clientX + 'px';
                ripple.style.top = e.clientY + 'px';
                setTimeout(() => {
                    ripple.style.transition = 'transform 0.5s ease-out, opacity 0.5s ease-out';
                    ripple.style.transform = 'translate(-50%, -50%) scale(3)';
                    ripple.style.opacity = '0';
                }, 10);
            });
            document.addEventListener('mouseup', () => {
                spot.style.transform = 'translate(-50%, -50%) scale(1)';
            });
        }
    """)


def zoom_to(page, selector, zoom=1.5, duration=0.8):
    """Smooth zoom into a specific element."""
    page.evaluate(f"""
        (sel) => {{
            const el = document.querySelector(sel);
            if (!el) return;
            const rect = el.getBoundingClientRect();
            const centerX = rect.left + rect.width / 2;
            const centerY = rect.top + rect.height / 2;

            document.body.style.transition = 'transform {duration}s cubic-bezier(0.4, 0, 0.2, 1)';
            document.body.style.transformOrigin = centerX + 'px ' + centerY + 'px';
            document.body.style.transform = 'scale({zoom})';
        }}
    """, selector)
    time.sleep(duration + 0.3)


def zoom_reset(page, duration=0.6):
    """Smoothly zoom back to normal."""
    page.evaluate(f"""
        () => {{
            document.body.style.transition = 'transform {duration}s cubic-bezier(0.4, 0, 0.2, 1)';
            document.body.style.transform = 'scale(1)';
        }}
    """)
    time.sleep(duration + 0.2)


def smooth_move_to_el(page, element):
    """Smoothly move cursor to a Playwright element handle."""
    if not element:
        return
    box = element.bounding_box()
    if not box:
        return
    cx = box["x"] + box["width"] / 2
    cy = box["y"] + box["height"] / 2
    page.evaluate(f"""
        () => {{
            const spot = document.getElementById('cursor-spotlight');
            const ripple = document.getElementById('cursor-ripple');
            if (spot) {{ spot.style.left = '{cx}px'; spot.style.top = '{cy}px'; }}
            if (ripple) {{ ripple.style.left = '{cx}px'; ripple.style.top = '{cy}px'; }}
        }}
    """)
    page.mouse.move(cx, cy, steps=20)
    time.sleep(0.5)


def human_type(page, selector, text, delay=130):
    """Type text character by character like a human."""
    page.click(selector)
    time.sleep(0.3)
    for char in text:
        page.keyboard.type(char, delay=delay)
        time.sleep(0.03)


def smooth_scroll(page, distance=400, steps=10):
    """Smooth scroll down."""
    for _ in range(steps):
        page.evaluate(f"window.scrollBy(0, {distance // steps})")
        time.sleep(0.12)


def record_demo(search_term="Butter", city_value="hamburg", city_label="Hamburg", name="demo_main"):
    """Record the main product demo."""

    print(f"\n{'='*50}")
    print(f"RECORDING: {name}")
    print(f"Search: '{search_term}' in {city_label}")
    print(f"{'='*50}")

    with sync_playwright() as p:
        browser = p.chromium.launch(
            headless=False,
            args=[
                "--disable-extensions",
                "--disable-infobars",
            ],
        )

        # Desktop version (1280x720 — clean 16:9)
        context = browser.new_context(
            viewport={"width": 1280, "height": 720},
            record_video_dir=VIDEO_PATH,
            record_video_size={"width": 1280, "height": 720},
            locale="en-US",
            color_scheme="light",
        )

        page = context.new_page()

        # ============================================
        # SCENE 1: Land on homepage (3 sec)
        # ============================================
        print("  Scene 1: Homepage...")
        page.goto("https://www.papierbox.eu", wait_until="networkidle")
        time.sleep(1.5)

        # Inject cursor spotlight
        inject_cursor_spotlight(page)
        time.sleep(1.5)

        # ============================================
        # SCENE 2: Zoom into search bar (2 sec)
        # ============================================
        print("  Scene 2: Zoom to search...")
        zoom_to(page, ".bg-white.p-2", zoom=1.15, duration=0.8)
        time.sleep(1)

        # ============================================
        # SCENE 3: Select city (3 sec)
        # ============================================
        print("  Scene 3: Select city...")
        city_select = page.query_selector("select")
        smooth_move_to_el(page, city_select)
        time.sleep(0.3)
        if city_select:
            city_select.click()
            time.sleep(0.5)
        page.select_option("select", city_value)
        time.sleep(1)

        # ============================================
        # SCENE 4: Type search query (4 sec)
        # ============================================
        print(f"  Scene 4: Typing '{search_term}'...")
        search_input = page.query_selector("input[type='text']")
        smooth_move_to_el(page, search_input)
        time.sleep(0.3)
        if search_input:
            search_input.click()
            time.sleep(0.3)
            for char in search_term:
                page.keyboard.type(char, delay=150)
                time.sleep(0.03)
        time.sleep(1)

        # ============================================
        # SCENE 5: Zoom to GO button + click (2 sec)
        # ============================================
        print("  Scene 5: Click GO...")
        # Find GO button by looking for buttons with arrow_forward icon
        go_button = page.query_selector("button.neo-button") or page.query_selector("button.bg-primary")
        if not go_button:
            # Fallback: find any button in the search area
            buttons = page.query_selector_all("button")
            for btn in buttons:
                txt = btn.inner_text()
                if "GO" in txt or "LOS" in txt:
                    go_button = btn
                    break
        smooth_move_to_el(page, go_button)
        time.sleep(0.5)
        if go_button:
            go_button.click()
        time.sleep(0.5)

        # ============================================
        # SCENE 6: Zoom out to show results (2 sec)
        # ============================================
        print("  Scene 6: Zoom out for results...")
        zoom_reset(page, duration=0.8)
        time.sleep(2)

        # ============================================
        # SCENE 7: Zoom into first result card (3 sec)
        # ============================================
        print("  Scene 7: Zoom to best deal...")
        # Wait for results to load
        time.sleep(1)

        # Scroll to results
        smooth_scroll(page, distance=350, steps=8)
        time.sleep(1)

        # Try to zoom into the first price card (subtle zoom)
        first_card = page.query_selector("[class*='rounded-[2rem]']:not(header *)")
        if first_card:
            box = first_card.bounding_box()
            if box:
                page.evaluate(f"""
                    () => {{
                        document.body.style.transition = 'transform 0.8s cubic-bezier(0.4, 0, 0.2, 1)';
                        document.body.style.transformOrigin = '{box["x"] + box["width"]/2}px {box["y"] + box["height"]/2}px';
                        document.body.style.transform = 'scale(1.12)';
                    }}
                """)
                time.sleep(2)

        # ============================================
        # SCENE 8: Zoom out, scroll through more (4 sec)
        # ============================================
        print("  Scene 8: Scroll through results...")
        zoom_reset(page, duration=0.6)
        time.sleep(0.5)
        smooth_scroll(page, distance=500, steps=12)
        time.sleep(2)

        # ============================================
        # SCENE 9: Scroll back to top — show the hero (3 sec)
        # ============================================
        print("  Scene 9: Back to top...")
        page.evaluate("window.scrollTo({top: 0, behavior: 'smooth'})")
        time.sleep(2)

        # ============================================
        # SCENE 10: Final zoom on logo/URL (2 sec)
        # ============================================
        print("  Scene 10: Final hold on logo...")
        logo = page.query_selector("header img")
        if logo:
            box = logo.bounding_box()
            if box:
                page.evaluate(f"""
                    () => {{
                        document.body.style.transition = 'transform 0.8s cubic-bezier(0.4, 0, 0.2, 1)';
                        document.body.style.transformOrigin = '{box["x"] + box["width"]/2}px {box["y"] + box["height"]/2}px';
                        document.body.style.transform = 'scale(1.2)';
                    }}
                """)
        time.sleep(2.5)

        # Close
        page.close()
        context.close()
        browser.close()

    # Rename the video file
    video_files = sorted(
        [f for f in os.listdir(VIDEO_PATH) if f.endswith(".webm")],
        key=lambda f: os.path.getmtime(os.path.join(VIDEO_PATH, f)),
        reverse=True,
    )

    if video_files:
        latest = video_files[0]
        old_path = os.path.join(VIDEO_PATH, latest)
        new_path = os.path.join(VIDEO_PATH, f"{name}.webm")
        if os.path.exists(new_path):
            os.remove(new_path)
        os.rename(old_path, new_path)
        size_mb = os.path.getsize(new_path) / (1024 * 1024)
        print(f"\n  Saved: {new_path} ({size_mb:.1f} MB)")
    else:
        print("  WARNING: No video file found")


def record_mobile_demo(search_term="Butter", city_value="hamburg", city_label="Hamburg", name="demo_mobile"):
    """
    Record a YC-quality mobile demo (portrait 430x932 — iPhone 15 Pro size).

    Flow designed for maximum impact:
    - Show the problem (headline)
    - Show the solution (search + results)
    - Let results breathe (slow scroll)
    - End on the brand
    """

    print(f"\n{'='*50}")
    print(f"RECORDING MOBILE: {name}")
    print(f"Search: '{search_term}' in {city_label}")
    print(f"{'='*50}")

    with sync_playwright() as p:
        browser = p.chromium.launch(
            headless=False,
            args=["--disable-extensions", "--disable-infobars"],
        )

        # iPhone 15 Pro dimensions — clean mobile view
        context = browser.new_context(
            viewport={"width": 430, "height": 932},
            record_video_dir=VIDEO_PATH,
            record_video_size={"width": 430, "height": 932},
            locale="en-US",
            color_scheme="light",
            user_agent="Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15",
        )

        page = context.new_page()

        # ============================================
        # SCENE 1: Homepage hero (0-4 sec)
        # Let the headline sink in — "Stop overpaying"
        # ============================================
        print("  Scene 1: Homepage hero (4s)...")
        page.goto("https://www.papierbox.eu", wait_until="networkidle")
        time.sleep(4)

        # ============================================
        # SCENE 2: Slow scroll to reveal search bar (4-6 sec)
        # User discovers the search
        # ============================================
        print("  Scene 2: Reveal search bar (2s)...")
        for _ in range(5):
            page.evaluate("window.scrollBy(0, 40)")
            time.sleep(0.3)
        time.sleep(1)

        # ============================================
        # SCENE 3: Select city (6-9 sec)
        # Show it's location-aware
        # ============================================
        print("  Scene 3: Select city (3s)...")
        time.sleep(0.5)
        page.select_option("select", city_value)
        time.sleep(2)

        # ============================================
        # SCENE 4: Type search term slowly (9-14 sec)
        # The magic starts — character by character
        # ============================================
        print(f"  Scene 4: Typing '{search_term}' (5s)...")
        search_input = page.query_selector("input[type='text']")
        if search_input:
            search_input.click()
            time.sleep(0.5)
            for char in search_term:
                page.keyboard.type(char, delay=180)
                time.sleep(0.05)
        time.sleep(1.5)

        # ============================================
        # SCENE 5: Dismiss autocomplete + press GO (14-17 sec)
        # Close suggestions, find GO, click it
        # ============================================
        print("  Scene 5: Press GO (3s)...")
        # Press Escape to dismiss autocomplete dropdown
        page.keyboard.press("Escape")
        time.sleep(0.8)

        # Click somewhere neutral to ensure autocomplete is closed
        page.mouse.click(10, 10)
        time.sleep(0.5)

        # Now find and click GO button
        go_button = None
        buttons = page.query_selector_all("button")
        for btn in buttons:
            try:
                txt = btn.inner_text()
                if "GO" in txt or "LOS" in txt:
                    go_button = btn
                    break
            except:
                continue

        if go_button:
            go_button.scroll_into_view_if_needed()
            time.sleep(0.3)
            go_button.click()
        time.sleep(1)

        # ============================================
        # SCENE 6: Results loading + appear (17-21 sec)
        # The reveal moment — results slide in
        # ============================================
        print("  Scene 6: Results appear (4s)...")
        time.sleep(4)

        # ============================================
        # SCENE 7: Slow scroll through results (21-28 sec)
        # Show different stores, prices, the comparison
        # Each scroll is gentle — let user read
        # ============================================
        print("  Scene 7: Scroll through results (7s)...")

        # First slow scroll — show summary bar
        for _ in range(4):
            page.evaluate("window.scrollBy(0, 50)")
            time.sleep(0.4)
        time.sleep(1.5)

        # Second scroll — show offer cards
        for _ in range(5):
            page.evaluate("window.scrollBy(0, 45)")
            time.sleep(0.35)
        time.sleep(1.5)

        # Third scroll — show more results
        for _ in range(4):
            page.evaluate("window.scrollBy(0, 50)")
            time.sleep(0.35)
        time.sleep(1)

        # ============================================
        # SCENE 8: Scroll back to top (28-31 sec)
        # Clean ending — back to the brand
        # ============================================
        print("  Scene 8: Back to top (3s)...")
        page.evaluate("window.scrollTo({top: 0, behavior: 'smooth'})")
        time.sleep(3)

        # ============================================
        # SCENE 9: Hold on final frame (31-33 sec)
        # Logo + headline visible — branded ending
        # ============================================
        print("  Scene 9: Final hold (2s)...")
        time.sleep(2)

        # Done — close everything
        page.close()
        context.close()
        browser.close()

    # Rename the recorded video
    video_files = sorted(
        [f for f in os.listdir(VIDEO_PATH) if f.endswith(".webm")],
        key=lambda f: os.path.getmtime(os.path.join(VIDEO_PATH, f)),
        reverse=True,
    )
    if video_files:
        old_path = os.path.join(VIDEO_PATH, video_files[0])
        new_path = os.path.join(VIDEO_PATH, f"{name}.webm")
        if os.path.exists(new_path):
            os.remove(new_path)
        os.rename(old_path, new_path)
        size_mb = os.path.getsize(new_path) / (1024 * 1024)
        print(f"\n  Saved: {new_path} ({size_mb:.1f} MB)")
    else:
        print("  WARNING: No video file found")


def main():
    print("=" * 50)
    print("PAPIERBOX — YC-STYLE DEMO RECORDER")
    print("With auto-zoom + cursor spotlight")
    print("=" * 50)
    print("\nChoose what to record:")
    print("  1 = Desktop demo (1280x720)")
    print("  2 = Mobile demo (390x844 — iPhone)")
    print("  3 = Both")
    print()

    choice = input("Enter 1, 2, or 3: ").strip()

    if choice in ("1", "3"):
        record_demo(
            search_term="Butter",
            city_value="hamburg",
            city_label="Hamburg",
            name="demo_desktop_butter",
        )

    if choice in ("2", "3"):
        record_mobile_demo(
            search_term="Butter",
            city_value="hamburg",
            city_label="Hamburg",
            name="demo_mobile_butter",
        )
        record_mobile_demo(
            search_term="Kaffee",
            city_value="berlin",
            city_label="Berlin",
            name="demo_mobile_kaffee",
        )

    print(f"\n{'='*50}")
    print("RECORDING COMPLETE!")
    print(f"{'='*50}")
    print(f"\nVideos saved to: {VIDEO_PATH}")
    print("""
NEXT: Edit in CapCut (free — capcut.com)

1. Import the .webm file into CapCut
2. Add text overlays at these timestamps:

   0-3 sec:  "Tired of overpaying for groceries?"
             (white text, black bg, fade in)

   3-6 sec:  "Search any product..."
             (small, bottom of screen)

   6-10 sec: "Pick your city. Hit GO."
             (small, bottom of screen)

   10-14 sec: "Every store's price — cheapest first"
              (white text, appears with results)

   14-18 sec: "Save €50+ every month"
              (big, center, green text)

   18-22 sec: "papierbox.eu"
              (big, center, hold)
              "Free forever. No signup."
              (small, below)

3. Add music: search "upbeat tech" in CapCut library
4. Export as:
   - 1080x1920 (TikTok/Reels)
   - 1920x1080 (YouTube/Website)
""")


if __name__ == "__main__":
    main()
