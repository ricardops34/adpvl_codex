---
name: mvc-protheus
description: Desenvolvimento e revisao de rotinas MVC no TOTVS Protheus. Use quando Codex precisar criar, explicar, corrigir ou revisar estruturas com MenuDef, ModelDef, ViewDef, FWFormModel, FWFormView, FWMVCRotAuto, FWExecView, browse MVC ou pontos de entrada relacionados ao framework.
---

# MVC Protheus

## Overview

Use este skill para trabalhar com MVC no Protheus, incluindo criacao de telas, modelo de dados, browse, execucao automatizada e integracao com o framework TOTVS.

## Workflow

1. Identificar se a tarefa envolve `MenuDef`, `ModelDef`, `ViewDef`, `FWExecView`, browse, automacao ou ponto de entrada.
2. Ler `references/patterns-mvc.md` como base principal.
3. Se houver ponto de entrada ou gancho especifico do framework, consultar `references/patterns-pontos-entrada.md`.
4. Manter separacao clara entre regra de negocio no model e composicao visual na view.
5. Validar operacoes, alias, binds, eventos e impacto nas rotinas padrao.

## Reference Use

- `references/patterns-mvc.md` para estrutura MVC completa.
- `references/patterns-pontos-entrada.md` para pontos de entrada mais comuns.
- `references/templates-classes.md` quando a solucao exigir apoio com classes TLPP/ADVPL.
- `references/source-attribution.md` para a origem do material.

## MVC Priorities

- `MenuDef` deve expor operacoes corretas e coerentes com a rotina.
- `ModelDef` concentra validacoes, estrutura e persistencia.
- `ViewDef` organiza componentes sem carregar regra de negocio indevida.
- Em `FWExecView`, conferir parametros, operacao e ligacao com model/view.
- Em automacao, considerar `FWMVCRotAuto` quando fizer sentido.

## Entry Point Guardrail

Para qualquer ponto de entrada especifico, validar a documentacao oficial no TDN antes de assumir `PARAMIXB`, retorno e momento de execucao. Se a documentacao oficial nao estiver disponivel, informar essa incerteza explicitamente.

## Guardrails

- Nao misturar logica de negocio pesada na view.
- Nao assumir estrutura MVC web tradicional; seguir o padrao do framework TOTVS.
- Nao gerar ponto de entrada com assinatura incerta sem avisar o risco.
