---
name: tlpp-protheus
description: Desenvolvimento e migracao de codigo TLPP no TOTVS Protheus. Use quando Codex precisar criar classes TLPP, organizar namespaces, migrar `.prw` para `.tlpp`, montar wrappers de compatibilidade, aplicar `tlpp-core.th` e outros includes `.th`, ou revisar estrutura orientada a objetos em projetos Protheus.
---

# TLPP Protheus

## Overview

Use este skill para criacao, revisao e migracao de codigo TLPP no Protheus, com foco em namespaces, classes, encapsulamento e convivencia segura com codigo ADVPL legado.

## Workflow

1. Identificar se a tarefa e criacao de classe, ajuste de classe existente ou migracao de ADVPL para TLPP.
2. Sempre consultar `doc/referencias-advpl-tlpp.md` na raiz do repositorio alvo antes de propor implementacao.
3. Se `doc/referencias-advpl-tlpp.md` nao existir, criar o arquivo com base minima de referencias e padroes antes de continuar.
4. Ler `references/templates-classes.md` para geracao de classes novas.
5. Ler `references/migration-rules.md` e `references/migration-checklist.md` para migracao.
6. Preservar compatibilidade com chamadores legados quando necessario por meio de wrapper `.prw`.
7. Validar includes `.th`, namespace, uso de `::` e separacao de responsabilidades.
8. Em duvida de sintaxe/comportamento, consultar documentacao oficial TOTVS:
   - `https://tdn.totvs.com/display/tec/TLPP`
   - `https://tdn.totvs.com/display/tec/AdvPL`

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
- Sempre alinhar decisoes tecnicas ao arquivo `doc/referencias-advpl-tlpp.md` do repositorio em uso.

## References

- `references/templates-classes.md`
- `references/migration-rules.md`
- `references/migration-checklist.md`
- `references/source-attribution.md`
- `TDN TLPP (oficial): https://tdn.totvs.com/display/tec/TLPP`
- `TDN AdvPL (oficial): https://tdn.totvs.com/display/tec/AdvPL`
