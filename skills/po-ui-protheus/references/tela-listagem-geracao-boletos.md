# Tela de Listagem e Geração de Boletos

## Objetivo

Esta documentação descreve a tela principal do front-end de boletos em `po-ui/Financeiro/po-boleto`, detalhando:

- estrutura visual;
- comportamento funcional;
- integrações com backend;
- regras de filtragem, seleção e geração;
- contratos usados no front;
- cuidados para reconstrução futura.

A ideia é permitir refazer a tela com segurança a partir deste documento, mesmo sem consultar toda a implementação original.

---

## Arquivos principais da tela

### Componente da página

- `src/app/pages/boleto-list/boleto-list.page.ts`
- `src/app/pages/boleto-list/boleto-list.page.html`
- `src/app/pages/boleto-list/boleto-list.page.css`

### Serviços usados pela página

- `src/app/services/boleto.service.ts`
- `src/app/services/banco-lookup.service.ts`

### Modelos e constantes usados

- `src/app/models/boleto-filtro.model.ts`
- `src/app/models/boleto-geracao.model.ts`
- `src/app/models/boleto-titulo.model.ts`
- `src/app/models/banco-lookup.model.ts`
- `src/app/shared/constants/boleto-status.constants.ts`

### Configuração importante do app

- `src/app/app.config.ts`

Observação importante: o projeto usa `BrowserAnimationsModule` via `importProvidersFrom(...)`. Isso é relevante porque o PO-UI depende disso para o funcionamento correto de componentes como `po-page-slide`, utilizado internamente no gerenciador de colunas da `po-table`.

---

## Finalidade da tela

A tela serve para:

1. consultar títulos elegíveis ao processo de boleto;
2. permitir refinamento por filtros avançados;
3. permitir filtro local rápido por texto;
4. permitir filtro local por status a partir da legenda;
5. selecionar títulos individuais ou em massa;
6. iniciar o processamento de geração de boletos;
7. orientar o usuário quando a quantidade selecionada for acima do recomendado.

---

## Estrutura visual da tela

A tela é composta por cinco blocos principais.

### 1. Cabeçalho com título e legenda

Exibe o título:

- `Títulos encontrados:`

Na mesma linha, aparece uma legenda clicável com os status:

- Sem boleto
- Com boleto
- Carteira
- Vencido
- E-commerce

Cada item da legenda apresenta:

- um badge numérico;
- um rótulo textual;
- estado visual ativo quando o status está filtrando a lista.

Esse bloco agora faz parte de um container superior com comportamento `sticky`, para permanecer visível enquanto a lista rola.

### 2. Barra de ações principais

Lado esquerdo:

- botão `Atualizar`
- botão `Boletos`
- botão `e-Mail`

Lado direito:

- chave `Selecionar todos`
- botão `Busca avançada`
- campo `Pesquisar`

Essa barra também faz parte da área superior `sticky`.

Ícones atuais da barra:

- `Atualizar`: `an an-arrows-clockwise`
- `Boletos`: `an an-printer`
- `e-Mail`: `an an-envelope`

### 3. Faixa de filtros aplicados

Só aparece quando há pelo menos um filtro ativo.

Ela mostra:

- título `Apresentando resultados filtrados por:`
- botão/chip `Remover todos`
- chips individuais para cada filtro aplicado

Os chips podem representar:

- filtros da busca avançada;
- pesquisa rápida;
- filtros por status aplicados a partir da legenda.

### 4. Tabela principal

A listagem é feita com `po-table`.

Características atuais:

- seleção habilitada;
- loading nativo do PO-UI;
- ordenação habilitada;
- gerenciador de colunas habilitado;
- busca nativa da tabela desabilitada;
- batch actions nativas desabilitadas;
- colunas fixas ocultas;
- rolagem vertical interna via `p-height`.

Importante: a página foi ajustada para que a rolagem principal aconteça dentro da lista sempre que possível, preservando o cabeçalho superior visível.

### 5. Modais

A tela possui dois modais:

- modal de `Busca avançada`
- modal de `Processar boletos`

