# ADVPL to TLPP Migration

Use this reference when refactoring legacy procedural ADVPL into TLPP.

## Migration Strategy

1. Read the source `.prw` and list public entry points, static helpers, shared variables, includes, aliases, and external calls.
2. Propose a class structure before rewriting.
3. Move procedural internals to a TLPP class.
4. Keep the original `User Function` as a thin compatibility wrapper unless the user explicitly wants full replacement.
5. Validate call signatures and side effects.

## Mapping

| ADVPL | TLPP |
|---|---|
| `User Function X()` | public method on a class, usually with wrapper preserved |
| `Static Function helper()` | private method |
| `Private` shared state | class `data` or constructor state |
| `Public` globals | remove; pass via parameters or class state |
| multiple includes | TLPP `.th` includes matching the feature set |

## Namespace Guidance

- For customer customization, default to `custom.<agrupador>.<servico>`.
- Keep namespaces lowercase and dot-separated.
- Keep classes in PascalCase and methods in camelCase.

## Compatibility Wrapper Pattern

```advpl
#Include "TOTVS.CH"

User Function CalcPed(cPedido)
    Local oService := custom.faturamento.pedido.PedidoService():new()
Return oService:calcTotal(cPedido)
```

## Review Checklist

- Preserve external callable names while callers still depend on them.
- Keep `GetArea()` and `RestArea()` around DB access.
- Replace leaked `Private` state with explicit class state.
- Keep `xFilial()` and logical deletion behavior intact.
- Prefer framework logging over ad hoc console prints in the new TLPP code.

## Common Mistakes

- Removing the old entry point too early.
- Creating one giant TLPP class instead of a focused service.
- Translating syntax without redesigning shared state.
- Forgetting `::` on class property access.
