---
name: probat-testing
description: Testes unitarios ProBat para TLPP no TOTVS Protheus. Use quando Codex precisar gerar, revisar ou explicar testes com `@TestFixture`, `@Test`, `@Setup`, `@TearDown`, asserts do namespace `tlpp.probat`, estrutura de testes TLPP ou cobertura de regras de negocio.
---

# ProBat Testing

## Overview

Use este skill para criar e revisar testes automatizados com ProBat em projetos TLPP, inclusive quando o codigo alvo estiver em ADVPL mas a suite de testes precisar ser escrita em TLPP.

## Workflow

1. Confirmar se o alvo e TLPP ou ADVPL testado via TLPP.
2. Ler `references/patterns-unit-tests.md`.
3. Garantir includes, namespace e annotations corretos.
4. Montar testes pequenos, deterministas e com asserts claros.
5. Separar setup, execucao e verificacao para facilitar manutencao.

## Priorities

- Usar `#include "tlpp-probat.th"` quando necessario.
- Aplicar `@TestFixture` e `@Test` corretamente.
- Preferir asserts objetivos e legiveis.
- Cobrir caminho feliz, validacoes e cenarios de erro relevantes.

## Guardrails

- Nao gerar teste ProBat em sintaxe puramente ADVPL.
- Nao misturar muitos cenarios independentes no mesmo teste.
- Nao depender de estado global sem setup/cleanup explicito.

## References

- `references/patterns-unit-tests.md`
- `references/source-attribution.md`
