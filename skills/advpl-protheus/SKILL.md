---
name: advpl-protheus
description: Assistente para ADVPL, TLPP e TOTVS Protheus. Use quando Codex precisar gerar, revisar, depurar, explicar ou modernizar codigo .prw/.tlpp/.prx/.ch, trabalhar com BeginSQL/TCQuery, consultar funcoes nativas e tabelas SX, analisar problemas de AppServer/locks/performance, ou orientar customizacoes e integracoes no ecossistema Protheus.
---

# ADVPL Protheus

## Overview

Use este skill para tarefas de desenvolvimento no ecossistema TOTVS Protheus com foco em:

- geracao e ajuste de rotinas ADVPL/TLPP
- debugging de erros de compilacao, runtime, locks e performance
- code review e modernizacao de codigo legado
- consultas de funcoes nativas, dicionario SX e REST APIs
- escrita e revisao de Embedded SQL com `BeginSQL ... EndSQL`

## Workflow

1. Identificar o tipo de tarefa: geracao, debugging, review, explicacao, SQL, documentacao ou referencia.
2. Ler apenas os arquivos de `references/` necessarios para a tarefa atual.
3. Priorizar padroes compativeis com Protheus e evitar sugerir APIs internas ou restritas.
4. Quando mexer com banco, filial ou dicionario, validar filtros de filial, `D_E_L_E_T_`, indices e aliases.
5. Ao responder, explicar o motivo tecnico da recomendacao e apontar riscos de compatibilidade quando houver.

## Task Guide

### Debugging

Para erros de compilacao e runtime:

- consultar `references/common-errors.md`
- consultar `references/performance-tips.md` quando houver lentidao
- sugerir instrumentacao com `Conout`, `FWLogMsg` ou tratamento controlado de erro
- verificar `Local`, alias aberto, `DbSelectArea`, `DbSetOrder`, `DbSeek`, `RecLock` e `MsUnlock`

### Code Review

Para revisao e refatoracao:

- consultar `references/rules-best-practices.md`
- consultar `references/rules-performance.md`
- consultar `references/rules-security.md`
- consultar `references/rules-modernization.md`
- priorizar bugs, regressao comportamental, risco de dados e compatibilidade com o framework TOTVS

### Reference Lookup

Para consulta de funcoes e dicionario:

- usar `references/native-functions.md` para sintaxe e exemplos
- usar `references/sx-dictionary.md` para SX1, SX2, SX3, SX5, SX6, SX7, SX9 e SIX
- usar `references/rest-api-reference.md` para padroes REST

Antes de recomendar qualquer funcao, verificar `references/restricted-functions.md`.

Se a informacao nao estiver na referencia local e a tarefa exigir precisao atualizada, buscar no TDN/TOTVS usando fontes oficiais.

### Embedded SQL

Para SQL em ADVPL/TLPP:

- consultar `references/embedded-sql.md`
- preferir `BeginSQL ... EndSQL` em vez de concatenacao manual com `TCQuery`
- sempre considerar `%table%`, `%xfilial%`, `%notDel%` e `%exp%`
- evitar `SELECT *`
- fechar alias apos uso

## Guardrails

- Nao sugerir funcoes marcadas como restritas quando houver alternativa suportada.
- Nao ignorar controle de filial nem exclusao logica.
- Nao assumir que codigo legado pode ser "modernizado" sem preservar comportamento.
- Em sugestoes de DML SQL, sinalizar risco e preferir os mecanismos suportados pelo ambiente.
- Em revisoes, priorizar primeiro erros reais e riscos concretos antes de estilo.

## References

- `references/common-errors.md`
- `references/performance-tips.md`
- `references/rules-best-practices.md`
- `references/rules-performance.md`
- `references/rules-security.md`
- `references/rules-modernization.md`
- `references/native-functions.md`
- `references/restricted-functions.md`
- `references/sx-dictionary.md`
- `references/rest-api-reference.md`
- `references/embedded-sql.md`
- `references/source-attribution.md`