---

## Colunas da tabela

As colunas atuais são:

1. `status`
2. `prefixo`
3. `numero`
4. `parcela`
5. `cliente`
6. `valor`
7. `emissao`
8. `vencimentoReal`
9. `bordero`
10. `observacao`

### Configuração especial da coluna `status`

A coluna `status` usa `type: 'label'` e é mapeada a partir de `BOLETO_STATUS_META`.

Status suportados:

- `sem-boleto`
- `com-boleto`
- `carteira`
- `vencido`
- `e-commerce`

Mapeamento atual:

| Status | Label exibida | Cor da tabela |
|---|---|---|
| `sem-boleto` | Sem boleto | `color-11` |
| `com-boleto` | Com boleto | `color-08` |
| `carteira` | Carteira | `color-01` |
| `vencido` | Vencido | `color-07` |
| `e-commerce` | E-commerce | `color-05` |

Observação: as cores da legenda visual não são obrigatoriamente iguais às cores dos labels da tabela. A legenda usa cores próprias em CSS para reforçar diferenciação visual.

---

## Estados mantidos pela tela

A página mantém os seguintes estados principais.

### Filtros

- `filtro`: filtro efetivamente aplicado na consulta ao backend.
- `filtroEdicao`: filtro temporário usado dentro do modal de busca avançada.

### Dados

- `titulos`: lista completa retornada pela última consulta ao backend.
- `titulosVisiveis`: lista efetivamente exibida, após filtros locais.

### Controle visual e interação

- `carregando`: controla loading da tabela e bloqueios temporários de ações.
- `processando`: controla estado de envio da geração de boletos.
- `pesquisaRapida`: termo digitado no `po-search`.
- `bancoLookupValue`: valor selecionado/formatado no `po-lookup` de banco.
- `selecionarTodos`: estado da chave de seleção em massa.
- `statusSelecionados`: lista de status aplicados via clique na legenda.
- `maxTitulosSelecao`: quantidade maxima carregada da configuracao, baseada no SX6 `MV_BJBOLMX`.
- `tableHeight`: altura calculada dinamicamente para a `po-table`.

### Geração

- `modoSaida`: `preview`, `pdf` ou `email`
- `mensagem1`
- `mensagem2`

---

## Fluxo de carregamento da página

Ao entrar na tela (`ngOnInit`), acontecem duas ações:

1. `carregarConfiguracao()`
2. `pesquisar()`

### `carregarConfiguracao()`

Consulta o endpoint de configuração para obter o limite recomendado de títulos na geração em massa.

Endpoint:

- `GET /b301bol/bj/financeiro/boletos/configuracao`

Parametro relacionado no Protheus:

- `MV_BJBOLMX`
- tipo: `N`
- valor sugerido: `20`

Contrato esperado:

```json
{
  "maxTitulosSelecao": 20
}
```

### `pesquisar()`

Executa a consulta principal de títulos com base em `filtro`.

Ao retornar:

- preenche `titulos`;
- recalcula `titulosVisiveis`;
- reseta `selecionarTodos`;
- exibe toaster de sucesso com a quantidade carregada.

Em erro:

- exibe toaster de erro.

Além disso, a altura útil da tabela é recalculada para manter a rolagem vertical dentro da própria lista.

---

## Regras dos filtros

A tela trabalha com dois tipos de filtro:

1. filtros remotos, enviados ao backend;
2. filtros locais, aplicados no front sobre a lista já carregada.

### 1. Filtros remotos

São os filtros de `BoletoFiltro`, enviados na consulta ao endpoint principal.

Campos disponíveis:

- `prefixoInicial`
- `prefixoFinal`
- `numeroInicial`
- `numeroFinal`
- `emissaoDe`
- `emissaoAte`
- `vencimentoDe`
- `vencimentoAte`
- `borderoInicial`
- `borderoFinal`
- `banco`
- `agencia`
- `conta`
- `subConta`
- `somenteSemBoleto`
- `somenteNaoVencidos`
- `trazerMarcados`

