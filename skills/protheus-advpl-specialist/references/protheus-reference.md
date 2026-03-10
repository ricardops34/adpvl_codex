# Protheus Reference

Use this reference when the task depends on Protheus framework knowledge rather than code transformation alone.

## High-Value Lookup Areas

- Native functions such as `DbSelectArea`, `DbSeek`, `GetMV`, `FWExecView`, `FWLogMsg`, `MsExecAuto`.
- SX dictionary tables such as `SX1`, `SX2`, `SX3`, `SX5`, `SX6`, `SX7`, `SX9`, `SIX`.
- REST implementation styles: legacy `WsRestFul` and newer framework/TLPP patterns.
- MV parameters and `.ini` configuration behavior.

## SX Quick Reference

| Table | Purpose |
|---|---|
| `SX1` | perguntas e parametrizacao de rotinas |
| `SX2` | cadastro de tabelas |
| `SX3` | dicionario de campos |
| `SX5` | tabelas genericas |
| `SX6` | parametros `MV_*` |
| `SX7` | gatilhos |
| `SX9` | relacionamentos |
| `SIX` | indices |

## Lookup Discipline

- Prefer repository-local truth first: existing code, wrappers, field names, indexes, and includes.
- If local context is insufficient, consult official TOTVS documentation or TDN.
- Do not invent SX metadata, REST routes, or MV parameter semantics.

## Search Heuristics

- Function docs: search the exact function name plus `ADVPL` or `TDN`.
- Framework docs: search the exact API class or annotation name.
- Dictionary questions: confirm the alias and module context before answering.
