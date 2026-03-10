# ADVPL and TLPP Code Generation

Use this reference when generating new Protheus code.

## Core Rules

- Use Protheus includes already adopted by the codebase.
- For ADVPL routines, default to `#Include "TOTVS.CH"` and add `TopConn.ch` only when DB or SQL resources require it.
- Prefer `Local` variables and Hungarian-style prefixes (`c`, `n`, `d`, `l`, `a`, `o`, `b`, `x`).
- Wrap DB work with `GetArea()` and `RestArea()`.
- Add defensive error handling on routines that touch DB, external services, file I/O, or framework entry points.

## Naming

- User Function: module prefix plus business identifier, such as `FATA050`, `MATA030`, `FINA460`.
- Static helper: descriptive PascalCase or camelCase.
- TLPP class: PascalCase with a clear suffix such as `Service`, `Repository`, `Controller`, `Dto`.
- TLPP method: camelCase.

## ADVPL User Function Skeleton

```advpl
#Include "TOTVS.CH"

User Function FATA001(cCodigo)
    Local lOk   := .T.
    Local aArea := GetArea()

    Begin Sequence
        // implement business logic
    Recover Using oError
        lOk := .F.
        Conout("Erro em FATA001: " + oError:Description)
    End Sequence

    RestArea(aArea)
Return lOk
```

## TLPP Class Skeleton

```tlpp
#Include "tlpp-core.th"

namespace custom.faturamento.pedido

class PedidoService
    public method new() as object
    public method process(cPedido as character) as logical
endclass

method new() class PedidoService
return self

method process(cPedido as character) class PedidoService
    local lOk := .T.
return lOk
```

## MVC Guidance

- Keep `MenuDef`, `ModelDef`, and `ViewDef` aligned with the project's existing MVC pattern.
- Reuse existing aliases, SX3 metadata, and browse conventions from the same module whenever possible.
- Avoid inventing field structures without checking current project usage.

## REST Guidance

- Prefer the REST style already used by the project: annotation-based TLPP or legacy `WsRestFul`.
- Validate payloads explicitly.
- Normalize responses and error handling instead of returning raw internal exceptions.

## Ponto de Entrada Guidance

- Keep the signature exactly compatible with the expected framework invocation.
- Preserve or document required side effects on arrays, parameters, and return values.

## Common Mistakes

- Forgetting `RestArea(aArea)` after DB access.
- Using `Private` or `Public` in new code.
- Hardcoding filial instead of `xFilial()`.
- Omitting logical deletion filters when querying tables.
