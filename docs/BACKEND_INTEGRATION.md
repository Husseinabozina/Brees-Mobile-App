# Backend Integration Guide

The portfolio build ships with an endpoint-style `MockApiClient`, but the rest of the application is intentionally unaware of that choice.

## Current seam

```text
BreesApp
  → BreesDependencies
  → Repository contracts
  → Repository implementations
  → Remote data sources
  → ApiClient
  → MockApiClient
```

The presentation and domain layers depend on abstractions, not on the mock transport.

## Real backend path now implemented

The repository now includes `RealApiClient`, so the transport adapter and app-root switch are executable rather than documentation-only.

The client implements:

```dart
abstract interface class ApiClient {
  Future<Map<String, dynamic>> get(String path);

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic> body = const <String, dynamic>{},
  });
}
```

`RealApiClient` currently handles:

- base URL configuration
- Bearer-token injection through an `AccessTokenProvider`
- JSON encoding/decoding
- request timeouts
- non-2xx API errors
- transport and invalid-JSON failures

Refresh-token orchestration and persistent session storage remain responsibilities of the future authentication/session feature once the real backend contract exists.

### 2. Reuse the existing data layer

The feature data sources already depend on `ApiClient`, so they do not need to change when the transport changes.

Existing examples:

- `AuthRemoteDataSourceImpl`
- `FinanceRemoteDataSourceImpl`

### 3. Select it at the app root

The app now performs this composition through `BreesRuntimeConfig`.

Default mock mode:

```bash
flutter run
```

Real-backend mode:

```bash
flutter run \\
  --dart-define=BREES_API_BASE_URL=https://api.example.com
```

No screen imports `RealApiClient`; the switch happens only in the composition root.

## API contract currently modeled by the mock

### POST /v1/auth/register

Request:

```json
{
  "name": "Louis Real",
  "email": "louis@example.com",
  "password": "portfolio123"
}
```

Response shape:

```json
{
  "data": {
    "id": "demo-user-001",
    "name": "Louis Real",
    "email": "louis@example.com",
    "emailVerified": false
  }
}
```

### GET /v1/finance/snapshot

Response shape:

```json
{
  "data": {
    "availableBalanceLabel": "N20,983",
    "budgetLabel": "N29,880",
    "accounts": [],
    "transactions": []
  }
}
```

The data layer converts transport JSON into models, then maps those models into domain entities before presentation sees them.

## Recommended production extensions

When a real backend is introduced, the same pattern can be extended feature-by-feature:

- authentication session / refresh token
- account connections
- paginated transactions
- transaction categories
- budget CRUD
- insights
- profile/settings

Each new feature should preserve the same dependency direction:

```text
Presentation → Use Case → Repository Contract ← Repository Impl ← Data Source ← ApiClient
```


## What is still backend-specific

The transport seam is complete, but a real server still needs to supply contracts compatible with the modeled endpoints. Once credentials and a real API contract exist, the next production work is feature-by-feature rather than architectural:

1. wire the real login/session endpoint and runtime token provider,
2. confirm the registration and finance response schemas,
3. add refresh-token/session persistence if the backend uses them,
4. extend endpoints for accounts, transactions, budgets, insights, profile, and settings,
5. add integration tests against the staging environment.

The UI/domain architecture does not need to be rewritten for those steps.
