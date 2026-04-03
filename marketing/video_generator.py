r"""
Papierbox Video Generator — Creates animated marketing videos.
Generates CSS-animated HTML pages and records them with Playwright.

Usage:
  cd C:\petroject\Project_1\marketing
  python video_generator.py

Output: marketing/generated_videos/*.webm
"""
import os
import time
from playwright.sync_api import sync_playwright

OUTPUT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "generated_videos")
ANIM_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "animations")
os.makedirs(OUTPUT_DIR, exist_ok=True)
os.makedirs(ANIM_DIR, exist_ok=True)


def create_animation_html(filename, title, slides, duration_per_slide=3, width=1080, height=1920):
    """
    Create an animated HTML file with auto-playing slide transitions.

    slides: list of dicts with keys:
      - bg: background CSS
      - content: HTML content
      - animation: "fade" | "slideUp" | "scaleIn" | "typewriter"
    """
    total_duration = len(slides) * duration_per_slide

    # Build CSS keyframes for each slide
    slide_css = ""
    slide_html = ""

    for i, slide in enumerate(slides):
        start_pct = (i / len(slides)) * 100
        show_pct = start_pct + 2  # fade in takes 2% of total
        end_pct = ((i + 1) / len(slides)) * 100 - 2
        hide_pct = ((i + 1) / len(slides)) * 100

        anim = slide.get("animation", "fade")

        if anim == "fade":
            slide_css += f"""
                @keyframes slide{i} {{
                    0%, {start_pct:.1f}% {{ opacity: 0; transform: scale(0.95); }}
                    {show_pct:.1f}% {{ opacity: 1; transform: scale(1); }}
                    {end_pct:.1f}% {{ opacity: 1; transform: scale(1); }}
                    {hide_pct:.1f}%, 100% {{ opacity: 0; transform: scale(1.05); }}
                }}
            """
        elif anim == "slideUp":
            slide_css += f"""
                @keyframes slide{i} {{
                    0%, {start_pct:.1f}% {{ opacity: 0; transform: translateY(80px); }}
                    {show_pct:.1f}% {{ opacity: 1; transform: translateY(0); }}
                    {end_pct:.1f}% {{ opacity: 1; transform: translateY(0); }}
                    {hide_pct:.1f}%, 100% {{ opacity: 0; transform: translateY(-40px); }}
                }}
            """
        elif anim == "scaleIn":
            slide_css += f"""
                @keyframes slide{i} {{
                    0%, {start_pct:.1f}% {{ opacity: 0; transform: scale(0.3); }}
                    {show_pct:.1f}% {{ opacity: 1; transform: scale(1); }}
                    {end_pct:.1f}% {{ opacity: 1; transform: scale(1); }}
                    {hide_pct:.1f}%, 100% {{ opacity: 0; transform: scale(0.8); }}
                }}
            """
        elif anim == "typewriter":
            slide_css += f"""
                @keyframes slide{i} {{
                    0%, {start_pct:.1f}% {{ opacity: 0; clip-path: inset(0 100% 0 0); }}
                    {show_pct + 3:.1f}% {{ opacity: 1; clip-path: inset(0 0 0 0); }}
                    {end_pct:.1f}% {{ opacity: 1; clip-path: inset(0 0 0 0); }}
                    {hide_pct:.1f}%, 100% {{ opacity: 0; clip-path: inset(0 0 0 0); }}
                }}
            """

        bg = slide.get("bg", "#FAFAFA")
        slide_html += f"""
            <div class="slide" style="
                animation: slide{i} {total_duration}s ease-in-out forwards;
                background: {bg};
            ">
                {slide["content"]}
            </div>
        """

    html = f"""<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800;900&display=swap" rel="stylesheet">
<style>
* {{ margin: 0; padding: 0; box-sizing: border-box; }}
body {{
    width: {width}px; height: {height}px;
    overflow: hidden; position: relative;
    font-family: 'Plus Jakarta Sans', sans-serif;
    background: #FAFAFA;
}}

.slide {{
    position: absolute; top: 0; left: 0;
    width: 100%; height: 100%;
    display: flex; flex-direction: column;
    justify-content: center; align-items: center;
    text-align: center; padding: 100px 80px;
    opacity: 0;
}}

.emoji {{ font-size: 160px; margin-bottom: 50px; }}
.hook {{ font-size: 88px; font-weight: 900; line-height: 1.08; letter-spacing: -2px; color: #1a1c1c; }}
.hook em {{ font-style: normal; color: #22c55e; }}
.hook .red {{ color: #dc2626; }}
.sub {{ font-size: 42px; font-weight: 700; color: rgba(26,28,28,0.4); margin-top: 36px; }}

.card {{
    width: 85%; background: white; border: 6px solid #1a1c1c;
    border-radius: 40px; padding: 44px 52px; margin: 14px 0;
    display: flex; justify-content: space-between; align-items: center;
    box-shadow: 8px 8px 0px rgba(26,28,28,0.15); text-align: left;
}}
.card.best {{
    background: #22c55e; color: white; border-color: #1a1c1c;
}}
.card .name {{ font-size: 44px; font-weight: 800; }}
.card .detail {{ font-size: 30px; opacity: 0.5; margin-top: 6px; }}
.card .price {{ font-size: 64px; font-weight: 900; }}
.card .price.green {{ color: #22c55e; }}

.cta {{
    font-size: 72px; font-weight: 900; color: white;
    background: #22c55e; padding: 36px 90px;
    border: 6px solid #1a1c1c; border-radius: 100px;
    box-shadow: 10px 10px 0px #1a1c1c; margin-top: 50px;
}}
.cta-sub {{ font-size: 38px; color: rgba(26,28,28,0.35); margin-top: 28px; font-weight: 700; }}

.big-num {{ font-size: 220px; font-weight: 900; color: #22c55e; line-height: 1; }}
.big-num.red {{ color: #dc2626; }}

.logo {{ position: absolute; bottom: 50px; left: 50%; transform: translateX(-50%); opacity: 0.2; height: 80px; }}

.pill {{
    display: inline-block; background: #22c55e; color: white;
    font-size: 34px; font-weight: 900; padding: 14px 40px;
    border-radius: 50px; border: 4px solid #1a1c1c; margin-bottom: 36px;
}}
.pill.red {{ background: #dc2626; }}

/* Grain overlay */
body::after {{
    content: '';
    position: fixed; top: 0; left: 0; right: 0; bottom: 0;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.03'/%3E%3C/svg%3E");
    pointer-events: none; z-index: 9999;
}}

{slide_css}
</style>
</head>
<body>
{slide_html}
</body></html>"""

    filepath = os.path.join(ANIM_DIR, filename)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(html)
    return filepath


