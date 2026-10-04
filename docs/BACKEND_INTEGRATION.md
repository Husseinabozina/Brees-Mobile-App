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

## Replace the mock backend

### 1. Implement ApiClient

Create a production adapter that implements:

```dart
abstract interface class ApiClient {
  Future<Map<String, dynamic>> get(String path);

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic> body = const <String, dynamic>{},
  });
}
```

That adapter is the correct place for:

- base URL configuration
- bearer-token/auth headers
- JSON encoding/decoding
- request timeouts
- transport exceptions
- refresh-token behavior
- request logging in debug builds

### 2. Reuse the existing data layer

The feature data sources already depend on `ApiClient`, so they do not need to change when the transport changes.

Existing examples:

- `AuthRemoteDataSourceImpl`
- `FinanceRemoteDataSourceImpl`

### 3. Inject the production client at the app root

```dart
final apiClient = RealApiClient(
  baseUrl: 'https://api.example.com',
);

final dependencies = BreesDependencies.fromApiClient(apiClient);

runApp(
  BreesApp(dependencies: dependencies),
);
```

No screen needs to import `RealApiClient`.

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
