# Tela Dashboard

## Integracao atual

- endpoint: `GET /b301bol/bj/financeiro/boletos/dashboard`
- service Angular: `src/app/services/dashboard.service.ts`
- parametros de filtro: `cPeriodo` e `cEscopo`
- retorno principal: `indicadores`, `topTitulosEmAberto`, `topDevedores`, `efficiency`

## Objetivo

Esta documentação descreve a tela `Dashboard` do front-end de boletos em `po-ui/Financeiro/po-boleto`, detalhando:

- estrutura visual atual;
- composição dos filtros rápidos;
- organização dos cards e rankings;
- massa local usada no layout;
- comportamentos já preparados para evolução futura;
- cuidados para reconstrução da tela sem depender da implementação original.

O foco desta página, no estado atual, é fechar o layout em padrão PO-UI mesmo sem as APIs definitivas já disponíveis.

---

## Arquivos principais da tela

### Componente da página

- `src/app/pages/dashboard/dashboard.page.ts`
- `src/app/pages/dashboard/dashboard.page.html`
- `src/app/pages/dashboard/dashboard.page.css`

### Dependências de interface usadas na página

- `PoPageModule`
- `PoWidgetModule`
- `PoButtonGroupModule`
- `PoTableModule`
- `PoChartModule`
- `PoHelperModule`
- `PoIconModule`
- `PoButtonModule`

### Dependências de apoio

- `CurrencyPipe`
- `PoNotificationService`
- `DashboardService`

---

## Finalidade da tela

A tela serve para apresentar uma visão executiva da carteira financeira com foco em:

1. leitura rápida de títulos em aberto;
2. leitura rápida de títulos em atraso;
3. visão segmentada por banco e carteira;
4. ranking dos principais títulos em aberto;
5. ranking dos maiores devedores;
6. acompanhamento da evolução da eficiência de recebimento.

No momento, os dados são simulados localmente no componente, permitindo validar layout, ordem visual, textos, filtros e comportamento dos componentes PO-UI antes da integração com Protheus.

---

## Estrutura visual da tela

A página é composta por quatro blocos principais.

### 1. Faixa de filtros rápidos

O topo da página contém um `po-widget` com o título:

- `Filtros rapidos`

Esse bloco organiza os filtros em duas colunas:

- `Vencimento`
- `Carteira`

Cada filtro usa `po-button-group` e possui `po-helper` explicando sua finalidade.

#### Filtro `Vencimento`

Opções atuais:

- `Todos`
- `Vencidos`
- `7 dias`
- `15 dias`
- `30 dias`

Regra atual:

- inicia com `Todos` selecionado por padrão.

Texto do helper:

- `Define o recorte dos indicadores conforme a situação e a faixa de vencimento dos títulos.`

#### Filtro `Carteira`

Opções atuais:

- `Todos`
- `Banco`
- `Carteira`

Regra atual:

- inicia com `Todos` selecionado por padrão.

Texto do helper:

- `Permite visualizar os dados consolidados ou segmentados por banco, carteira e títulos atrasados.`

### 2. Bloco de indicadores

Os indicadores são exibidos em duas linhas, sempre com cards de mesma altura.

#### Primeira linha

Apresenta os cards de atraso:

- `Atraso em banco`
- `Atraso em carteira`

Proporção visual:

- `60% / 40%`

#### Segunda linha

Apresenta os cards de títulos em aberto:

- `Títulos em aberto` de banco
- `Títulos em aberto` de carteira

Proporção visual:

- `40% / 60%`

#### Estrutura visual dos cards

Cada card usa `po-widget` com composição interna customizada, mantendo o padrão visual do PO-UI:

- ícone colorido à esquerda;
- título na mesma linha do ícone;
- `po-helper` no canto superior direito;
- barra curta de destaque colorida;
- valor principal em destaque;
- sem botões de ação no rodapé;
- sem texto auxiliar abaixo do valor.

### 3. Rankings

As listagens aparecem uma abaixo da outra, não em colunas.

Widgets atuais:

- `Top 10 títulos em aberto`
- `10 maiores devedores`

Ambas usam `po-table` com:

- ordenação habilitada;
- busca da tabela desabilitada;
- gerenciador de colunas desabilitado;
- altura fixa com rolagem vertical interna (`p-height="320"`).

### 4. Evolução de eficiência

O bloco final usa `po-widget` com duas áreas:

- resumo textual à esquerda;
- gráfico `po-chart` à direita.

Título do widget:

