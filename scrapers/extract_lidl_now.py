"""Extract ALL text from Lidl Prospekt PDF — dump everything we can find."""
import fitz
import sys

pdf_path = r"C:\petroject\Project_1\Prospect\kaufDA - Lidl - LIDL LOHNT SICH.pdf"
doc = fitz.open(pdf_path)

print(f"Pages: {doc.page_count}")
print(f"Metadata: {doc.metadata}")
print()

total_text = 0
for i in range(doc.page_count):
    page = doc[i]
    text = page.get_text()
    if text.strip():
        total_text += len(text)
        print(f"\n{'='*60}")
        print(f"PAGE {i+1}")
        print(f"{'='*60}")
        print(text[:3000])
        if len(text) > 3000:
            print(f"... ({len(text)} total chars)")

print(f"\n\nTOTAL TEXT EXTRACTED: {total_text} chars across {doc.page_count} pages")

if total_text < 500:
    print("\nPDF is IMAGE-BASED — minimal text. Need Vision API for extraction.")
    print("Let me dump image info instead...")
    for i in range(min(doc.page_count, 3)):
        page = doc[i]
        images = page.get_images()
        print(f"\nPage {i+1}: {len(images)} images")
        links = page.get_links()
        print(f"Page {i+1}: {len(links)} links")
        for link in links[:5]:
            print(f"  → {link}")

doc.close()
