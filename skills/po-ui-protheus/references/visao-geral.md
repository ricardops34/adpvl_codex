# Visao Geral

## Contexto

Os programas legados que conduzem hoje a operacao de boletos sao:

- `Financeiro/Boleto/Boleto.prw`
- `Financeiro/Boleto/Bol_bradesco.prw`

O objetivo da iniciativa e modernizar a experiencia operacional com PO-UI, preservando no Protheus a regra critica de negocio e a geracao efetiva do boleto.

## Responsabilidades atuais

### ADVPL

- selecao e filtragem de titulos
- validacoes bancarias e financeiras
- calculo de juros, multa, desconto e abatimento
- geracao da linha digitavel e do codigo de barras
- atualizacao de campos do titulo em `SE1`
- impressao, preview e envio por e-mail

### PO-UI

Na fase atual a aplicacao web passou a assumir:

- shell de navegacao
- tela de filtros
- tabela com selecao multipla
- resumo operacional
- modal de disparo da geracao
- contrato inicial de servico para futura integracao com o backend Protheus

## Decisao principal

Nao migrar a regra inteira para Angular.

Decisao adotada:

- o frontend PO-UI concentra experiencia do usuario
- o backend ADVPL concentra regra de negocio e processamento

## Estado atual

Concluido em 20 de marco de 2026:

- base visual da app PO-UI
- models e service integrado ao backend
- documentacao inicial de integracao
- build Angular validado com sucesso

## Arquivos mais importantes

- [app shell](/g:/Totvs12/Protheus/Protheus/rdmake/po-ui/Financeiro/po-boleto/src/app/app.ts)
- [pagina principal](/g:/Totvs12/Protheus/Protheus/rdmake/po-ui/Financeiro/po-boleto/src/app/pages/boleto-list/boleto-list.page.ts)
- [template da pagina](/g:/Totvs12/Protheus/Protheus/rdmake/po-ui/Financeiro/po-boleto/src/app/pages/boleto-list/boleto-list.page.html)
- [servico de boletos](/g:/Totvs12/Protheus/Protheus/rdmake/po-ui/Financeiro/po-boleto/src/app/services/boleto.service.ts)
- [documentacao principal](/g:/Totvs12/Protheus/Protheus/rdmake/po-ui/Financeiro/po-boleto/README.md)
