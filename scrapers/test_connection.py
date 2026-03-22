import requests
import os
from dotenv import load_dotenv

load_dotenv()

# Test 1: Can we reach Anthropic?
print("Testing Anthropic API connectivity...")
try:
    r = requests.get("https://api.anthropic.com", timeout=10)
    print(f"  Anthropic reachable: HTTP {r.status_code}")
except Exception as e:
    print(f"  Anthropic UNREACHABLE: {e}")

# Test 2: Can we authenticate?
print("\nTesting API key authentication...")
key = os.getenv("ANTHROPIC_API_KEY", "")
print(f"  Key starts with: {key[:20]}...")
try:
    import anthropic
    client = anthropic.Anthropic(api_key=key)
    response = client.messages.create(
        model="claude-haiku-4-5-20251001",
        max_tokens=50,
        messages=[{"role": "user", "content": "Say 'hello' in one word."}]
    )
    print(f"  Claude says: {response.content[0].text}")
    print("  API KEY WORKS!")
except Exception as e:
    print(f"  API ERROR: {e}")

# Test 3: Can we reach Supabase?
print("\nTesting Supabase connectivity...")
url = os.getenv("SUPABASE_URL", "")
try:
    r = requests.get(f"{url}/rest/v1/stores?select=name&limit=1",
                     headers={"apikey": os.getenv("SUPABASE_SERVICE_KEY", "")},
                     timeout=10)
    print(f"  Supabase: HTTP {r.status_code} — {r.text[:100]}")
except Exception as e:
    print(f"  Supabase UNREACHABLE: {e}")
