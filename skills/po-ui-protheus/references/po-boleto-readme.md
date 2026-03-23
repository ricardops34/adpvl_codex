# Po Boleto

Aplicacao Angular + PO-UI criada para modernizar a operacao de boletos hoje conduzida pelos programas ADVPL:

- `Financeiro/Boleto/Boleto.prw`
- `Financeiro/Boleto/Bol_bradesco.prw`

## Documentacao de acompanhamento

Foi criada uma pasta dedicada para contexto e retomada:

- [doc/README.md](/g:/Totvs12/Protheus/Protheus/rdmake/po-ui/Financeiro/po-boleto/doc/README.md)

## O que esta implementado

- shell base com `po-toolbar` e `po-menu`
- tela principal de geracao de boletos
- filtros alinhados ao fluxo atual do `BolTit()`
- tabela com selecao multipla e legenda visual de status
- resumo operacional
- modal para disparo da geracao
- `BoletoService` integrado ao backend e propagando erros da API para a interface

## Estrategia de migracao

Nesta fase a regra critica continua no Protheus. A PO-UI assume:

- filtro e consulta
- selecao dos titulos
- exibicao de totais e alertas
- escolha do modo de saida
- disparo do processamento

O ADVPL continua responsavel por:

- leitura e validacao de `SE1`, `SA1`, `SA6`, `SEE`
- calculos financeiros
- geracao de codigo de barras e linha digitavel
- atualizacao dos campos do titulo
- renderizacao/impressao via `U_Bol_bra()`

## Contratos sugeridos para o backend Protheus

### Parametro SX6

Para controlar o limite de titulos selecionados na geracao em massa, o backend consulta o parametro SX6:

- `MV_BJBOLMX`
- tipo: `N`
- uso: quantidade maxima de titulos permitida/recomendada na selecao da PO-UI
- valor inicial sugerido: `20`

### Consulta de titulos

`GET /b301bol/bj/financeiro/boletos`

Payload sugerido:

```json
{
  "prefixoInicial": "NF",
  "prefixoFinal": "ZZ",
  "numeroInicial": "000001",
  "numeroFinal": "999999",
  "emissaoDe": "2026-03-01",
  "emissaoAte": "2026-03-20",
  "vencimentoDe": "2026-03-20",
  "vencimentoAte": "2026-07-18",
  "borderoInicial": "",
  "borderoFinal": "",
  "banco": "237",
  "agencia": "",
  "conta": "",
  "subConta": "",
  "somenteSemBoleto": false,
  "somenteNaoVencidos": false,
  "trazerMarcados": true
}
```

### Geracao de boletos

`POST /b301bol/bj/financeiro/boletos/geracao`

Payload sugerido:

```json
{
  "modoSaida": "pdf",
  "mensagem1": "Nao receber apos o vencimento.",
  "mensagem2": "Favor desconsiderar pagamento em duplicidade.",
  "titulos": ["001", "002", "003"]
}
```

## Proximo passo no ADVPL

O ideal e criar uma camada intermediaria sem interacao nativa de tela, algo como:

- `ConsultarTitulosBoletoSrv()`
- `GerarBoletosSrv()`

Essas funcoes podem reaproveitar a logica atual de `GeraBoleto()` e `U_Bol_bra()`, mas retornando:

- erros
- warnings
- totais
- identificadores do PDF/protocolo

## Comandos uteis

Para build local nesta maquina, foi necessario usar o Node com caminho explicito:

```powershell
$env:Path='C:\Program Files\nodejs;' + $env:Path
& 'C:\Program Files\nodejs\npm.cmd' run build
```
