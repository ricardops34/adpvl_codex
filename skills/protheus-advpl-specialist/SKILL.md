---
name: protheus-advpl-specialist
description: Specialist for TOTVS Protheus development with ADVPL and TLPP. Use when working on `.prw`, `.tlpp`, `.prx`, `.ch`, `.th` or Protheus-specific code and tasks such as generating routines, MVC, REST APIs, PO-UI integrations, pontos de entrada, embedded SQL, reviewing customizations, migrating legacy ADVPL to TLPP, debugging AppServer/runtime issues, or looking up Protheus framework and SX dictionary conventions.
---

# Protheus ADVPL Specialist

Use this skill as the entry point for Protheus work. Keep the workflow lean: identify the task type, load only the relevant reference file, then implement or review code using Protheus conventions rather than generic xBase habits.

## Workflow

1. Detect whether the request is primarily code generation, REST and PO-UI integration, migration, debugging, embedded SQL, or reference lookup.
2. Read only the matching file in `references/`.
3. Inspect the current repository before changing code. Prefer existing naming, module prefixes, includes, wrappers, and framework patterns already used by the project.
4. Preserve Protheus runtime safety:
   - prefer `Local`
   - save and restore work areas around DB access
   - validate `RecLock()` and always `MsUnlock()`
   - use `xFilial()` and logical deletion filters
5. Keep backward compatibility unless the user explicitly asks to break it. In migrations, preserve the callable entry point used by existing routines.

## Reference Selection

- For new routines, classes, MVC, REST, SOAP, or pontos de entrada, read `references/code-generation.md`.
- For Protheus REST backend design, contracts, authentication flow, and PO-UI frontend integration, read `references/rest-po-ui.md`.
- For `.prw` to `.tlpp` modernization or wrapper-based refactoring, read `references/migration.md`.
- For compilation errors, NIL/type issues, AppServer problems, lock/contention, or slow routines, read `references/debugging.md`.
- For `BeginSQL`, `EndSQL`, `%table%`, `%notDel%`, `%xfilial%`, `%exp%`, `TCQuery`, or `TCSqlExec`, read `references/embedded-sql.md`.
- For native functions, SX tables, MV parameters, REST framework conventions, or TDN-oriented lookup, read `references/protheus-reference.md`.

## Official Documentation

- TOTVS TDN (REST/TLPP reference): https://tdn.totvs.com/pages/viewpage.action?pageId=553337101

## Project Detection

Treat the repository as Protheus-oriented when you find one or more of these signals:

- source files with `.prw`, `.tlpp`, `.prx`, `.ch`, `.th`
- includes such as `TOTVS.CH`, `TopConn.ch`, `FWMVCDef.ch`, `tlpp-core.th`, `tlpp-rest.th`
- usage of `DbSelectArea`, `DbSeek`, `RecLock`, `MsUnlock`, `FWExecView`, `FWLogMsg`, `BeginSQL`
- aliases or tables such as `SA1`, `SB1`, `SC5`, `SC6`, `SE1`, `SE2`, `SX*`, `SIX`

## Output Rules

- Write code that fits the existing project style first, official Protheus conventions second.
- Prefer concrete implementations over abstract advice when the user is asking for code.
- Keep comments sparse and useful.
- When uncertain about an SX field, index, or MV parameter, say so explicitly and avoid inventing dictionary metadata.

## Native Code Rule

- Prefer native ADVPL/TLPP constructs and established Protheus functions.
- Avoid translation-like abstractions and unknown helper layers.
- Avoid pass-through wrapper helpers when a direct call is clear and safe.
- Keep implementation straightforward, explicit, and easy to audit in Protheus projects.