Observação importante: visualmente, o filtro de vencimento da tela deve ser interpretado em conjunto com a coluna `Venc. real`, pois a referência usada para filtragem é `vencimentoReal`.

### 2. Filtros locais

São aplicados sobre `titulos` para montar `titulosVisiveis`.

Filtros locais atuais:

- `pesquisaRapida`
- `statusSelecionados`

Importante: esses filtros locais não fazem nova chamada ao backend.

---

## Regras de valores padrão dos filtros

A tela usa dois métodos:

### `createDefaultFiltro()`

Usado como estado inicial da tela.

Valores principais:

- todos os campos texto vazios;
- `somenteSemBoleto = false`;
- `somenteNaoVencidos = false`;
- `trazerMarcados = true`.

### `createEmptyFiltro()`

Usado para limpar filtros.

Diferença principal:

- `trazerMarcados = false`.

### Significado de `trazerMarcados`

Quando `true`, os itens retornados podem vir já marcados no front ao carregar a lista.

Hoje a tela:

- inicia com `trazerMarcados = true`;
- ao limpar filtros, usa `false`.

Se a tela for refeita, vale confirmar se esse comportamento precisa continuar exatamente assim ou se deve ser uniformizado.

---

## Contrato da consulta principal

### Endpoint

- `GET /b301bol/bj/financeiro/boletos`

### Query params enviados pelo front

| Campo do filtro | Query param |
|---|---|
| `prefixoInicial` | `cPrefixoDe` |
| `prefixoFinal` | `cPrefixoAte` |
| `numeroInicial` | `cNumeroDe` |
| `numeroFinal` | `cNumeroAte` |
| `emissaoDe` | `dEmissaoDe` |
| `emissaoAte` | `dEmissaoAte` |
| `vencimentoDe` | `dVenctoDe` |
| `vencimentoAte` | `dVenctoAte` |
| `borderoInicial` | `cBorderoDe` |
| `borderoFinal` | `cBorderoAte` |
| `banco` | `cBanco` |
| `agencia` | `cAgencia` |
| `conta` | `cConta` |
| `subConta` | `cSubConta` |
| `somenteSemBoleto` | `cSomenteSemBoleto` |
| `somenteNaoVencidos` | `cSomenteNaoVencidos` |

### Defaults enviados quando campos estão vazios

- `cPrefixoAte = 'ZZZ'`
- `cNumeroAte = 'ZZZZZZZZZ'`
- demais campos vão vazios quando não preenchidos
- booleanos vão como `1` ou `0`

### Resposta esperada

```json
{
  "items": [
    {
      "id": "001",
      "prefixo": "NF",
      "numero": "000128",
      "parcela": "01",
      "cliente": "Cliente Exemplo",
      "loja": "01",
      "emissao": "2026-03-01",
      "vencimento": "2026-03-25",
      "vencimentoReal": "2026-03-25",
      "valor": 1840.52,
      "bordero": "",
      "formaPagamento": "B",
      "banco": "237",
      "status": "sem-boleto",
      "observacao": "...",
      "email": "cliente@empresa.com"
    }
  ]
}
```

---

## Busca rápida

A busca rápida usa o componente `po-search`.

### Comportamento

Ao alterar o valor:

- `pesquisaRapida` é atualizada;
- `titulosVisiveis` é recalculada;
- `selecionarTodos` é sincronizado.

### Campos pesquisados localmente

A busca textual considera os campos:

- `prefixo`
- `numero`
- `parcela`
- `cliente`
- `loja`
- `bordero`
- `status`
- `observacao`

### Regra de comparação

A normalização textual:

- remove acentos;
- converte para minúsculas;
- aplica `trim()`.

---

## Legenda de status

A legenda é mais do que decorativa: ela funciona como filtro local por status.

### Regras

- cada item mostra a quantidade de títulos com aquele status;
- a contagem é feita com base em `titulos`, ou seja, na lista carregada mais recente;
- ao clicar em um status, ele é adicionado a `statusSelecionados`;
- o clique não remove filtros já existentes;
- a lista visível é recalculada combinando todos os status selecionados;
- o item clicado ganha destaque visual (`status-legend__item--active`).

