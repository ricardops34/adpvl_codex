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
├── config/
│   └── appserver.ini
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

## AppServer

O exemplo inclui um arquivo modelo em `config/appserver.ini` com:

- `MultiProtocolPort` habilitada
- `MultiProtocolPortSecure=1`
- bloco REST basico
- apontamentos para certificado e chave

Use esse arquivo apenas como base e ajuste portas, caminhos, certificados, ambiente e chaves de acordo com o seu AppServer.

## Referencias Recomendadas

- PO-UI Getting Started: https://po-ui.io/guides/getting-started
- PO-UI Angular: https://github.com/po-ui/po-angular
- PO-UI Sample Conference: https://github.com/po-ui/po-sample-conference
- TOTVS `FwCallApp`: https://tdn.totvs.com/display/public/framework/FwCallApp+-+Abrindo+aplicativos+Web+no+Protheus
- Exemplo comunitario de CRUD com PO-UI e Protheus: https://sempreju.com.br/crud-fornecedor-usando-po-uiangular-e-erp-protheus-part-1/

## Notas de Integracao com FwCallApp

Ao embarcar um frontend PO-UI dentro do Protheus via `FwCallApp`, considere estes pontos da documentacao oficial da TOTVS:

- em ambientes atualizados, a configuracao com `App_Environment` em `[General]` passa a ser central para o fluxo
- o pre-carregamento grava o token em `sessionStorage['ERPTOKEN']`
- o `appconfig.json` pode definir `api_baseUrl`, e a `FwCallApp` pode ajustar esse valor dinamicamente
- o frontend deve trabalhar com endpoints relativos quando o fluxo estiver integrado ao pre-carregamento do Protheus

## Observacoes

- O exemplo e didatico. Ajuste autenticacao, serializacao, URL base e regras de negocio conforme o projeto real.
- Os nomes e obrigatoriedades podem variar por versao, configuracao e customizacao. Valide sempre no `SX3` do seu ambiente antes de colocar em producao.

## Creditos

Este exemplo foi construido com apoio de referencias da comunidade Protheus e PO-UI, incluindo materiais e repositorios publicados por [`dan-atilio`](https://github.com/dan-atilio), alem de referencias oficiais do PO-UI e do ecossistema TOTVS.

## Aviso de Marcas

**TOTVS**, **Protheus**, **PO-UI** e nomes relacionados pertencem aos seus respectivos titulares. Este material e apenas educacional e nao representa documentacao oficial da TOTVS.

## Contato

Para contato sobre esta adaptacao:

- Ricardo P. S. Patay
- `ricardops34@hotmail.com`
