---
name: rest-protheus
description: Desenvolvimento e revisao de APIs REST no TOTVS Protheus. Use quando Codex precisar criar, corrigir, documentar ou revisar servicos REST com WsRestFul, FWRest, anotacoes TLPP, endpoints, verbos HTTP, serializacao JSON, autenticacao, validacao de parametros ou integracao entre Protheus e sistemas externos.
---

# REST Protheus

## Overview

Use este skill para criar e revisar APIs REST no ecossistema Protheus, tanto em padroes mais modernos quanto em abordagens legadas suportadas pelo framework.

## Workflow

1. Identificar se a implementacao usa `FWRest`, `WsRestFul` ou anotacoes TLPP.
2. Ler `references/patterns-rest.md`.
3. Complementar com `references/rest-api-reference.md` quando a tarefa for de consulta.
4. Validar verbo HTTP, payload, autenticacao, retorno e tratamento de erro.
5. Responder com foco em contrato de API e compatibilidade com o ambiente Protheus.

## Priorities

- Separar bem rota, regra de negocio e serializacao.
- Validar parametros de entrada e mensagens de erro.
- Padronizar resposta JSON e status coerentes.
- Evitar acoplamento desnecessario com detalhes internos.

## Guardrails

- Nao sugerir endpoint sem validar contrato de entrada e saida.
- Nao ignorar autenticacao, tratamento de erro ou validacao.
- Nao misturar exemplo moderno e legado sem explicar a diferenca.

## References

- `references/patterns-rest.md`
- `references/rest-api-reference.md`
- `references/source-attribution.md`
