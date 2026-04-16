---
name: advpl-protheus
description: Assistente para ADVPL, TLPP e TOTVS Protheus. Use quando Codex precisar gerar, revisar, depurar, explicar ou modernizar codigo .prw/.tlpp/.prx/.ch, trabalhar com BeginSQL/TCQuery, consultar funcoes nativas e tabelas SX, analisar problemas de AppServer/locks/performance, ou orientar customizacoes e integracoes no ecossistema Protheus.
---

# ADVPL Protheus

## Quando usar

Use este skill para:

- geracao e ajuste de rotinas ADVPL/TLPP
- debugging de erros de compilacao, runtime, locks e performance
- code review e modernizacao de codigo legado
- consultas de funcoes nativas, dicionario SX e REST APIs
- escrita e revisao de Embedded SQL com `BeginSQL ... EndSQL`

## Quando nao usar

- tarefas focadas apenas em TLPP orientado a classes: prefira `tlpp-protheus`
- consulta pontual de sintaxe/referencia sem alteracao de codigo: prefira `protheus-reference`

## Fluxo rapido (eficiente)

1. Classificar a tarefa: `geracao`, `debug`, `review`, `referencia` ou `sql`.
2. Ler somente os arquivos de `references/` do tipo identificado.
3. Seguir ordem de confianca: `referencia local -> TDN oficial -> inferencia`.
4. Responder no formato padrao da tarefa (ver abaixo), sem texto redundante.

## Formato de saida por tarefa

### Debug

- diagnostico curto (causa provavel)
- correcoes propostas (objetivas)
- riscos de regressao
- checklist de validacao

### Code Review

- findings por severidade (primeiro bugs e risco de dados)
- cada finding com arquivo/trecho e impacto
- lacunas de teste
- resumo curto no final

### Geracao/Refatoracao

- patch proposto
- justificativa tecnica curta
- compatibilidade com legado

### SQL

- query final
- validacoes (`%xfilial%`, `%notDel%`, alias, indice)
- risco/performance

## Mapa de referencias (carregamento minimo)

- debug: `references/common-errors.md`, `references/performance-tips.md`
- review: `references/rules-best-practices.md`, `references/rules-performance.md`, `references/rules-security.md`, `references/rules-modernization.md`
- funcoes/SX/REST: `references/native-functions.md`, `references/sx-dictionary.md`, `references/rest-api-reference.md`
- SQL: `references/embedded-sql.md`
- restricoes: `references/restricted-functions.md`

Se faltar base local, priorizar:
- `https://tdn.totvs.com/display/tec/AdvPL`
- `https://tdn.totvs.com/display/tec/TLPP`

## Guardrails criticos

- Nao sugerir funcoes marcadas como restritas quando houver alternativa suportada.
- Nao ignorar controle de filial nem exclusao logica.
- Nao assumir que codigo legado pode ser "modernizado" sem preservar comportamento.
- Em SQL, sinalizar risco de DML e preferir mecanismos suportados pelo ambiente.

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
- `TDN AdvPL (oficial): https://tdn.totvs.com/display/tec/AdvPL`
- `TDN TLPP (oficial): https://tdn.totvs.com/display/tec/TLPP`
