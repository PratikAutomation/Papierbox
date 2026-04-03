r"""Quick script to generate just the cat shopping meme video.

Usage: cd C:\petroject\Project_1\marketing && python generate_cat_video.py
"""
import os
import time
from playwright.sync_api import sync_playwright

OUTPUT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "generated_videos")
os.makedirs(OUTPUT_DIR, exist_ok=True)

HTML_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "animations", "cat_video.html")
FILE_URL = "file:///" + HTML_PATH.replace("\\", "/")

print("=" * 50)
print("GENERATING: Cat Shopping Meme Video")
print("22 seconds · 1080x1920 · TikTok ready")
print("=" * 50)

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)
    context = browser.new_context(
        viewport={"width": 1080, "height": 1920},
        record_video_dir=OUTPUT_DIR,
        record_video_size={"width": 1080, "height": 1920},
    )
    page = context.new_page()

    print("\nLoading animation...")
    page.goto(FILE_URL, wait_until="networkidle")

    # Wait for fonts
    time.sleep(2)

    # Let the full 22-second animation play
    print("Recording 22 seconds of animation...")
    for sec in range(22):
        time.sleep(1)
        scene = sec // 5.5
        scenes = ["😿 Confused Cat", "😾 Frustrated Cat", "🙀 Discovery!", "😼 Smart Cat Flex"]
        if sec % 5 == 0:
            idx = min(int(sec / 5.5), 3)
            print(f"  {sec}s — Scene {idx+1}: {scenes[idx]}")

    time.sleep(1)

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
    new = os.path.join(OUTPUT_DIR, "cat_shopping_meme.webm")
    if os.path.exists(new):
        os.remove(new)
    os.rename(old, new)
    size_mb = os.path.getsize(new) / (1024 * 1024)
    print(f"\nSaved: {new}")
    print(f"Size: {size_mb:.1f} MB")
    print(f"""
DONE! Your cat video is ready.

Next steps:
1. Open in CapCut
2. Add funny sound (search "oh no" or "funny cat")
3. Export → Post on TikTok

Caption:
This cat shops smarter than you 😼🛒
papierbox.eu — compare ALL German supermarket prices in 5 seconds. Free!
#funny #cat #germany #supermarket #aldi #lidl #penny #kaufland #expat #meme #fyp #viral
""")
