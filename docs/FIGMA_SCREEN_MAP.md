# Figma screen implementation map

Source file: **Brees Fintech App UI Kit**

The app now implements the first **26 visual screens** in canvas order. Screens 2–4 are the three pages inside the Flutter onboarding `PageView`.

## First 6

1. `3:1820` — Launch Screen
2. `3:1853` — Onboarding 4
3. `3:1878` — Onboarding 5
4. `3:1903` — Onboarding 6
5. `3:1932` — Sign Up
6. `3:2001` — Sign Up Success

## Batch 2 — next 20

7. `3:2036` — Get started user guide
8. `3:2093` — Email verification Sent
9. `3:2136` — Gmail Inbox
10. `3:2249` — Open Mail
11. `3:2338` — Chrome / account verified
12. `3:2363` — Login
13. `3:2427` — Forgot Password
14. `3:2471` — Forgot Password / Email Sent
15. `3:2514` — Gmail Inbox reset flow
16. `3:2627` — Open Mail reset flow
17. `3:2716` — Chrome / create new password
18. `3:2757` — Chrome / password created
19. `3:2796` — Get started user guide (post-login)
20. `3:2848` — Setup Account
21. `3:2893` — Setup Mono
22. `3:2922` — Home / Main compact
23. `3:3077` — Home / Main extended / scrollable
24. `3:3210` — Account list
25. `3:3287` — My Account
26. `3:3343` — Sort transactions

## Architecture

The new finance area follows the same Clean Architecture boundary as auth:

- `features/finance/domain/entities`
- `features/finance/domain/repositories`
- `features/finance/domain/usecases`
- `features/finance/data/repositories`
- `features/finance/presentation/controllers`
- `features/finance/presentation/pages`

External-app states (Gmail and Chrome) live under `features/system_preview` so they do not pollute auth/domain logic.

## Motion

The second batch adds:
- staggered guide-card reveal
- envelope scale entrance
- Chrome content slide/fade
- floating rocket motion
- animated password/checkbox interactions
- dashboard transition + scrolling extended state
- transaction-category approve/reject microinteractions

The original full-screen Figma screenshots remain reference targets only. Screen UI is built with Flutter widgets; extracted Figma illustration/logo nodes are local assets under `assets/images/`.
