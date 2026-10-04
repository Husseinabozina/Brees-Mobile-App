<div align="center">
  <img src="docs/assets/brees-logo.png" alt="Brees wordmark" width="260" />
  <p><strong>A polished Flutter personal-finance experience built from a complete Figma product flow.</strong></p>
  <p>60 visual states · Clean Architecture · Motion · Automated visual QA · CI</p>

  <p>
    <a href="https://husseinabozina.github.io/Brees-Mobile-App/">
      <img src="https://img.shields.io/badge/OPEN_LIVE_PORTFOLIO-2C14DD?style=for-the-badge&logo=googlechrome&logoColor=white" alt="Open live portfolio" />
    </a>
    <a href="https://husseinabozina.github.io/Brees-Mobile-App/downloads/brees-demo.apk">
      <img src="https://img.shields.io/badge/DOWNLOAD_ANDROID_APK-131313?style=for-the-badge&logo=android&logoColor=white" alt="Download Android APK" />
    </a>
  </p>

  <p>
    <img src="https://img.shields.io/badge/Flutter-Mobile-02569B?logo=flutter&logoColor=white" alt="Flutter" />
    <img src="https://img.shields.io/badge/Dart-Language-0175C2?logo=dart&logoColor=white" alt="Dart" />
    <img src="https://img.shields.io/badge/Clean-Architecture-240F51" alt="Clean Architecture" />
    <img src="https://img.shields.io/badge/Visual_states-60-4C36ED" alt="60 visual states" />
    <a href="https://github.com/Husseinabozina/Brees-Mobile-App/actions/workflows/flutter_ci.yml">
      <img src="https://github.com/Husseinabozina/Brees-Mobile-App/actions/workflows/flutter_ci.yml/badge.svg" alt="Flutter CI" />
    </a>
  </p>
</div>

<a href="https://husseinabozina.github.io/Brees-Mobile-App/">
  <img src="docs/assets/readme-cover.svg" alt="Brees portfolio preview" width="100%" />
</a>

## ✨ Product experience

Brees is a complete Flutter implementation of a personal-finance product journey rather than a collection of isolated screens. The app connects onboarding, authentication, account setup, dashboard states, accounts, transactions, budgets, insights, profile, settings, and support into one navigable experience.

<table>
  <tr>
    <td align="center"><img src="screenshots/onboarding.png" width="220" alt="Brees onboarding"/><br/><sub><strong>Onboarding</strong></sub></td>
    <td align="center"><img src="screenshots/sign_up.png" width="220" alt="Brees sign up"/><br/><sub><strong>Authentication</strong></sub></td>
    <td align="center"><img src="screenshots/home_dashboard.png" width="220" alt="Brees dashboard"/><br/><sub><strong>Finance dashboard</strong></sub></td>
  </tr>
  <tr>
    <td align="center"><img src="screenshots/account_details.png" width="220" alt="Brees account details"/><br/><sub><strong>Account details</strong></sub></td>
    <td align="center"><img src="screenshots/budgets.png" width="220" alt="Brees budgets"/><br/><sub><strong>Budgets</strong></sub></td>
    <td align="center"><img src="screenshots/insights.png" width="220" alt="Brees insights"/><br/><sub><strong>Insights</strong></sub></td>
  </tr>
</table>

> The screenshots above are captured from the running Flutter implementation and refreshed by CI.

## 🚀 What the app covers

| Area | Experience |
| --- | --- |
| Launch & onboarding | Launch animation, three onboarding screens and guided setup |
| Authentication | Sign up, login, password recovery and verification states |
| Finance home | Balance overview, accounts, recent activity, search and loading states |
| Transactions | History, details, sorting, category actions and advanced filtering |
| Budgets | Empty state, onboarding, configuration, preview, success and active budgets |
| Insights | Financial insight feed and multi-screen report story |
| Profile & support | Profile editing, settings, password, notifications and help centre |

## 🧱 Engineering

The project keeps product UI independent from infrastructure choices through clear feature and domain boundaries.

```text
Presentation
   ↓
Controllers
   ↓
Use cases
   ↓
Repository contracts
   ↓
Repository implementations
   ↓
Remote data sources
   ↓
ApiClient / transport
```

```text
lib/src/
├── app/
│   └── dependencies/
├── core/
│   ├── network/
│   ├── theme/
│   └── widgets/
└── features/
    ├── auth/
    ├── finance/
    ├── onboarding/
    └── system_preview/
```

### Motion & interaction

The implementation includes launch motion, onboarding transitions, animated indicators, verification states, password interactions, dashboard transitions, transaction actions, budget state changes, insight-story transitions, and loading animations.

## ✅ Quality

Every pull request runs:

```bash
flutter analyze
flutter test
flutter test tool/visual_qa_test.dart --reporter expanded
flutter build apk --release
```

The visual-QA harness renders all **60 states** at the target design viewport, captures runtime output, compares it against stored Figma references, and uploads diagnostics for regression review.

## 📱 Try Brees

### Live portfolio
**https://husseinabozina.github.io/Brees-Mobile-App/**

### Android APK
**https://husseinabozina.github.io/Brees-Mobile-App/downloads/brees-demo.apk**

The Android demo build is generated from `main` by GitHub Actions and published with the portfolio.

### Run locally

```bash
git clone https://github.com/Husseinabozina/Brees-Mobile-App.git
cd Brees-Mobile-App
flutter pub get
flutter run
```

## 📚 Project docs

- [Figma screen map](docs/FIGMA_SCREEN_MAP.md)
- [Architecture notes](docs/ARCHITECTURE.md)
- [Backend integration guide](docs/BACKEND_INTEGRATION.md)

## Role & delivery

**Figma analysis → UI reconstruction → navigation → interaction → animation → architecture → data mapping → automated testing → visual QA → CI → portfolio delivery**

<details>
<summary><strong>Design credit</strong></summary>

The visual direction is based on the public **Brees Fintech App UI Kit** on Figma Community. The app branding follows the original **Brees** wordmark treatment shown on the Figma launch screen (`3:1820`). This repository is an independent Flutter implementation created for portfolio and code-review purposes.

</details>

<div align="center">
  <sub>Built with Flutter & Dart.</sub>
</div>