def record_html_video(html_path, output_name, duration, width=1080, height=1920):
    """Record an HTML animation as video using Playwright."""
    file_url = "file:///" + html_path.replace("\\", "/")

    print(f"  Recording {output_name} ({duration}s)...")

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        context = browser.new_context(
            viewport={"width": width, "height": height},
            record_video_dir=OUTPUT_DIR,
            record_video_size={"width": width, "height": height},
        )
        page = context.new_page()
        page.goto(file_url, wait_until="networkidle")

        # Wait for fonts to load
        time.sleep(2)

        # Wait for the full animation to play
        time.sleep(duration + 1)

        page.close()
        context.close()
        browser.close()

    # Rename output
    video_files = sorted(
        [f for f in os.listdir(OUTPUT_DIR) if f.endswith(".webm")],
        key=lambda f: os.path.getmtime(os.path.join(OUTPUT_DIR, f)),
        reverse=True,
    )
    if video_files:
        old = os.path.join(OUTPUT_DIR, video_files[0])
        new = os.path.join(OUTPUT_DIR, f"{output_name}.webm")
        if os.path.exists(new):
            os.remove(new)
        os.rename(old, new)
        size_mb = os.path.getsize(new) / (1024 * 1024)
        print(f"  Saved: {output_name}.webm ({size_mb:.1f} MB)")
        return new
    return None


# ============================================================
# VIDEO DEFINITIONS
# ============================================================

def video_cat_shopping():
    """Video: Cat Shopping Meme — pre-built animation (22 seconds)"""
    html_path = os.path.join(ANIM_DIR, "cat_video.html")
    if not os.path.exists(html_path):
        print("  ERROR: cat_video.html not found in animations/")
        return
    record_html_video(html_path, "vid_cat_shopping_meme", duration=22)


def video_1_cheapest_store():
    """Video: Which store is cheapest? (20 seconds)"""
    slides = [
        {
            "bg": "#FAFAFA",
            "animation": "scaleIn",
            "content": '<div class="emoji">🏆</div><div class="hook">Which supermarket<br>is <em>cheapest</em><br>in Germany?</div>'
        },
        {
            "bg": "#FAFAFA",
            "animation": "slideUp",
            "content": '<div class="pill red">WRONG ANSWER</div><div class="hook" style="font-size:72px;">"Aldi is <span class="red">always</span><br>the cheapest"</div><div class="sub">That\'s what everyone thinks...</div>'
        },
        {
            "bg": "#FAFAFA",
            "animation": "fade",
            "content": '<div class="pill">THE TRUTH</div><div class="hook" style="font-size:68px;">It <em>changes</em><br>every single week</div><div style="margin-top:50px;"><div class="card"><div><div class="name">🧈 Butter</div><div class="detail">Cheapest at</div></div><div class="price green">Kaufland</div></div><div class="card"><div><div class="name">☕ Coffee</div><div class="detail">Cheapest at</div></div><div class="price green">Penny</div></div><div class="card"><div><div class="name">🍫 Chocolate</div><div class="detail">Cheapest at</div></div><div class="price green">Lidl</div></div></div>'
        },
        {
            "bg": "#FAFAFA",
            "animation": "slideUp",
            "content": '<div class="hook" style="font-size:64px;">Compare all stores<br>in <em>5 seconds</em></div><div class="cta">papierbox.eu</div><div class="cta-sub">Free · No signup · All 5 stores</div>'
        },
    ]
    path = create_animation_html("vid1_cheapest.html", "Cheapest Store", slides, duration_per_slide=5)
    record_html_video(path, "vid1_cheapest_store", duration=20)


