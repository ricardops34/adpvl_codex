# Embedded SQL

Use this reference when writing or reviewing SQL inside ADVPL or TLPP.

## Default Preference

Prefer `BeginSQL ... EndSQL` over manual `TCQuery` string concatenation for new `SELECT` queries.

## Mandatory Patterns

- Use `%table:ALIAS%` for physical table resolution.
- Use `%xfilial:ALIAS%` for filial filtering.
- Use `%notDel%` for logical deletion filtering.
- Use `%exp:...%` for bound values and expressions.
- Use `GetNextAlias()` and close the alias when finished.

## Base Pattern

```advpl
Local cAlias := GetNextAlias()

BeginSQL Alias cAlias
    SELECT SA1.A1_COD, SA1.A1_NOME
    FROM %table:SA1% SA1
    WHERE SA1.%notDel%
    AND SA1.A1_FILIAL = %xfilial:SA1%
    AND SA1.A1_COD = %exp:cCodCli%
EndSQL
```

## Rules

- Do not use `SELECT *`.
- Convert dates with `DtoS()` when required by the query expression.
- Declare `column` types when typed result fields matter.
- Use explicit `JOIN` syntax.
- Use `TCSqlExec` for `INSERT`, `UPDATE`, and `DELETE`; reserve `BeginSQL` for `SELECT`.

## Common Mistakes

- Missing `%notDel%`.
- Missing filial filter in multi-filial tables.
- Opening aliases without closing them.
- Building dynamic SQL by concatenating user values instead of `%exp:%`.