### Observação importante

Hoje o clique adiciona status, mas não remove no segundo clique. A remoção é feita pelo chip de filtro na faixa de filtros aplicados.

Se a tela for refeita, esse comportamento deve ser mantido se a intenção for preservar a UX atual.

### Cores atuais da legenda

| Status | Cor da legenda |
|---|---|
| Sem boleto | `#2d9f75` |
| Com boleto | `#d98a1f` |
| Carteira | `#2f7dbd` |
| Vencido | `#c74b3f` |
| E-commerce | `#7a52cc` |

---

## Faixa de filtros aplicados

A faixa só aparece quando `disclaimers.length > 0`.

### O que pode gerar chip

- qualquer campo preenchido de `filtro`, exceto `trazerMarcados`;
- qualquer booleano `true` de `filtro`;
- `pesquisaRapida` quando preenchida;
- cada item de `statusSelecionados`.

### Regras de remoção

#### Remover um chip de pesquisa rápida

- limpa `pesquisaRapida`;
- recalcula lista local;
- não consulta backend.

#### Remover um chip de status

- remove o status de `statusSelecionados`;
- recalcula lista local;
- não consulta backend.

#### Remover um chip de filtro remoto

- reseta apenas o campo correspondente;
- executa nova consulta ao backend.

#### `Remover todos`

- limpa filtros remotos;
- limpa pesquisa rápida;
- limpa filtro por status;
- executa nova consulta ao backend.

---

## Busca avançada

A busca avançada abre um `po-modal` grande (`p-size="lg"`).

### Campos disponíveis

- Prefixo de
- Prefixo até
- Número de
- Número até
- Emissão de
- Emissão até
- Vencimento de
- Vencimento até
- Borderô de
- Borderô até
- Banco (`po-lookup`)
- Agência
- Conta
- Subconta
- Somente sem boleto (`po-switch`)
- Somente não vencidos (`po-switch`)

### Botões do modal

- `Aplicar`
- `Cancelar`
- `Limpar`

### Regras

#### Abrir modal

Ao abrir:

- `filtroEdicao` recebe cópia de `filtro`;
- `bancoLookupValue` é sincronizado a partir dos campos já existentes.

#### Aplicar

Ao clicar em `Aplicar`:

- `filtroEdicao` é copiado para `filtro`;
- modal fecha;
- a listagem é recarregada via backend.

#### Limpar

Ao clicar em `Limpar` dentro do modal:

- `filtroEdicao` vira um filtro vazio;
- `bancoLookupValue` é limpo;
- a limpeza vale só dentro do modal até o usuário aplicar.

---

## Lookup de banco

O campo `Banco` usa `po-lookup` com `BancoLookupService`.

### Finalidade

Selecionar uma combinação bancária da SA6 para preencher:

- banco
- agência
- conta
- subconta

### Endpoint principal

- `GET /b301bol/bj/financeiro/boletos/bancos`

### Modos usados

#### Busca paginada/filtrada

Usado por `getFilteredItems(params)`.

Query params possíveis:

- `filter`
- `page`
- `pageSize`

#### Resolução por valor selecionado

Usado por `getObjectByValue(value)`.

Query param:

- `ids`, com valores separados por vírgula

Exemplo:

- `/b301bol/bj/financeiro/boletos/bancos?ids=237-1234-0012345`

### Contrato do item de lookup

```json
{
  "id": "237-1234-0012345",
  "banco": "237",
  "descricao": "Bradesco",
  "agencia": "1234",
  "conta": "0012345",
  "subConta": "01"
}
```

### Regras de preenchimento

Ao selecionar um banco:

- `bancoLookupValue` recebe o `id` do item;
- `filtroEdicao.banco`, `agencia`, `conta` e `subConta` são preenchidos automaticamente.

Ao limpar o lookup:

- `bancoLookupValue` é limpo;
- `banco`, `agencia` e `conta` são limpos em `filtroEdicao`.

