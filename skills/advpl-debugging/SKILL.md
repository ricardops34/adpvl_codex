---
name: advpl-debugging
description: Diagnostico de erros ADVPL e TLPP no TOTVS Protheus. Use quando Codex precisar investigar erro de compilacao, runtime, NIL, type mismatch, alias invalido, RecLock, deadlock, lentidao, AppServer, stack trace, log, ou comportamento incorreto em rotinas .prw/.tlpp.
---

# ADVPL Debugging

## Overview

Use este skill para investigar falhas em rotinas Protheus com foco em reproducao, causa raiz, pontos de instrumentacao e correcoes seguras.

## Workflow

1. Coletar mensagem de erro, stack, linha, rotina e passos para reproduzir.
2. Diferenciar erro de compilacao, runtime, lock, banco ou performance.
3. Consultar apenas a referencia mais relevante.
4. Propor correcoes que preservem o comportamento funcional esperado.
5. Sugerir validacao apos a correcao.

## Reference Use

- Ler `references/common-errors.md` para erros recorrentes de ADVPL/TLPP.
- Ler `references/performance-tips.md` para gargalos, loops, SQL e indices.
- Ler `references/source-attribution.md` apenas se precisar da origem do material.

## Debug Priorities

- Confirmar `Local`, `Static`, includes e nomes de variaveis.
- Verificar area/alias antes de acessar campos.
- Validar ordem de indice, `DbSeek`, `RecLock` e `MsUnlock`.
- Inspecionar `ValType()` quando houver risco de `NIL` ou tipo incorreto.
- Em problemas lentos, analisar filtro de filial, exclusao logica, SQL e loops.

## Guardrails

- Nao recomendar debug interativo bloqueante em producao como primeira opcao.
- Nao tratar erro so pelo sintoma se a causa raiz ainda estiver indefinida.
- Nao ignorar risco de lock, corrupcao logica ou regressao de negocio.