def video_2_save_600():
    """Video: Save €600/year (16 seconds)"""
    slides = [
        {
            "bg": "#FAFAFA",
            "animation": "scaleIn",
            "content": '<div class="emoji">💸</div><div class="hook">You\'re wasting<br><span class="red">€600/year</span><br>on groceries</div><div class="sub">Here\'s the math →</div>'
        },
        {
            "bg": "#FAFAFA",
            "animation": "slideUp",
            "content": '<div class="pill red">WITHOUT COMPARING</div><div class="big-num red">€380</div><div class="sub">/month on groceries</div><div style="margin-top:40px; font-size:36px; font-weight:700; opacity:0.4;">Overpaying on 60% of items<br>without even knowing it</div>'
        },
        {
            "bg": "#FAFAFA",
            "animation": "slideUp",
            "content": '<div class="pill">WITH PAPIERBOX</div><div class="big-num" style="color:#22c55e;">€330</div><div class="sub">same food, smarter stores</div><div style="margin-top:40px; font-size:52px; font-weight:900; color:#22c55e;">€50/month saved ✓</div>'
        },
        {
            "bg": "#22c55e",
            "animation": "scaleIn",
            "content": '<div class="hook" style="color:white; font-size:60px;">That\'s<br><span style="color:#1a1c1c;">€600/year</span><br>back in your pocket</div><div class="cta" style="background:white; color:#1a1c1c;">papierbox.eu</div><div class="cta-sub" style="color:rgba(255,255,255,0.6);">Free forever</div>'
        },
    ]
    path = create_animation_html("vid2_save600.html", "Save 600", slides, duration_per_slide=4)
    record_html_video(path, "vid2_save_600_per_year", duration=16)


def video_3_butter_race():
    """Video: Butter Price Race (20 seconds)"""
    slides = [
        {
            "bg": "#FAFAFA",
            "animation": "scaleIn",
            "content": '<div class="emoji">🧈</div><div class="hook">Butter<br><em>Price Race</em></div><div class="sub">Who wins this week? →</div>'
        },
        {
            "bg": "#FAFAFA",
            "animation": "slideUp",
            "content": '<div class="card"><div><div class="name">Aldi</div><div class="detail">Deutsche Markenbutter 250g</div></div><div class="price">€1.89</div></div><div class="card"><div><div class="name">Penny</div><div class="detail">KERRYGOLD Butter 250g</div></div><div class="price">€1.69</div></div><div class="card"><div><div class="name">Lidl</div><div class="detail">Butter 250g</div></div><div class="price">€1.59</div></div><div class="card best"><div><div class="name">🏆 Kaufland</div><div class="detail">WEIHENSTEPHAN Butter 250g</div></div><div class="price" style="color:white;">€1.29</div></div>'
        },
        {
            "bg": "#FAFAFA",
            "animation": "scaleIn",
            "content": '<div class="emoji">🏆</div><div class="hook" style="font-size:64px;"><em>Kaufland</em><br>wins!</div><div style="margin-top:30px; font-size:48px; font-weight:900; color:#dc2626;">You save €0.60<br>per butter</div><div class="sub">That adds up fast...</div>'
        },
        {
            "bg": "#22c55e",
            "animation": "fade",
            "content": '<div class="hook" style="color:white; font-size:56px;">Check every product<br>at <span style="color:#1a1c1c;">every store</span></div><div class="cta" style="background:white; color:#1a1c1c;">papierbox.eu</div><div class="cta-sub" style="color:rgba(255,255,255,0.6);">New prices every week · Free</div>'
        },
    ]
    path = create_animation_html("vid3_butter.html", "Butter Race", slides, duration_per_slide=5)
    record_html_video(path, "vid3_butter_price_race", duration=20)


