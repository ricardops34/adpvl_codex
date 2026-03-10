# Exemplo Fim a Fim: Protheus REST + PO-UI

Este exemplo demonstra uma arquitetura simples para integrar um backend Protheus com um frontend Angular usando PO-UI.

## Estrutura

```text
examples/protheus-rest-po-ui/
├── backend/
│   ├── advpl/
│   │   └── clientes_rest.prw
│   └── tlpp/
│       └── clientes_service.tlpp
├── contract/
│   └── clientes.json
└── frontend/
    └── po-ui/
        ├── clientes-api.service.ts
        ├── clientes-list.component.ts
        └── clientes-form.component.ts
```

## Cenario

O exemplo expõe uma API de `clientes` com:

- listagem paginada
- consulta por id
- cadastro
- atualizacao

O frontend usa:

- `po-table` para listagem
- `po-dynamic-form` para formulario

## Contrato

O contrato JSON base esta em `contract/clientes.json`.

## Observacoes

- O exemplo e didatico. Ajuste autenticacao, serializacao, URL base e regras de negocio conforme o projeto real.
- Os nomes de campos podem precisar ser adaptados para o dicionario SX do seu ambiente.