Observação: no comportamento atual, `subConta` não é limpo em `onBancoLookupChange()`. Se a tela for refeita, é recomendável confirmar se isso deve permanecer assim ou se `subConta` também deve ser limpa para consistência.

---

## Seleção de títulos

A tabela trabalha com seleção individual e em massa.

### Seleção individual

Eventos usados:

- `p-selected`
- `p-unselected`

Comportamento:

- ao selecionar, `item.selecionado = true`
- ao desmarcar, `item.selecionado = false`
- depois disso, o estado da chave `Selecionar todos` é recalculado

### Seleção em massa pela tabela

Eventos usados:

- `p-all-selected`
- `p-all-unselected`

Comportamento:

- os itens recebidos no evento são atualizados;
- a chave `Selecionar todos` é sincronizada;
- ao selecionar em massa, a tela dispara o toaster de seleção.

### Seleção em massa pela chave `Selecionar todos`

A chave lateral seleciona apenas os títulos visíveis no momento, não a lista inteira bruta.

#### Ao marcar

- todos os itens de `titulosVisiveis` passam a ficar selecionados;
- a lista é recalculada;
- a chave é sincronizada;
- é exibido toaster.

#### Ao desmarcar

- todos os itens de `titulosVisiveis` são desmarcados;
- a seleção da tabela é limpa com `table?.unselectRows()`;
- a chave é sincronizada.

### Regra da chave `Selecionar todos`

Ela só fica habilitada quando há itens visíveis.

---

## Toasters de seleção em massa

Quando há seleção em massa, a tela mostra apenas uma mensagem por vez:

### Caso dentro do limite recomendado

Mensagem informativa:

- `X título(s) selecionado(s).`

### Caso acima do limite recomendado

Mensagem de aviso:

- `Foram selecionados X títulos. Gerar boletos para essa quantidade de títulos de uma única vez pode comprometer o correto funcionamento do sistema.`

### Duração

- informação: 4 segundos
- aviso: 7 segundos

---

## Regras para habilitação do botão `Boletos`

O botão fica desabilitado quando:

- `selectedCount === 0`; ou
- `carregando === true`

Ou seja, só é possível iniciar o processamento quando há ao menos um título selecionado e a tela não está carregando a consulta.

Observação:

- o rótulo visível do botão foi ajustado para `Boletos`, mas ele continua abrindo o fluxo de processamento e geração.

---

## Modal de geração de boletos

O modal `Processar boletos` abre ao iniciar a geração, desde que as regras permitam.

### Campos do modal

- `Modo de saída` (`preview`, `pdf`, `email`)
- `Mensagem 1`
- `Mensagem 2`

### Resumo exibido

- quantidade de títulos selecionados
- valor total dos títulos selecionados
- mensagem de progresso quando `processando = true`

### Ações do modal

- `Processar`
- `Cancelar`

---

## Regra de proteção para grande volume

Antes de abrir o modal de geração, a tela valida a quantidade selecionada.

### Se nenhum título estiver selecionado

Exibe warning:

- `Nenhum título selecionado.`

### Se a quantidade estiver acima de `maxTitulosSelecao`

Exibe um `PoDialogService.confirm` com:

- título: `Atenção`
- mensagem orientando que a geração em massa pode comprometer o funcionamento correto do sistema
- opções `Sim` e `Não`

### Comportamento esperado

- `Sim`: segue e abre o modal de geração
- `Não`: cancela o fluxo

Observação: houve ajustes para controlar a ordem visual e o botão principal. Se a tela precisar ser refeita, esse ponto deve ser retestado visualmente no PO-UI, pois a ordem exibida depende do comportamento do componente de diálogo.

---

## Processamento da geração

Ao confirmar no modal:

1. a tela monta o payload;
2. ativa `processando = true`;
3. chama o endpoint de geração;
4. em sucesso, fecha o modal e mostra toaster;
5. em erro, mostra toaster de erro.

### Endpoint

- `POST /b301bol/bj/financeiro/boletos/geracao`

### Payload enviado

