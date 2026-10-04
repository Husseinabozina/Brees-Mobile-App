# Figma screen implementation map

Source file: **Brees Fintech App UI Kit**

The app now implements **all 60 visual screens/states** currently exposed in the Brees UI page, in canvas order. Screens 2–4 are the three pages inside the Flutter onboarding `PageView`.

## First 6

1. `3:1820` — Launch Screen
2. `3:1853` — Onboarding 4
3. `3:1878` — Onboarding 5
4. `3:1903` — Onboarding 6
5. `3:1932` — Sign Up
6. `3:2001` — Sign Up Success

## Batch 2 — screens 7–26

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

## Batch 3 — screens 27–46

27. `3:3419` — Transactions sorted out
28. `3:3500` — Notification
29. `3:3731` — Home / empty welcome state
30. `3:3792` — Budget / empty state
31. `3:3935` — Transactions
32. `3:4073` — Transaction details
33. `3:4141` — Transaction filters
34. `3:4362` — Home search overlay
35. `3:4532` — Budget intro
36. `3:4685` — Create budget / step 1 initial
37. `3:4757` — Budget cycle / monthly
38. `3:4898` — Budget cycle / weekly
39. `3:5041` — Create budget / step 1 configured
40. `3:5113` — Create budget / step 2 amount
41. `3:5193` — Budget preview / alerts off
42. `3:5291` — Budget preview / alerts on
43. `3:5390` — Budget created success
44. `3:5437` — Budget detail / no transactions
45. `3:5509` — Budget detail / in use
46. `3:5618` — Budget list / populated

## Batch 4 — screens 47–60

47. `3:5770` — Insights intro modal
48. `3:6026` — Insights list
49. `3:6180` — Financial report / expense
50. `3:6230` — Financial report / income
51. `3:6281` — Financial report / budget
52. `3:6333` — Financial report / quote
53. `3:6370` — Profile
54. `3:6442` — Edit profile
55. `3:6485` — Settings
56. `3:6518` — Password settings
57. `3:6553` — Notification settings
58. `3:6575` — Help Center
59. `3:6701` — Help Center topic details
60. `3:6731` — Home loading state

## Interaction and navigation contract

BreesFlow maintains an explicit in-app history stack and uses `PopScope`, so Android system back and visible back controls resolve through the same state history instead of closing the single Flutter route.

Major Brees controls now have actual actions, including onboarding and guide skip, sign-up/login switching, Gmail and Chrome back controls, account add, home notifications/search, finance bottom navigation, transaction filter/detail flow, transaction sorting completion, and the complete budget creation flow.

## Overflow regression gate

The 375×812 Figma viewport is now covered by `test/runtime_regression_test.dart`. The gate renders the newly added states and fails when Flutter reports a `RenderFlex` overflow or another layout exception. It also exercises Android back, the Gmail visible back arrow, repaired primary controls, home notification/search, and budget creation interactions.

For fixed-size Figma cards, implementation favors explicit `Stack`/`Positioned` geometry when a padded `Column` or `Row` would make text metrics exceed the exact card constraints. Scrollable content uses `ListView` or `SingleChildScrollView`.

## Architecture

The finance area follows the same Clean Architecture boundary as auth:

- `features/finance/domain/entities`
- `features/finance/domain/repositories`
- `features/finance/domain/usecases`
- `features/finance/data/repositories`
- `features/finance/presentation/controllers`
- `features/finance/presentation/pages`

External-app states (Gmail and Chrome) live under `features/system_preview` so they do not pollute auth/domain logic.

## Motion

The implementation includes staggered guide-card reveal, envelope entrance, Chrome slide/fade, floating rocket motion, password/checkbox interactions, dashboard transitions, transaction-category approve/reject feedback, search/filter interactions, budget-creation state changes, insight-story transitions, profile/settings interactions, and a timed animated home-loading state.

The original Figma screenshots remain reference targets only. Screen UI is built with Flutter widgets; extracted Figma illustration/logo nodes are local assets under `assets/images/`.
