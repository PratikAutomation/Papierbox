# Papierbox — Social Media Content Workflow

## Quick Reference

### Generate Slide Images (PNG 1080×1920)

```powershell
cd C:\petroject\Project_1\marketing
python generate_slides.py
```

Output: `C:\petroject\Project_1\marketing\slides\` — all PNGs ready for upload.

### Prerequisites (one-time setup)

```powershell
pip install playwright Pillow
python -m playwright install chromium
```

---

## Full Workflow: Creating New Posts

### Step 1: Design the Slides

Edit or create HTML slides in: `C:\petroject\Project_1\marketing\tiktok_10_posts.html`

**Design rules (match papierbox.eu):**
- Background: `#FAFAFA` (off-white)
- Text: `#1a1c1c` (near-black)
- Accent: `#22c55e` (green)
- Borders: 4px solid `#1a1c1c`
- Shadows: `6px 6px 0px 0px #1a1c1c`
- Font: `Plus Jakarta Sans` (weight 700-900)
- Border radius: `24px` on slides, `14px` on cards
- Last slide: green background (`#22c55e`) with white CTA

**Slide HTML structure:**
```html
<div class="slide-wrapper">
  <div class="slide" id="UNIQUE_ID">
    <div class="sn">1/4</div>
    <!-- content here -->
    <img class="logo-img" src="../public/logo.png" alt="">
  </div>
  <button class="dl-btn" onclick="dl('UNIQUE_ID')">⬇ Download</button>
</div>
```

**Green CTA slide (last slide of every post):**
```html
<div class="slide green-bg" id="UNIQUE_ID">
  <div class="sn">4/4</div>
  <div class="hook" style="font-size:20px;">Your headline<br><em>with green text</em></div>
  <div class="cta">papierbox.eu</div>
  <div class="cta-sub">Free · No signup · Works in English</div>
  <img class="logo-img" src="../public/logo.png" alt="">
</div>
```

### Step 2: Add Slide IDs to generate_slides.py

Open `generate_slides.py` and add new IDs to the SLIDES list:

```python
SLIDES = [
    "s1a", "s1b", "s1c", "s1d",
    # ... add new slide IDs here
    "s11a", "s11b", "s11c", "s11d",
]
```

### Step 3: Generate PNGs

```powershell
cd C:\petroject\Project_1\marketing
python generate_slides.py
```

### Step 4: Upload to TikTok

1. Transfer slides from `marketing\slides\` to phone (OneDrive, AirDrop, etc.)
2. Open TikTok → "+" → **Photo** mode
3. Select slides for ONE post (e.g., `papierbox_s1a.png` through `papierbox_s1d.png`)
4. Add trending sound (search: "money", "savings", "hack")
5. Paste caption from HTML file
6. Post

### Step 5: Upload to Instagram

1. Same slides work for Instagram carousel
2. Open Instagram → "+" → **Post** → select multiple images
3. Add caption + hashtags
4. Share to Story for extra reach

---

## Available CSS Classes for Slides

### Text
| Class | What | Display Size | Rendered Size |
|-------|------|-------------|---------------|
| `.hook` | Main headline | 28px | 92px |
| `.hook em` | Green accent text | — | — |
| `.hook .red` | Red accent text | — | — |
| `.sub` | Subtitle | 13px | 42px |
| `.emoji-xl` | Big emoji | 48px | 150px |
| `.label` | Section label (green, uppercase) | 10px | 32px |

### Cards
| Class | What |
|-------|------|
| `.row` | Neo-brutalist card row |
| `.row.hl` | Highlighted row (green bg) |
| `.row .l` | Left text |
| `.row .l small` | Left subtitle |
| `.row .r` | Right value |
| `.row .r.g` | Green right value |
| `.row .r.red` | Red right value |

### Badges
| Class | What |
|-------|------|
| `.pill` | Green badge |
| `.pill.red` | Red badge |
| `.pill.outline` | Black outline badge |

### CTA
| Class | What |
|-------|------|
| `.cta` | Green button with papierbox.eu |
| `.cta-sub` | Subtitle below CTA |
| `.feat` | Feature list item with icon |

### Numbers
| Class | What |
|-------|------|
| `.num-big` | Large number (64px) |
| `.num-big.g` | Green large number |
| `.num-big.r` | Red large number |

### Lists
| Class | What |
|-------|------|
| `.list-item` | List row with number |
| `.list-item .num` | Green number |
| `.list-item .txt` | Text content |
| `.list-item .txt small` | Subtitle |

### Slide Types
| Class | What |
|-------|------|
| `.slide` | Standard white slide |
| `.slide.green-bg` | Green background (for CTA slides) |

---

## Content Files

| File | Purpose |
|------|---------|
| `tiktok_posts.html` | First 3 German posts (v1) |
| `tiktok_posts_v2.html` | 3 English curiosity posts with download buttons |
| `tiktok_10_posts.html` | **Main file — 10 posts (39 slides), neo-brutalist theme** |
| `generate_slides.py` | Converts HTML slides to 1080×1920 PNG images |
| `slides/` | Output folder with all generated PNGs |
| `CONTENT_WORKFLOW.md` | This file |

---

## Posting Schedule

| Day | Post # | Title | Language |
|-----|--------|-------|----------|
| Day 1 | Post 1 | "Cheapest supermarket is NOT what you think" | EN |
| Day 2 | Post 2 | "5 Dinge die Expats zu spät lernen" | DE |
| Day 3 | Post 3 | "I saved €600/year changing ONE habit" | EN |
| Day 4 | Post 4 | "Aldi vs Lidl — Wer gewinnt?" | DE |
| Day 5 | Post 5 | "Dein Einkauf kostet dich €200 zu viel" | DE |
| Day 6 | Post 6 | "POV: German supermarkets as a foreigner" | EN |
| Day 7 | Post 7 | "3 Produkte beim falschen Laden" | DE |
| Day 8 | Post 8 | "The 30-second grocery hack" | EN |
| Day 9 | Post 9 | "Eigenmarken — das Geheimnis" | DE |
| Day 10 | Post 10 | "I asked AI to find cheapest grocery list" | EN |

---

## Hashtag Templates

### English Posts
```
#germany #expat #groceries #supermarket #savemoney #lidl #aldi #penny #kaufland #expatlife #livingingingermany #moneysaving
```

### German Posts
```
#deutschland #supermarkt #einkaufen #sparen #preisvergleich #lebensmittel #lidl #aldi #penny #kaufland #spartipp #angebote
```

### Always Include
```
#fyp #foryou #viral
```
