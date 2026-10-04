# Brees Architecture

Brees is structured as a feature-first Flutter app with a lightweight Clean Architecture boundary.

## Dependency direction

```text
Presentation
    ↓
Domain (entities + repository contracts + use cases)
    ↑
Data (DTOs + data sources + repository implementations)
    ↑
ApiClient abstraction
    ↑
MockApiClient today / real HTTP client later
```

The domain layer does not know whether data comes from an in-memory mock backend, REST, GraphQL, Supabase, Firebase, or another provider.

## Mock backend seam

The portfolio build uses `MockApiClient`, which behaves like a tiny backend and exposes endpoint-style calls:

- `POST /v1/auth/register`
- `GET /v1/finance/snapshot`

Feature data sources call the `ApiClient` interface, repositories convert transport models into domain entities, and use cases expose the operations consumed by presentation controllers.

## Replacing it with a real backend

A production backend can be introduced without changing screens or domain use cases:

1. Implement `ApiClient` with the preferred networking package.
2. Handle authentication headers, serialization, retries, and server errors in that adapter.
3. Build dependencies with `BreesDependencies.fromApiClient(realClient)`.
4. Keep the existing feature data sources and repositories.

That separation is intentional: the mock backend is not embedded inside UI widgets and demo JSON never leaks into the domain layer.

## Current feature boundaries

- `auth` — registration domain, use case, transport model, data source, repository, presentation controller.
- `finance` — account/transaction domain entities, snapshot use case, transport mapping, data source, repository, presentation controller.
- `onboarding` — screen flow and portfolio navigation.
- `system_preview` — Gmail/browser states used by the original Figma journey.

## Verification

CI runs static analysis, widget/regression tests, and a 60-screen visual QA harness against the stored Figma references.
