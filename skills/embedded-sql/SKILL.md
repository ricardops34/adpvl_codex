---
name: embedded-sql
description: SQL para ADVPL e TLPP com BeginSQL/EndSQL no TOTVS Protheus. Use quando Codex precisar escrever, revisar, corrigir ou migrar consultas SQL com %table%, %notDel%, %xfilial%, %exp%, alias de cursor, joins, aggregates, TCQuery ou TCSqlExec.
---

# Embedded SQL

## Overview

Use este skill para escrever e revisar consultas SQL em ADVPL/TLPP com foco em legibilidade, seguranca, filtro correto de filial e exclusao logica.

## Workflow

1. Identificar se a tarefa e `SELECT`, migracao de `TCQuery`, ajuste de performance ou DML.
2. Ler `references/embedded-sql.md`.
3. Para `SELECT`, preferir `BeginSQL ... EndSQL`.
4. Para DML, sinalizar riscos e usar o mecanismo adequado ao ambiente, como `TCSqlExec` quando aplicavel.
5. Validar alias, colunas tipadas, `%notDel%`, `%xfilial%` e fechamento de area.

## Guardrails

- Nao omitir filtro de filial nem exclusao logica.
- Nao usar `SELECT *` em sugestoes novas.
- Nao concatenar SQL manualmente quando `BeginSQL` resolver melhor.
- Nao esquecer `DbCloseArea()` ou gerenciamento equivalente do alias.

## References

- `references/embedded-sql.md`
- `references/source-attribution.md`
