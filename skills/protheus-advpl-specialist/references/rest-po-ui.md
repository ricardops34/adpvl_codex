# REST API and PO-UI for Protheus

Use this reference when building a Protheus backend in ADVPL or TLPP that will be consumed by a PO-UI frontend.

## Scope

- REST endpoints in ADVPL or TLPP for Protheus
- integration contracts between Protheus and PO-UI screens
- CRUD, search, pagination, and detail endpoints
- authentication and authorization flow between frontend and backend
- response shaping for PO-UI tables, forms, and notifications

## Repository Example

Use `examples/protheus-rest-po-ui/` in this repository as the default worked example:

- `backend/advpl/clientes_rest.prw` for legacy-style REST in ADVPL
- `backend/tlpp/clientes_service.tlpp` for TLPP-oriented REST
- `contract/clientes.json` for the payload contract
- `frontend/po-ui/` for Angular + PO-UI consumption

## Architecture Guidance

- Keep business rules in Protheus service routines, not in the PO-UI frontend.
- Use the REST layer as the contract boundary.
- Normalize JSON payloads so the frontend does not need Protheus-specific parsing rules.
- Reuse existing Protheus validation and transaction logic whenever possible.

## Backend Guidance

- Prefer the REST style already used by the project: `WsRestFul` in ADVPL or annotation-based TLPP where available.
- Separate concerns into:
  - endpoint/controller
  - service/business rule
  - repository or query layer
- Validate input at the API boundary.
- Return clear HTTP semantics where the framework supports it.
- Standardize error payloads with message, code, and optional details.

## Suggested Endpoint Shapes

- `GET /api/clientes`
  - support filters, page, pageSize, search
- `GET /api/clientes/{id}`
  - return the resource with derived fields already formatted for UI use when appropriate
- `POST /api/clientes`
- `PUT /api/clientes/{id}`
- `DELETE /api/clientes/{id}`

## Response Design for PO-UI

Prefer stable JSON contracts such as:

```json
{
  "items": [],
  "hasNext": false,
  "page": 1,
  "pageSize": 20,
  "total": 0
}
```

For forms:

```json
{
  "id": "000001",
  "nome": "Cliente Exemplo",
  "loja": "01",
  "ativo": true
}
```

For errors:

```json
{
  "error": true,
  "code": "CLIENTE_NAO_ENCONTRADO",
  "message": "Cliente nao encontrado"
}
```

## PO-UI Frontend Guidance

- Use PO-UI components for productivity, not for hiding weak backend contracts.
- Map backend collections to `po-table`.
- Map create and update flows to `po-dynamic-form` or typed Angular forms, depending on project standards.
- Keep API services isolated in Angular service classes.
- Centralize environment URL and token handling.
- Treat Protheus-specific identifiers like filial, codigo, loja, and recno as domain fields with explicit names.

## Integration Checklist

- Confirm CORS, auth headers, and environment base URL.
- Confirm JSON date and decimal formats expected by the frontend.
- Confirm pagination contract before implementing the table screen.
- Confirm whether the backend returns domain errors or generic framework errors.
- Confirm if PO-UI screens need lookup endpoints for combos and autocomplete.

## Common Mistakes

- Returning raw aliases or SX field names directly to the frontend without a stable contract.
- Embedding business rules only in Angular and bypassing Protheus validation.
- Mixing pagination logic between frontend and backend.
- Returning inconsistent error shapes across endpoints.