```json
{
  "titulos": [
    { "recno": "001" },
    { "recno": "002" }
  ],
  "modoSaida": "preview",
  "mensagem1": "...",
  "mensagem2": "..."
}
```

Observação importante: no front, `id` do título é transformado para o formato esperado pelo backend:

- `titulos: payload.titulos.map((id) => ({ recno: id }))`

### Resposta tratada pelo front

O front interpreta:

- `processados`
- `pdf`
- `protocolo`

Mensagem de sucesso atual:

- `Processamento concluído. X título(s) enviados para preview/PDF/e-mail.`

---

## Regras de mensagens automáticas

Valores iniciais atuais:

### `mensagem1`

- `Não receber após o vencimento sem autorização do financeiro.`

### `mensagem2`

- `Em caso de pagamento em duplicidade, favor desconsiderar.`

Se a tela for recriada, essas mensagens devem ser mantidas como default, salvo decisão funcional diferente.

---

## Cálculos e indicadores usados

### `selectedItems`

Lista de títulos marcados.

Critério atual:

- item com `$selected` ou `selecionado`

### `selectedCount`

Quantidade de títulos selecionados.

### `selectedAmount`

Soma do `valor` de todos os títulos selecionados.

### `overdueCount`

Quantidade de títulos com status `vencido`.

Observação: `overdueCount` existe no componente, mas atualmente não aparece no template.

---

## Regras de atualização da lista

A lista é recarregada do backend nas seguintes situações:

- abertura inicial da tela;
- clique em `Atualizar`;
- aplicar busca avançada;
- remover um filtro remoto individual;
- clicar em `Remover todos`.

A lista é recalculada localmente, sem chamar backend, nas seguintes situações:

- alteração da pesquisa rápida;
- clique em status da legenda;
- remoção de chip de pesquisa rápida;
- remoção de chip de status.

Em todos esses cenários, a altura da tabela também pode ser recalculada para se adaptar à presença ou ausência da faixa de filtros e às mudanças de viewport.

---

## Comportamento de rolagem

### Objetivo

Manter o cabeçalho funcional da tela sempre acessível, evitando que título, legenda e ações saiam completamente da área visível durante a navegação pelos registros.

### Estratégia adotada

A implementação atual combina duas abordagens:

- container superior com comportamento `sticky`;
- rolagem vertical interna da `po-table` com `p-height`.

### O que fica fixo no topo

O bloco superior da página contém:

- `Títulos encontrados:`
- legenda de status
- botão `Atualizar`
- botão `Boletos`
- botão `e-Mail`
- chave `Selecionar todos`
- botão `Busca avançada`
- campo `Pesquisar`

Esse conjunto fica em um wrapper específico do topo e continua visível durante a rolagem da lista.

### O que rola

A área que concentra os registros visíveis da consulta rola internamente na `po-table`.

### Cálculo de altura da tabela

A altura da tabela não é fixa por valor estático apenas. Ela é recalculada dinamicamente a partir de:

- altura real do bloco superior `sticky`;
- altura da faixa de filtros aplicados, quando existente;
- altura do viewport;
- folgas de layout para respiro visual.

Isso reduz o risco de:

- tabela muito baixa em telas grandes;
- tabela estourando a área visível em telas menores;
- quebra de layout quando a faixa de filtros aparece ou desaparece.

---

## Gerenciador de colunas

A `po-table` está com o gerenciador de colunas habilitado.

### Dependências e cuidados

Para funcionar corretamente no padrão do PO-UI:

- `BrowserAnimationsModule` deve estar ativo no app;
- evitar containers com `overflow` indevido ou estruturas que recortem o `po-page-slide` interno;
- preferir a tabela diretamente dentro do conteúdo da página, sem wrappers desnecessários.

### Situação atual

A tabela está renderizada diretamente na `po-page-default`, sem `po-widget` envolvendo a listagem, justamente para reduzir interferências no `po-page-slide` do gerenciador.

No estado atual, o gerenciador de colunas está sendo apresentado corretamente.

Fatores que contribuíram para essa estabilização:

