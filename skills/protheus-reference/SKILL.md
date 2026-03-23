---
name: protheus-reference
description: Referencia de funcoes nativas, dicionario SX e integracoes do TOTVS Protheus. Use quando Codex precisar consultar sintaxe de funcao ADVPL, tabelas SX1-SX9/SIX, funcoes FW, parametros e padroes REST, ou quando precisar checar se uma API e restrita para customizacao.
---

# Protheus Reference

## Overview

Use este skill para consultas tecnicas sobre funcoes, dicionario e padroes do ecossistema Protheus, priorizando referencia local antes de busca online.

## Workflow

1. Identificar se a consulta e sobre funcao, SX, REST ou restricao de uso.
2. Ler somente o arquivo de referencia correspondente.
3. Antes de sugerir uma funcao, verificar se ela aparece como restrita.
4. Se a referencia local nao bastar e a precisao atualizada importar, buscar em fontes oficiais TOTVS.

## Reference Use

- `references/native-functions.md` para sintaxe, parametros e exemplos.
- `references/sx-dictionary.md` para tabelas SX e SIX.
- `references/rest-api-reference.md` para padroes REST no Protheus.
- `references/restricted-functions.md` para funcoes/classes que nao devem ser usadas em customizacao.
- `references/source-attribution.md` para a origem do material.

## Guardrails

- Nao recomendar funcao restrita sem avisar explicitamente e sem apontar alternativa.
- Nao presumir comportamento de filial, dicionario ou framework sem conferir a referencia.
- Em resposta de referencia, priorizar objetividade: sintaxe, finalidade, parametros, retorno e observacoes de uso.
