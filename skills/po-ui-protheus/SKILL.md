---
name: po-ui-protheus
description: Desenvolvimento de aplicacoes Angular com PO-UI integradas ao TOTVS Protheus. Use quando Codex precisar criar, revisar ou evoluir telas PO-UI, shell com `po-menu`, dashboards, tabelas operacionais, fluxo de ajuda, integracao com backend ADVPL, contratos de API para Protheus ou publicacao para uso com `FwCallApp`.
---

# PO-UI Protheus

## Overview

Use este skill para trabalhar em apps PO-UI ligadas ao Protheus, preservando a separacao entre experiencia web no Angular e regra de negocio no backend ADVPL.

## Workflow

1. Identificar se a tarefa e shell, pagina operacional, ajuda, dashboard, servico Angular ou integracao com backend Protheus.
2. Ler as referencias do projeto `po-boleto` mais proximas da tarefa.
3. Preservar o principio: PO-UI cuida da experiencia; ADVPL cuida da regra critica e do processamento.
4. Validar contratos de API, assets, `public/`, `src/assets/` e build Angular.
5. Quando a app for usada dentro do Protheus, considerar requisitos de `FwCallApp`, `index.html`, `base href` e `appconfig.json`.

## Reference Use

- `references/po-boleto-readme.md` para contexto geral e estrategia de migracao.
- `references/visao-geral.md` para responsabilidades frontend x backend.
- `references/arquitetura-integracao.md` para contratos e endpoints com ADVPL.
- `references/shell-menu-header.md` para shell com `po-menu` e `p-menu-header-template`.
- `references/tela-dashboard.md` para dashboards e indicadores.
- `references/tela-listagem-geracao-boletos.md` para tabela operacional, filtros e geracao.
- `references/tela-ajuda.md` para fluxo de ajuda e imagens.
- `references/angular.json` para convencoes de assets, estilos e build.

## Priorities

- Manter componentes PO-UI consistentes com o shell existente.
- Evitar mover regra financeira do Protheus para o Angular.
- Propagar erros de API de forma clara para o usuario.
- Preservar compatibilidade com publicacao via app embarcada no Protheus.
- Em contratos de backend, alinhar semantica com SX1/SX6 e servicos ADVPL.

## Guardrails

- Nao substituir o backend ADVPL por logica pesada no frontend.
- Nao quebrar o shell do `po-menu` com customizacao excessiva.
- Nao assumir build web puro sem considerar execucao via `FwCallApp`.
- Nao inventar contratos de API sem alinhar com a documentacao local do projeto.

## References

- `references/po-boleto-readme.md`
- `references/visao-geral.md`
- `references/arquitetura-integracao.md`
- `references/shell-menu-header.md`
- `references/tela-dashboard.md`
- `references/tela-listagem-geracao-boletos.md`
- `references/tela-ajuda.md`
- `references/angular.json`
- `references/source-attribution.md`
