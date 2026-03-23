---
name: advpl-code-review
description: Revisao de codigo ADVPL e TLPP para TOTVS Protheus. Use quando Codex precisar analisar bugs, riscos, regressao comportamental, performance, seguranca, compatibilidade com framework TOTVS, modernizacao segura ou qualidade geral de rotinas .prw/.tlpp.
---

# ADVPL Code Review

## Overview

Use este skill para revisao tecnica de codigo ADVPL/TLPP com foco prioritario em defeitos reais, riscos de negocio e manutencao segura.

## Workflow

1. Ler o codigo e identificar objetivo funcional da rotina.
2. Procurar primeiro bugs, regressao potencial, risco de dados, lock e problemas de framework.
3. Consultar referencias de boas praticas, performance, seguranca e modernizacao conforme necessario.
4. Produzir findings objetivos com explicacao tecnica e impacto.
5. Separar claramente risco real de melhoria opcional.

## Reference Use

- `references/rules-best-practices.md`
- `references/rules-performance.md`
- `references/rules-security.md`
- `references/rules-modernization.md`
- `references/source-attribution.md`

## Review Priorities

- Uso incorreto de alias, area, indice, lock e persistencia.
- Validacoes ausentes, risco de `NIL`, tipos errados e acessos fora de faixa.
- Filtro de filial e exclusao logica ausentes.
- SQL inseguro, concatenado ou ineficiente.
- Dependencia de funcao restrita ou API interna.
- Modernizacao que possa mudar comportamento sem controle.

## Guardrails

- Priorizar findings antes de elogios ou resumo.
- Nao tratar estilo como severidade alta sem impacto real.
- Nao sugerir reescrita ampla quando uma correcao localizada resolver.
