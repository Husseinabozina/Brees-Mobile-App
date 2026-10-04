# Brees Mobile App

Portfolio-grade Flutter reconstruction of the **Brees Fintech App UI Kit** from Figma.

## First implementation batch

The first six screens from the Figma UI page are implemented:

1. Launch screen — `3:1820`
2. Onboarding 1 — `3:1853`
3. Onboarding 2 — `3:1878`
4. Onboarding 3 — `3:1903`
5. Sign Up — `3:1932`
6. Sign Up Success — `3:2001`

The original Figma node exports are stored only under `references/figma/` for QA. They are **not** used as application screens.

## Architecture

The code is organized by feature with a lightweight Clean Architecture boundary:

- `core/` — theme, fixed reference canvas, reusable UI
- `features/onboarding/presentation/` — launch and onboarding flow
- `features/auth/domain/` — registration entity, repository contract, use case
- `features/auth/data/` — demo repository for the portfolio build
- `features/auth/presentation/` — controller and screens

The UI is functional: onboarding navigation, skip, editable sign-up inputs, password visibility, terms acceptance and a demo registration flow.

## Motion

Motion is intentionally subtle and fintech-appropriate:
- logo scale/fade on launch
- page slide + illustration lift/scale on onboarding
- animated page indicators
- press feedback on primary controls
- staggered sign-up entrance
- elastic success check + content/button reveal

## Run

The repository keeps generated platform runner folders out of source control.

After cloning:

```bash
flutter create . --platforms=android,ios,web,macos
flutter pub get
flutter run
```

## Verification

GitHub Actions runs:

```bash
flutter analyze
flutter test
```

Design target: **375 × 812**.
