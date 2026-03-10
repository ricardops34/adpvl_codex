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

Os payloads seguem um conjunto minimo de campos comuns do `SA1` padrao, refletindo nomes usuais do `SX3` como `A1_COD`, `A1_LOJA`, `A1_NOME`, `A1_NREDUZ`, `A1_TIPO`, `A1_PESSOA`, `A1_CGC`, `A1_INSCR`, `A1_END`, `A1_BAIRRO`, `A1_MUN`, `A1_EST`, `A1_CEP`, `A1_DDD`, `A1_TEL` e `A1_EMAIL`.

O frontend usa:

- `po-table` para listagem
- `po-dynamic-form` para formulario

## Contrato

O contrato JSON base esta em `contract/clientes.json`.

## Observacoes

- O exemplo e didatico. Ajuste autenticacao, serializacao, URL base e regras de negocio conforme o projeto real.
- Os nomes e obrigatoriedades podem variar por versao, configuracao e customizacao. Valide sempre no `SX3` do seu ambiente antes de colocar em producao.
