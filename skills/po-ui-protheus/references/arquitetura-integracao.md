# Arquitetura e Integracao

## Principio de desenho

Separar claramente:

- experiencia operacional na PO-UI
- regra e processamento no ADVPL/Protheus

## Fluxo alvo

1. Usuario informa filtros na PO-UI.
2. A aplicacao chama um endpoint de consulta no Protheus.
3. O backend retorna titulos, status, totais e alertas.
4. Usuario seleciona os titulos.
5. A PO-UI envia uma requisicao de geracao.
6. O Protheus processa usando a logica existente.
7. O backend retorna protocolo, status final e referencia de artefatos.

## Backend a preservar

Rotinas que continuam sendo o motor principal:

- `GeraBoleto()`
- `U_Bol_bra()`

## Adaptacoes recomendadas no ADVPL

Criar uma camada de servico sem interacao de tela, por exemplo:

- `ConsultarTitulosBoletoSrv()`
- `GerarBoletosSrv()`

Essa camada deve evitar:

- `Pergunte()`
- `MsgYesNo()`
- `Aviso()`
- dependencias fortes de `Private` para controle de fluxo da API

## Contratos sugeridos

### Base obrigatoria: SX1 `BJ_BOLET`

Os filtros e parametros do backend devem ser baseados na pergunta `BJ_BOLET`, usada na rotina antiga em [Boleto.prw](/g:/Totvs12/Protheus/Protheus/rdmake/Financeiro/Boleto/Boleto.prw#L20).

Mapa inicial do `SX1` para a API:

- `MV_PAR01` -> prefixo inicial
- `MV_PAR02` -> prefixo final
- `MV_PAR03` -> numero inicial
- `MV_PAR04` -> numero final
- `MV_PAR05` -> emissao de
- `MV_PAR06` -> emissao ate
- `MV_PAR07` -> vencimento de
- `MV_PAR08` -> vencimento ate
- `MV_PAR09` -> bordero inicial
- `MV_PAR10` -> bordero final
- `MV_PAR12` -> banco
- `MV_PAR13` -> agencia
- `MV_PAR14` -> conta
- `MV_PAR15` -> subconta
- `MV_PAR17` -> somente sem boleto
- `MV_PAR18` -> somente nao vencidos
- `MV_PAR19` -> mensagem adicional linha 1
- `MV_PAR20` -> mensagem adicional linha 2

Separacao recomendada por endpoint:

- consulta: `MV_PAR01` a `MV_PAR10`, `MV_PAR12` a `MV_PAR18`
- geracao: `MV_PAR12` a `MV_PAR20`

Observacao importante:

- no legado, `MV_PAR12` a `MV_PAR15` servem como configuracao bancaria da emissao e validacao em `SEE`/`SA6`; por isso, apesar de aparecerem na tela atual como filtros, no backend eles precisam respeitar a semantica do `SX1`

### Consulta

Entrada:

- prefixo inicial/final
- numero inicial/final
- emissao de/ate
- vencimento de/ate
- bordero de/ate
- banco, agencia, conta e subconta
- filtros de status

Saida:

- lista de titulos
- totais
- status visual
- warnings de negocio

Implementacao inicial:

- endpoint `GET /bj/financeiro/boletos`
- arquivo: [prw/B301BOLG.prw](C:\Users\ricar\OneDrive\Codex-AntGravify\Clientes\rcg\rcg\po-ui\Financeiro\po-boleto\prw\B301BOLG.prw)
- filtros ja refletidos no endpoint: prefixo, numero, emissao, vencimento, bordero, banco, agencia, conta e flags operacionais
- observacao: `subconta` segue no contrato, mas a validacao cruzada com cadastro bancario sera fechada na etapa do lookup `SA6` e da geracao

Complementos atuais da rotina `Boletos`:

- `GET /bj/financeiro/boletos/bancos` em [prw/B301BOLG.prw](C:\Users\ricar\OneDrive\Codex-AntGravify\Clientes\rcg\rcg\po-ui\Financeiro\po-boleto\prw\B301BOLG.prw)
- `GET /bj/financeiro/boletos/configuracao` em [prw/B301BOLG.prw](C:\Users\ricar\OneDrive\Codex-AntGravify\Clientes\rcg\rcg\po-ui\Financeiro\po-boleto\prw\B301BOLG.prw)

Configuracao adicional via SX6:

- `MV_BJBOLMX` define o `maxTitulosSelecao` devolvido pelo endpoint de configuracao
- leitura atual feita por `SuperGetMV("MV_BJBOLMX", .F., 20)`
- tipo esperado no SX6: `N`
- valor padrao operacional sugerido: `20`

### Geracao

Entrada:

- ids ou chaves dos titulos
- modo de saida: `preview`, `pdf`, `email`
- mensagens adicionais do boleto

Saida:

- quantidade processada
- erros por titulo
- warnings
- protocolo
- referencia do PDF ou lote

Implementacao atual:

- endpoint `POST /bj/financeiro/boletos/geracao`
- arquivo: [prw/B301BOLG.prw](C:\Users\ricar\OneDrive\Codex-AntGravify\Clientes\rcg\rcg\po-ui\Financeiro\po-boleto\prw\B301BOLG.prw)

## Riscos tecnicos

- forte acoplamento atual com `MV_PARxx`
- prompts interativos dentro da regra
- contrato posicional do array `_aBoletos`
- efeitos colaterais em `SE1`
- renderizacao via `FWMSPrinter`, que precisa ser encapsulada para uso em API

## Estrategia de migracao

### Fase 1

PO-UI com mocks e contrato pronto.

### Fase 2

Consulta real de titulos no Protheus.

### Fase 3

Geracao real desacoplada de tela.

### Fase 4

Tratamento de anexos, protocolo, preview e acompanhamento operacional.
