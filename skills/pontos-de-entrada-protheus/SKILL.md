---
name: pontos-de-entrada-protheus
description: Desenvolvimento e revisao de pontos de entrada no TOTVS Protheus. Use quando Codex precisar criar, corrigir, explicar ou revisar user functions de ponto de entrada, interpretar PARAMIXB, validar retorno esperado, identificar rotina padrao chamadora ou orientar customizacoes sem alterar fonte padrao.
---

# Pontos de Entrada Protheus

## Overview

Use este skill para trabalhar com pontos de entrada do Protheus, com atencao especial a `PARAMIXB`, tipo de retorno, momento de execucao e compatibilidade com a rotina padrao.

## Workflow

1. Identificar o nome exato do ponto de entrada.
2. Ler `references/patterns-pontos-entrada.md`.
3. Validar a documentacao oficial no TDN antes de assumir assinatura, retorno ou semantica.
4. Se o TDN nao estiver disponivel, responder com cautela e explicitar a incerteza.
5. Gerar codigo preservando o fluxo padrao e evitando efeitos colaterais inesperados.

## Guardrails

- Nao assumir `PARAMIXB` sem checagem documental.
- Nao retornar tipo incorreto para o ponto de entrada.
- Nao alterar comportamento padrao sem deixar claro o impacto funcional.
- Nao recomendar customizacao que dependa de fonte padrao alterado.

## References

- `references/patterns-pontos-entrada.md`
- `references/source-attribution.md`
