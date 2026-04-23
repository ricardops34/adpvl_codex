# IA Tools MCP + LLMS para PO-UI

## Objetivo

Acelerar tarefas de desenvolvimento Angular + PO-UI com contexto confiavel para IA, reduzindo tentativa e erro em props, eventos, tipos e guias.

## Ordem de Preferencia de Fonte

1. MCP oficial do PO-UI (`@po-ui/mcp`)
2. `llms.txt` oficial do PO-UI
3. `llms-full.txt` oficial do PO-UI
4. `llms.txt` do Context7 (apoio complementar)

## MCP Oficial

Configure o cliente MCP para rodar o servidor PO-UI:

```json
{
  "mcpServers": {
    "po-ui": {
      "command": "npx",
      "args": ["-y", "@po-ui/mcp"]
    }
  }
}
```

Ferramentas principais:

- `list_components`: lista componentes, servicos, interfaces e enums.
- `get_component_docs`: retorna documentacao completa por slug.
- `search_docs`: busca textual na documentacao.
- `get_guide`: retorna guias por slug.

## LLMS do PO-UI

- Indice: `https://po-ui.io/llms.txt`
- Conteudo completo: `https://po-ui.io/llms-full.txt`

Uso recomendado:

- `llms.txt` para descobrir rapidamente caminhos e topicos.
- `llms-full.txt` para contexto denso em tarefas de implementacao/refatoracao.

## Context7 (apoio)

Fonte complementar:

- `https://context7.com/po-ui/po-angular/llms.txt?tokens=10000`

Use para bootstrap rapido de contexto quando MCP nao estiver disponivel. Em caso de divergencia, priorize PO-UI oficial e a documentacao local do projeto.

## Aplicacao no Protheus

- Use IA tools para acelerar decisao de frontend (componente correto, props, eventos, servicos).
- Mantenha regra de negocio critica no backend ADVPL/TLPP.
- Valide contratos de API com referencias locais antes de implementar consumo no Angular.