- `Evolução da eficiência de recebimento`

Conteúdos principais:

- destaque `Títulos em atraso`;
- título interno `Eficiência de recebimento`;
- texto explicativo sobre recuperação de títulos vencidos;
- resumo numérico dinâmico;
- gráfico de linha com os últimos ciclos mensais.

---

## Estados mantidos pela tela

Os estados principais do componente são:

- `selectedPeriod`
- `selectedScope`
- `indicadores`
- `topTitulosEmAberto`
- `topDevedores`
- `efficiencySeries`
- `efficiencySummary`

### Tipos de filtro

#### `DashboardPeriod`

Valores suportados:

- `todos`
- `vencidos`
- `7`
- `15`
- `30`

#### `DashboardScope`

Valores suportados:

- `todos`
- `banco`
- `carteira`

---

## Indicadores exibidos

Os quatro indicadores atuais são montados por `buildIndicators()`.

### Linha de atraso

#### `Atraso em banco`

- exibido em valor monetário;
- origem visual `Banco`;
- ícone de banco;
- helper:
  `Pendências vencidas com processamento bancário.`

#### `Atraso em carteira`

- exibido em valor monetário;
- origem visual `Carteira`;
- ícone de carteira;
- helper:
  `Pendências vencidas tratadas diretamente pela carteira.`

### Linha de aberto

#### `Títulos em aberto` de banco

- exibido em quantidade;
- origem visual `Banco`;
- ícone de banco;
- helper:
  `Base financeira pendente em remessa bancária.`

#### `Títulos em aberto` de carteira

- exibido em quantidade;
- origem visual `Carteira`;
- ícone de carteira;
- helper:
  `Títulos em aberto sob cobrança interna.`

### Regras visuais dos indicadores

- cards têm altura uniforme;
- o título fica na mesma linha do ícone;
- o helper fica no canto superior direito;
- não há badge textual no topo;
- não há botões `Detalhes`, `Abrir`, `Cobrar` ou `Priorizar`;
- a diferenciação visual é feita por cor, ícone e posição.

---

## Regras de filtro e atualização

Ao alterar qualquer filtro:

1. o botão selecionado do grupo é sincronizado;
2. o dashboard é recalculado localmente;
3. os widgets e tabelas são remontados com nova massa derivada;
4. o gráfico e o resumo textual são atualizados.

Tudo isso acontece sem chamada externa, apenas com base nas funções locais:

- `buildIndicators()`
- `buildTopTitles()`
- `buildTopDebtors()`
- `buildEfficiencySeries()`
- `buildEfficiencySummary()`

### Efeito do filtro `Vencimento`

O filtro de vencimento ajusta:

- fator de volume dos indicadores;
- valor das massas dos rankings;
- atraso adicional em algumas listagens;
- série de eficiência do gráfico.

### Efeito do filtro `Carteira`

O filtro de carteira ajusta:

- consolidação total;
- apenas banco;
- apenas carteira.

No mock atual, isso é refletido por fatores de cálculo, troca de origem e variação dos dados apresentados.

---

## Tabela `Top 10 títulos em aberto`

Esta tabela é montada por `buildTopTitles()`.

### Finalidade

Exibir os dez maiores títulos financeiros em aberto, com foco em valor.

### Colunas atuais

- `Cliente`
- `Título`
- `Vencimento`
- `Valor`
- `Origem`
- coluna final de ação sem título visível

### Regras importantes

- ordenação habilitada;
- ordenação inicial por maior `Valor`;
- coluna final usa ícone `...`;
- o cabeçalho da coluna de ação fica em branco;
- a ação ainda não está implementada funcionalmente.

### Comportamento do ícone `...`

Ao clicar:

- exibe `toaster` com a mensagem:
  `Esta funcionalidade está em desenvolvimento.`

Tooltip atual:

- `Ações`

---

## Tabela `10 maiores devedores`

Esta tabela é montada por `buildTopDebtors()`.

### Finalidade

Exibir os devedores mais críticos por atraso consolidado.

### Colunas atuais

- `Cliente`
- `Títulos`
- `Valor em atraso`
- `Maior atraso`
- `Cobrador`
- coluna final de ação sem título visível

### Regras importantes

- ordenação habilitada;
- ordenação inicial por `Maior atraso`, em ordem decrescente;
- coluna final usa ícone `...`;
- o comportamento do ícone segue a mesma regra do ranking superior.

---

## Gráfico de evolução

O gráfico é montado por `buildEfficiencySeries()` e exibido com `po-chart`.

