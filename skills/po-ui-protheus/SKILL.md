---
name: po-ui-protheus
description: Desenvolvimento de aplicacoes Angular com PO-UI integradas ao TOTVS Protheus. Use quando Codex precisar criar, revisar ou evoluir telas PO-UI, shell com `po-menu`, dashboards, tabelas operacionais, fluxo de ajuda, integracao com backend ADVPL, contratos de API para Protheus, publicacao via `FwCallApp` ou uso de MCP/LLMS do PO-UI para acelerar implementacao.
---

# PO-UI Protheus

## Overview

Use este skill para trabalhar em apps PO-UI ligadas ao Protheus, preservando a separacao entre experiencia web no Angular e regra de negocio no backend ADVPL.

## Workflow

1. Identificar se a tarefa e shell, pagina operacional, ajuda, dashboard, servico Angular ou integracao com backend Protheus.
2. Para duvidas sobre API PO-UI, priorizar MCP (`@po-ui/mcp`) quando disponivel; fallback para referencias locais e `llms.txt`.
3. Ler as referencias do projeto `po-boleto` mais proximas da tarefa.
4. Preservar o principio: PO-UI cuida da experiencia; ADVPL cuida da regra critica e do processamento.
5. Validar contratos de API, assets, `public/`, `src/assets/` e build Angular.
6. Quando a app for usada dentro do Protheus, considerar requisitos de `FwCallApp`, `index.html`, `base href` e `appconfig.json`.

## PO-UI IA Tools (MCP + LLMS)

- MCP oficial PO-UI: `@po-ui/mcp`, executado por `npx -y @po-ui/mcp`.
- Ferramentas MCP relevantes:
  - `list_components`: localizar componentes, servicos, interfaces e enums por secao/termo.
  - `get_component_docs`: obter documentacao completa por slug (ex.: `po-table`).
  - `search_docs`: busca textual ampla na documentacao.
  - `get_guide`: recuperar guias (ex.: `getting-started`, `schematics`).
- Quando usar MCP:
  - revisar props/events rapidamente antes de codar.
  - validar nomes de APIs PO-UI para evitar invencoes.
  - comparar opcoes de componente antes de escolher abordagem.
- Quando MCP nao estiver disponivel:
  - usar `https://po-ui.io/llms.txt` como indice.
  - usar `https://po-ui.io/llms-full.txt` ou arquivos individuais para contexto detalhado.
  - opcionalmente usar agregadores como Context7 apenas como apoio, priorizando fonte oficial PO-UI.

## Reference Use

- `references/po-boleto-readme.md` para contexto geral e estrategia de migracao.
- `references/visao-geral.md` para responsabilidades frontend x backend.
- `references/arquitetura-integracao.md` para contratos e endpoints com ADVPL.
- `references/shell-menu-header.md` para shell com `po-menu` e `p-menu-header-template`.
- `references/tela-dashboard.md` para dashboards e indicadores.
- `references/tela-listagem-geracao-boletos.md` para tabela operacional, filtros e geracao.
- `references/tela-ajuda.md` para fluxo de ajuda e imagens.
- `references/angular.json` para convencoes de assets, estilos e build.
- `references/ia-tools-mcp-llms.md` para uso pratico de MCP e llms.txt no dia a dia.

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
- `references/ia-tools-mcp-llms.md`
- `references/source-attribution.md`
