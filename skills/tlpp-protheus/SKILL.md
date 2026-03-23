---
name: tlpp-protheus
description: Desenvolvimento e migracao de codigo TLPP no TOTVS Protheus. Use quando Codex precisar criar classes TLPP, organizar namespaces, migrar `.prw` para `.tlpp`, montar wrappers de compatibilidade, aplicar `tlpp-core.th` e outros includes `.th`, ou revisar estrutura orientada a objetos em projetos Protheus.
---

# TLPP Protheus

## Overview

Use este skill para criacao, revisao e migracao de codigo TLPP no Protheus, com foco em namespaces, classes, encapsulamento e convivencia segura com codigo ADVPL legado.

## Workflow

1. Identificar se a tarefa e criacao de classe, ajuste de classe existente ou migracao de ADVPL para TLPP.
2. Ler `references/templates-classes.md` para geracao de classes novas.
3. Ler `references/migration-rules.md` e `references/migration-checklist.md` para migracao.
4. Preservar compatibilidade com chamadores legados quando necessario por meio de wrapper `.prw`.
5. Validar includes `.th`, namespace, uso de `::` e separacao de responsabilidades.

## Priorities

- Preferir `#Include "tlpp-core.th"` e demais `.th` adequados ao contexto.
- Usar namespaces coerentes, em minusculas e sem underscores.
- Manter uma classe por arquivo quando fizer sentido.
- Migrar `Static Function` para metodo privado e `Private/Public` para `data` ou parametros.
- Preservar `GetArea()` e `RestArea()` em trechos com acesso a banco.

## Guardrails

- Nao usar `using namespace tlpp.*` como substituto de `.th` quando a recomendacao for include.
- Nao remover `User Function` legado sem avaliar wrapper de compatibilidade.
- Nao migrar estrutura sem preservar comportamento funcional.

## References

- `references/templates-classes.md`
- `references/migration-rules.md`
- `references/migration-checklist.md`
- `references/source-attribution.md`