- ativação de `BrowserAnimationsModule`;
- remoção de wrapper estrutural que interferia na área da tabela;
- manutenção da tabela diretamente no conteúdo da página;
- controle da rolagem dentro da própria lista, em vez de depender apenas da rolagem da página.

---

## Estilo visual atual

A tela está majoritariamente no padrão do PO-UI, com personalizações leves em `boleto-list.page.css` para:

- alinhamento do cabeçalho;
- comportamento sticky do topo;
- legenda de status;
- chips de filtros aplicados;
- grid do modal de busca avançada;
- organização da barra de ações.

### Responsividade

Há regras de responsividade para:

- quebra do cabeçalho em telas menores;
- redução de gaps da legenda;
- busca avançada em uma coluna no mobile.

---

## Observações importantes para reconstrução

Se a tela precisar ser refeita do zero, estes pontos devem ser preservados.

### Regras funcionais obrigatórias

- carregar a configuração ao abrir a tela;
- carregar todos os registros ao abrir a tela;
- manter filtros remotos separados dos filtros locais;
- busca rápida deve ser local;
- clique na legenda deve adicionar filtro de status sem apagar os demais filtros;
- chips devem representar todos os filtros ativos;
- `Selecionar todos` deve agir apenas sobre os registros visíveis;
- geração acima do limite recomendado deve exigir confirmação do usuário;
- a confirmação deve permitir cancelar sem iniciar o processamento;
- o backend de geração deve receber a lista no formato `{ recno }`.

### Regras de UX importantes

- botão `Busca avançada` sempre habilitado;
- botão `Boletos` só habilitado com seleção;
- botão `e-Mail` mantido como placeholder visual;
- toasters devem fechar sozinhos;
- faixa de filtros só deve aparecer quando existir filtro aplicado;
- contadores da legenda devem acompanhar a lista carregada mais recente;
- usar loading nativo do PO-UI na tabela;
- preservar o topo funcional da tela visível durante a navegação pela lista;
- manter a rolagem principal dos registros dentro da `po-table`.

### Cuidados técnicos

- manter `BrowserAnimationsModule` habilitado;
- retestar o gerenciador de colunas depois de qualquer mudança estrutural de layout;
- retestar o cálculo de `tableHeight` sempre que houver mudança no cabeçalho, filtros ou espaçamentos da página;
- evitar adicionar wrappers com `overflow`, `transform` ou alturas rígidas ao redor da tabela;
- validar se o comportamento de `subConta` ao limpar o lookup deve ser mantido ou corrigido;
- revisar codificação de caracteres caso o ambiente continue salvando acentos incorretamente em alguns arquivos.

---

## Pontos que merecem validação futura

Alguns comportamentos existem hoje, mas convém revisar em homologação:

1. se `trazerMarcados` realmente deve iniciar como `true`;
2. se o clique repetido na legenda deve alternar liga/desliga do status;
3. se limpar o lookup deve também limpar `subConta`;
4. se a ordem visual do diálogo `Atenção` está exatamente como o usuário espera em todos os browsers;
5. se o gerenciador de colunas da `po-table` continua 100% estável após futuras mudanças de layout;
6. se o `top` do bloco `sticky` precisa de ajuste adicional quando existir algum cabeçalho global acima da página.

---

## Resumo executivo

A tela atual é uma página PO-UI de consulta e geração de boletos com:

- consulta inicial automática;
- filtros avançados remotos;
- pesquisa rápida local;
- filtro local por legenda de status;
- cabeçalho superior sticky;
- barra de ações com `Atualizar`, `Boletos` e `e-Mail`;
- rolagem vertical interna da lista;
- seleção individual e em massa sobre itens visíveis;
- alerta e confirmação para geração acima do volume recomendado;
- integração com consulta, configuração, lookup bancário e geração;
- exibição de erro real quando a API falha.

Observação final:

- o botão `e-Mail` ainda não executa envio real e atualmente apenas informa `Em desenvolvimento.`

Com os arquivos listados e as regras acima, é possível reconstruir a tela com alta fidelidade funcional e visual.
