# iOS TestFlight CI Setup (GitHub Actions)

This repository includes a workflow at `.github/workflows/ios-testflight.yml` that builds the Capacitor iOS app on macOS and uploads it to TestFlight.

## 1) Required GitHub Secrets

Add these secrets in your GitHub repo: **Settings → Secrets and variables → Actions**.

- `APPLE_TEAM_ID`
- `IOS_CERTIFICATE_P12_BASE64`
- `IOS_CERTIFICATE_PASSWORD`
- `IOS_PROVISIONING_PROFILE_BASE64`
- `KEYCHAIN_PASSWORD`
- `APPSTORE_ISSUER_ID`
- `APPSTORE_KEY_ID`
- `APPSTORE_PRIVATE_KEY`

## 2) How to generate secret values

### `IOS_CERTIFICATE_P12_BASE64`
Export your iOS Distribution certificate as `.p12` from Keychain Access, then base64 encode it.

On macOS:

```bash
base64 -i ios_distribution.p12 | pbcopy
```

Paste clipboard into `IOS_CERTIFICATE_P12_BASE64`.

### `IOS_PROVISIONING_PROFILE_BASE64`
Download your App Store provisioning profile (`.mobileprovision`) for bundle id `eu.papierbox.app`, then base64 encode it.

On macOS:

```bash
base64 -i AppStore.mobileprovision | pbcopy
```

Paste clipboard into `IOS_PROVISIONING_PROFILE_BASE64`.

### `APPSTORE_*` secrets
From App Store Connect:

1. Users and Access → Integrations → App Store Connect API
2. Create API key
3. Copy:
   - Key ID → `APPSTORE_KEY_ID`
   - Issuer ID → `APPSTORE_ISSUER_ID`
4. Download `.p8` key file and paste full contents into `APPSTORE_PRIVATE_KEY`.

## 3) Run the workflow

1. Push to `main` with iOS/web changes **or**
2. Run manually: **Actions → iOS TestFlight → Run workflow**

You can pass optional release notes in `release_notes` input.

## 4) Notes

- The workflow performs manual signing in CI.
- It uploads the generated IPA to TestFlight and also stores the IPA as a GitHub artifact for 7 days.
- If signing fails, verify certificate/profile pair belongs to the same team and bundle id.