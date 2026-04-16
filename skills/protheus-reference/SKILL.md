---
name: protheus-reference
description: Referencia de funcoes nativas, dicionario SX e integracoes do TOTVS Protheus. Use quando Codex precisar consultar sintaxe de funcao ADVPL, tabelas SX1-SX9/SIX, funcoes FW, parametros e padroes REST, ou quando precisar checar se uma API e restrita para customizacao.
---

# Protheus Reference

## Quando usar

Use este skill para consultas tecnicas sobre funcoes, dicionario e padroes do ecossistema Protheus, priorizando referencia local antes de busca online.

## Quando nao usar

- quando o pedido principal for implementar/refatorar codigo completo
- quando o foco for migracao orientada a classes TLPP

## Fluxo rapido (eficiente)

1. Identificar tipo: `funcao`, `SX`, `REST`, `restricao`.
2. Ler um unico arquivo de referencia por vez.
3. Verificar restricao antes de recomendar API.
4. Se necessario, complementar com TDN oficial.

## Mapa rapido

- `references/native-functions.md` para sintaxe, parametros e exemplos.
- `references/sx-dictionary.md` para tabelas SX e SIX.
- `references/rest-api-reference.md` para padroes REST no Protheus.
- `references/restricted-functions.md` para funcoes/classes que nao devem ser usadas em customizacao.
- `references/source-attribution.md` para a origem do material.
- `https://tdn.totvs.com/display/tec/AdvPL` como fonte oficial de linguagem e recursos ADVPL.
- `https://tdn.totvs.com/display/tec/TLPP` como fonte oficial de linguagem e recursos TLPP.

## Formato de resposta

- sintaxe
- finalidade
- parametros
- retorno
- observacoes de uso/risco

## Guardrails criticos

- Nao recomendar funcao restrita sem avisar explicitamente e sem apontar alternativa.
- Nao presumir comportamento de filial, dicionario ou framework sem conferir a referencia.
- Em resposta de referencia, priorizar objetividade: sintaxe, finalidade, parametros, retorno e observacoes de uso.