### Configuração atual

- tipo: `Line`
- categorias:
  - `Nov`
  - `Dez`
  - `Jan`
  - `Fev`
  - `Mar`
  - `Abr`
- título do gráfico:
  `Recebimento de títulos em atraso`

### Série atual

Rótulo da série:

- `Eficiência de recebimento`

### Resumo textual

O resumo exibido acima do gráfico é calculado por `buildEfficiencySummary()` e informa:

- percentual final de eficiência;
- variação em pontos percentuais dentro da janela analisada.

---

## Massa local usada na tela

Ainda não existe integração definitiva com API nesta página.

Os dados atuais são montados localmente no componente por funções privadas, com objetivo de:

- validar layout;
- testar filtros rápidos;
- validar ordenação das tabelas;
- validar rolagem interna;
- validar helpers, ícones e cards;
- preparar a futura substituição por dados reais do Protheus.

### Funções mock atuais

- `buildIndicators()`
- `buildTopTitles()`
- `buildTopDebtors()`
- `buildEfficiencySeries()`

### Observação importante

Quando a integração real entrar, o ideal é preservar:

- estrutura visual;
- nomenclatura dos blocos;
- ordenações iniciais;
- posição dos cards;
- uso de helpers;
- comportamento do ícone de ações.

---

## Regras de UX já definidas

Os seguintes pontos já estão fechados e devem ser preservados:

- tela sem cabeçalho textual superior da página;
- filtros rápidos no topo;
- cards em duas linhas, não em grade uniforme de quatro colunas;
- linha de atraso primeiro;
- linha de aberto depois;
- tamanhos alternados `60/40` e `40/60`;
- cards com altura igual;
- rankings empilhados verticalmente;
- rolagem interna nas tabelas;
- coluna de ação sem título;
- ícone `...` reservado para evolução futura;
- feedback imediato ao usuário via `toaster` ao clicar em ações ainda não implementadas.

---

## Responsividade

O CSS atual trata três cenários principais.

### Desktop

- filtros em duas colunas;
- gráfico com resumo à esquerda e chart à direita;
- linhas de cards em duas colunas proporcionais.

### Tablet

Em larguras menores que `1280px`:

- filtros passam para uma coluna;
- bloco de evolução passa para uma coluna;
- cards usam duas colunas com larguras equilibradas.

### Mobile

Em larguras menores que `720px`:

- cada linha de card vira uma coluna única;
- rankings continuam empilhados verticalmente;
- o layout simplifica a leitura sem perder a estrutura principal.

---

## Pontos que devem ser preservados ao integrar com API

Quando a página for ligada ao backend, recomenda-se manter estes contratos visuais:

1. `Todos` como padrão inicial dos dois filtros;
2. linha de atraso exibindo valores em `R$`;
3. linha de aberto exibindo quantidades;
4. ranking de títulos aberto inicialmente pelo maior valor;
5. ranking de devedores aberto inicialmente pelo maior atraso;
6. colunas ordenáveis nas duas tabelas;
7. ação `...` ainda desacoplada das regras principais do dashboard;
8. helpers dos filtros e cards explicando o indicador ao usuário.

---

## Checklist de validação futura

Quando a integração real começar, validar:

1. se `Vencidos` deve considerar apenas títulos já vencidos ou também janelas específicas do backend;
2. se o filtro `Carteira` deve refletir origem operacional, modalidade de cobrança ou ambos;
3. se os indicadores devem continuar em quantidade para aberto e valor para atraso;
4. se a ordenação inicial das tabelas deve vir do backend ou continuar controlada no front;
5. se a altura fixa de `320px` das tabelas continua adequada com massa real;
6. se o resumo de eficiência deve continuar calculado localmente ou vir pronto da API;
7. se a ação `...` evoluirá para menu contextual, modal ou navegação lateral.

---

## Resumo executivo

O `Dashboard` atual é uma página PO-UI de leitura gerencial, já com layout estabilizado e preparada para integração posterior.

Hoje ela já entrega:

- filtros rápidos com helper;
- quatro indicadores distribuídos em duas linhas proporcionais;
- rankings com ordenação e rolagem interna;
- gráfico de evolução com resumo textual;
- interação de placeholder para ações futuras;
- massa fictícia local suficiente para validar o desenho funcional da tela.

Com os arquivos listados e as regras acima, é possível reconstruir a página com alta fidelidade visual e comportamental, mesmo antes da ligação definitiva com Protheus.