def video_4_expat_struggles():
    """Video: Expat Grocery Struggles (20 seconds)"""
    slides = [
        {
            "bg": "#FAFAFA",
            "animation": "fade",
            "content": '<div class="emoji">😅</div><div class="hook">POV: You just<br>moved to<br><em>Germany</em></div><div class="sub">and went grocery shopping...</div>'
        },
        {
            "bg": "#FAFAFA",
            "animation": "typewriter",
            "content": '<div style="text-align:left; width:85%;"><div style="font-size:46px; font-weight:800; margin-bottom:30px; line-height:1.6;">😱 Cashier scans at <span style="color:#dc2626;">LIGHT SPEED</span></div><div style="font-size:46px; font-weight:800; margin-bottom:30px; line-height:1.6;">🪙 You need a <span style="color:#22c55e;">COIN</span> for the cart</div><div style="font-size:46px; font-weight:800; margin-bottom:30px; line-height:1.6;">🛍️ No bags. <span style="color:#dc2626;">BRING YOUR OWN.</span></div><div style="font-size:46px; font-weight:800; margin-bottom:30px; line-height:1.6;">🕐 <span style="color:#dc2626;">CLOSED</span> on Sunday. ALL of them.</div><div style="font-size:46px; font-weight:800; line-height:1.6;">🤔 5 stores. <span style="color:#dc2626;">5 DIFFERENT PRICES.</span></div></div>'
        },
        {
            "bg": "#FAFAFA",
            "animation": "scaleIn",
            "content": '<div class="emoji">🤯</div><div class="hook" style="font-size:60px;">The same butter costs<br><span class="red">€0.60 more</span><br>at the wrong store</div><div class="sub">Every. Single. Week.</div>'
        },
        {
            "bg": "#22c55e",
            "animation": "slideUp",
            "content": '<div class="hook" style="color:white; font-size:52px;">One search.<br>All stores.<br><span style="color:#1a1c1c;">Cheapest first.</span></div><div class="cta" style="background:white; color:#1a1c1c;">papierbox.eu</div><div class="cta-sub" style="color:rgba(255,255,255,0.6);">Built by an expat, for expats 🇩🇪</div>'
        },
    ]
    path = create_animation_html("vid4_expat.html", "Expat Struggles", slides, duration_per_slide=5)
    record_html_video(path, "vid4_expat_struggles", duration=20)


def video_5_de_krasseste_rabatte():
    """Video: Krasseste Rabatte — German (16 seconds)"""
    slides = [
        {
            "bg": "#FAFAFA",
            "animation": "scaleIn",
            "content": '<div class="emoji">🤯</div><div class="hook">Die <em>krassesten</em><br>Rabatte<br>diese Woche</div><div class="sub">Bis zu 63% günstiger →</div>'
        },
        {
            "bg": "#FAFAFA",
            "animation": "slideUp",
            "content": '<div class="card best"><div><div class="name">MILKA Schokolade</div><div class="detail">Kaufland · statt €1,99</div></div><div class="price" style="color:white;">-61%</div></div><div class="card best"><div><div class="name">MÜLLER Joghurt</div><div class="detail">Penny · statt €0,89</div></div><div class="price" style="color:white;">-63%</div></div><div class="card best"><div><div class="name">LINDT Goldhase</div><div class="detail">Kaufland · statt €3,29</div></div><div class="price" style="color:white;">-61%</div></div><div class="card best"><div><div class="name">MELITTA Kaffee</div><div class="detail">Penny · statt €10,35</div></div><div class="price" style="color:white;">-42%</div></div>'
        },
        {
            "bg": "#22c55e",
            "animation": "fade",
            "content": '<div class="hook" style="color:white; font-size:56px;">Jeden Montag<br>neue Deals auf</div><div class="cta" style="background:white; color:#1a1c1c;">papierbox.eu</div><div class="cta-sub" style="color:rgba(255,255,255,0.6);">Kostenlos · Kein Login · Sofort</div>'
        },
    ]
    path = create_animation_html("vid5_rabatte.html", "Krasseste Rabatte", slides, duration_per_slide=5)
    record_html_video(path, "vid5_krasseste_rabatte", duration=15)


# ============================================================
# MAIN
# ============================================================

def main():
    print("=" * 50)
    print("PAPIERBOX VIDEO GENERATOR")
    print("Animated videos from HTML + CSS → WebM")
    print("=" * 50)
    print(f"\nOutput: {OUTPUT_DIR}\n")
    print("Generating 5 marketing videos...\n")

    video_cat_shopping()
    video_1_cheapest_store()
    video_2_save_600()
    video_3_butter_race()
    video_4_expat_struggles()
    video_5_de_krasseste_rabatte()

    print(f"\n{'='*50}")
    print("ALL VIDEOS GENERATED!")
    print(f"{'='*50}")
    print(f"\nFiles in: {OUTPUT_DIR}")
    print("""
Next steps:
1. Open videos in CapCut
2. Add trending music from CapCut's library
3. Export as MP4
4. Post on TikTok / Instagram Reels

Or post the .webm files directly — TikTok accepts them!
""")


if __name__ == "__main__":
    main()
