"""
Generate TikTok/Instagram slide images (1080x1920 PNG) in CRYSTAL CLEAR quality.
Renders each slide at NATIVE 1080x1920 resolution — no upscaling, no blur.
"""
import os

from playwright.sync_api import sync_playwright
from PIL import Image

OUTPUT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "slides")
os.makedirs(OUTPUT_DIR, exist_ok=True)

HTML_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "tiktok_10_posts.html")
FILE_URL = "file:///" + HTML_PATH.replace("\\", "/")

SLIDES = [
    "s1a", "s1b", "s1c", "s1d",
    "s2a", "s2b", "s2c", "s2d",
    "s3a", "s3b", "s3c", "s3d",
    "s4a", "s4b", "s4c", "s4d",
    "s5a", "s5b", "s5c", "s5d",
    "s6a", "s6b", "s6c", "s6d", "s6e",
    "s7a", "s7b", "s7c",
    "s8a", "s8b", "s8c",
    "s9a", "s9b", "s9c", "s9d",
    "s10a", "s10b", "s10c", "s10d",
]

print(f"Generating {len(SLIDES)} slides at NATIVE 1080x1920 (crystal clear)...")
print(f"Output: {OUTPUT_DIR}\n")

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)

    # Use device_scale_factor=2 for retina-quality rendering
    page = browser.new_page(
        viewport={"width": 1080, "height": 1920},
        device_scale_factor=2,
    )

    print("Loading HTML...")
    page.goto(FILE_URL, wait_until="networkidle")
    page.wait_for_timeout(3000)

    # Inject CSS to make slides render at full 1080x1920 natively
    page.evaluate("""
        () => {
            // Hide everything except slides
            document.body.style.background = '#FAFAFA';

            // Make all slides 1080x1920 with proper font scaling
            const style = document.createElement('style');
            style.textContent = `
                .slide {
                    width: 1080px !important;
                    height: 1920px !important;
                    border-radius: 0px !important;
                    padding: 90px 70px !important;
                    font-size: 1em !important;
                }
                .slide .hook { font-size: 92px !important; line-height: 1.08 !important; }
                .slide .hook em { font-style: normal; }
                .slide .sub { font-size: 42px !important; margin-top: 32px !important; }
                .slide .emoji-xl { font-size: 150px !important; margin-bottom: 44px !important; }
                .slide .sn { font-size: 28px !important; padding: 10px 26px !important; top: 32px !important; right: 36px !important; border-radius: 40px !important; }
                .slide .logo-img { height: 80px !important; bottom: 40px !important; }
                .slide .label { font-size: 32px !important; letter-spacing: 6px !important; margin-bottom: 36px !important; }
                .slide .row { border-radius: 36px !important; padding: 32px 42px !important; margin-bottom: 16px !important; border-width: 4px !important; box-shadow: 4px 4px 0px rgba(26,28,28,0.1) !important; }
                .slide .row .l { font-size: 40px !important; }
                .slide .row .l small { font-size: 28px !important; }
                .slide .row .r { font-size: 48px !important; }
                .slide .cta { font-size: 68px !important; padding: 32px 80px !important; border-width: 6px !important; border-radius: 100px !important; box-shadow: 8px 8px 0px #1a1c1c !important; margin-top: 44px !important; }
                .slide .cta-sub { font-size: 34px !important; margin-top: 24px !important; }
                .slide .feat { font-size: 38px !important; margin-bottom: 20px !important; }
                .slide .feat span { margin-right: 14px !important; }
                .slide .pill { font-size: 30px !important; padding: 12px 36px !important; border-radius: 50px !important; margin-bottom: 32px !important; border-width: 4px !important; }
                .slide .num-big { font-size: 200px !important; }
                .slide .list-item { padding: 20px 0 !important; border-bottom-width: 3px !important; }
                .slide .list-item .num { font-size: 56px !important; margin-right: 20px !important; }
                .slide .list-item .txt { font-size: 38px !important; }
                .slide .list-item .txt small { font-size: 28px !important; margin-top: 6px !important; }
                .slide .discount-item { padding: 32px 40px !important; margin-bottom: 16px !important; border-radius: 28px !important; }
                .slide .discount-item .d-name { font-size: 40px !important; }
                .slide .discount-item .d-detail { font-size: 28px !important; }
                .slide .discount-item .d-pct { font-size: 56px !important; }
                .slide .squiggle { text-decoration-thickness: 6px !important; text-underline-offset: 12px !important; }
            `;
            document.head.appendChild(style);
        }
    """)

    page.wait_for_timeout(1000)

    for i, slide_id in enumerate(SLIDES):
        el = page.query_selector(f"#{slide_id}")
        if not el:
            print(f"  [{i+1}/{len(SLIDES)}] {slide_id} — NOT FOUND")
            continue

        el.scroll_into_view_if_needed()
        page.wait_for_timeout(300)

        # Screenshot at native resolution (2x device_scale = 2160x3840 raw)
        raw_path = os.path.join(OUTPUT_DIR, f"papierbox_{slide_id}_raw.png")
        el.screenshot(path=raw_path)

        # Resize to exact 1080x1920 using high-quality LANCZOS
        img = Image.open(raw_path)
        img_resized = img.resize((1080, 1920), Image.LANCZOS)
        final_path = os.path.join(OUTPUT_DIR, f"papierbox_{slide_id}.png")
        img_resized.save(final_path, "PNG", optimize=False)

        # Remove raw file
        os.remove(raw_path)

        size_kb = os.path.getsize(final_path) // 1024
        print(f"  [{i+1}/{len(SLIDES)}] {slide_id} — {size_kb}KB — crystal clear")

    browser.close()

print(f"\nDone! {len(SLIDES)} slides at 1080x1920 saved to:")
print(f"  {OUTPUT_DIR}")
print(f"\nUpload directly to TikTok (Photo mode) or Instagram (Carousel).")
