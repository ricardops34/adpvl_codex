# Tela Ajuda

## Objetivo

Esta documentacao descreve a rotina de `Ajuda` do front-end em `po-ui/Financeiro/po-boleto`, com foco em:

- estrutura atual da central de ajuda;
- estrutura das paginas de ajuda por rotina;
- padroes visuais e funcionais ja definidos;
- regras para incluir novas rotinas;
- checklist para manutencao e recriacao futura.

O objetivo e permitir atualizar ou recriar a ajuda sem depender do historico da conversa.

---

## Arquivos principais

### Rotas

- `src/app/app.routes.ts`

Rotas atuais da ajuda:

- `/ajuda`
- `/ajuda/dashboard`
- `/ajuda/boletos`

### Pagina principal da ajuda

- `src/app/pages/ajuda/ajuda.page.ts`
- `src/app/pages/ajuda/ajuda.page.html`
- `src/app/pages/ajuda/ajuda.page.css`

### Paginas de ajuda por rotina

- `src/app/pages/ajuda/ajuda-dashboard.page.ts`
- `src/app/pages/ajuda/ajuda-dashboard.page.html`
- `src/app/pages/ajuda/ajuda-dashboard.page.css`
- `src/app/pages/ajuda/ajuda-boletos.page.ts`
- `src/app/pages/ajuda/ajuda-boletos.page.html`
- `src/app/pages/ajuda/ajuda-boletos.page.css`

### Imagens usadas

As imagens da ajuda ficam em:

- `public/assets/help-images`

Imagens gerais atuais dos cards:

- `public/assets/help-images/dashboard-overview.png`
- `public/assets/help-images/boletos-overview.png`

Imagens dos topicos:

- `public/assets/help-images/boletos-toolbar.png`
- `public/assets/help-images/boletos-generation.png`
- `public/assets/help-images/boletos-advanced-search.png`
- `public/assets/help-images/boletos-status-table.png`
- `public/assets/help-images/dashboard-efficiency-chart.png`
- `public/assets/help-images/dashboard-top-debtors.png`
- `public/assets/help-images/dashboard-top-open-titles.png`
- `public/assets/help-images/dashboard-indicators.png`
- `public/assets/help-images/dashboard-filters.png`

---

## Estrutura atual da ajuda

Hoje a ajuda foi separada em 3 niveis:

1. pagina principal `Ajuda`;
2. pagina `Ajuda Dashboard`;
3. pagina `Ajuda Boletos`.

### 1. Pagina principal `Ajuda`

Finalidade:

- funcionar como central de entrada;
- apresentar um card por rotina;
- permitir acesso rapido a cada ajuda especifica.

Estrutura visual atual:

- `po-page-default` com breadcrumb;
- `po-widget` superior com titulo `Central de ajuda`;
- grid com 2 cards;
- cada card usa `po-widget`;
- cada card exibe:
  - imagem geral da rotina;
  - titulo da ajuda;
  - descricao curta.

Regra atual de navegacao:

- a imagem do card e clicavel;
- o card nao possui botao de acao no rodape;
- nao ha botao `Abrir ajuda desta rotina`;
- nao ha texto introdutorio longo no topo.

### 2. Paginas de ajuda por rotina

Cada rotina possui uma pagina propria com:

- breadcrumb;
- botao flutuante de retorno ao indice;
- bloco inicial com o nome da rotina;
- lista numerada de topicos;
- widgets separados por assunto;
- imagem da tela;
- descricao textual;
- lista de bullets explicando comportamento e funcao.

Paginas atuais:

- `Ajuda Dashboard`
- `Ajuda Boletos`

---

## Padroes fechados da pagina principal

### Breadcrumb

A pagina principal usa breadcrumb com:

- `Ajuda`

As paginas por rotina usam:

- `Ajuda > Dashboard`
- `Ajuda > Boletos`

Regra:

- breadcrumb existe somente nas paginas de ajuda;
- paginas operacionais nao usam breadcrumb.

### Cards da central

Padroes atuais:

- todos os cards devem ter a mesma altura;
- a area da imagem deve ter altura fixa;
- a imagem deve ficar centralizada com `object-fit: contain`;
- o card nao deve ter botao CTA no rodape;
- a navegacao principal do card fica pela imagem.

### Grid

Padrao atual:

- desktop: 2 colunas;
- mobile: 1 coluna.

---

## Padroes fechados das paginas de rotina

### Topo da pagina

Padroes atuais:

- sem titulo superior do `po-page-default`;
- sem bloco `Visao geral`;
- sem botoes extras de navegacao no topo;
- o primeiro bloco visivel da pagina e o widget com o nome da rotina.
- esse widget inicial tambem funciona como indice da pagina.

Exemplo atual:

- `Dashboard`
- `Boletos`

### Indice da rotina

O primeiro widget da pagina de rotina funciona como indice.

Padroes atuais:

- o titulo do widget e o nome da rotina;
- o indice usa lista numerada;
- formato visual:
  - `1 - Filtros rapidos`
  - `2 - Indicadores principais`
- cada item do indice deve rolar para o topico correspondente;
- o marcador de retorno `indice-rotina` deve ficar antes do widget, nao dentro dele.

Motivo:

- quando o usuario clicar no botao flutuante de retorno, a pagina volta para a area do breadcrumb e do indice, e nao para o meio do widget.

### Topicos

Cada topico deve ser exibido em um `po-widget` separado.

Estrutura atual:

- titulo do widget = nome do assunto;
- bloco interno `routine-topic`;
- imagem da tela a esquerda;
- descricao e bullets a direita;
- borda lateral colorida;
- fundo suave por assunto.

Padroes do conteudo:

- descrever o que o bloco apresenta;
- descrever as funcoes disponiveis;
- explicar ordenacao, rolagem, selecao e filtros quando existirem;
- nao usar textos genericos demais;
- manter linguagem orientada ao usuario final.

Exemplo correto:

- na listagem de maiores devedores, informar que a tabela mostra cliente, quantidade de titulos, valor em atraso, maior atraso e cobrador;
- informar que as colunas sao ordenaveis;
- informar que a coluna `...` esta reservada para acoes futuras.

### Botao flutuante de retorno

Cada pagina de rotina possui um botao flutuante no canto inferior direito para voltar ao indice.

Padrao atual:

- cor de fundo azul;
- icone branco;
- formato circular;
- posicao fixa;
- o retorno deve enquadrar breadcrumb e indice na volta ao topo;
- acao: `scrollToTopic('indice-rotina')`.

### Responsividade

Padroes atuais:

- em desktop, imagem e texto ficam lado a lado;
- abaixo de `1280px`, o topico passa para uma coluna;
- o botao flutuante continua visivel;
- abaixo de `640px`, o botao reduz a distancia da borda.

---

## Dados e estrutura dos componentes

### Pagina principal

Em `ajuda.page.ts`, cada card segue a interface:

```ts
interface HelpRoutineCard {
  title: string;
  description: string;
  route: string;
  imageUrl: string;
  imageAlt: string;
  topics: string[];
}
```

Uso atual:

- `title`: nome da ajuda da rotina;
- `description`: resumo curto da rotina;
- `route`: rota da ajuda especifica;
- `imageUrl`: imagem geral da rotina;
- `imageAlt`: texto alternativo;
- `topics`: resumo dos assuntos cobertos.

### Paginas por rotina

Cada pagina de rotina usa uma interface de topicos semelhante a esta:

```ts
interface RoutineHelpTopic {
  id: string;
  title: string;
  description: string;
  imageUrl: string;
  imageAlt: string;
  accent: string;
  surface: string;
  bullets: string[];
}
```

Uso dos campos:

- `id`: ancora usada no indice;
- `title`: titulo do widget;
- `description`: explicacao principal do assunto;
- `imageUrl`: print relacionado ao topico;
- `imageAlt`: descricao da imagem;
- `accent`: cor da borda lateral;
- `surface`: cor de fundo suave do bloco;
- `bullets`: lista de orientacoes ao usuario.

### Funcao de navegacao interna

As paginas de rotina usam:

```ts
scrollToTopic(topicId: string): void
```

Regra atual:

- localizar o elemento por `id`;
- executar `scrollIntoView`;
- atualizar a URL com `#topicId`.

---

## Padrao visual adotado

### Componentes PO-UI usados

Na ajuda, o padrao atual usa principalmente:

- `PoPageModule`
- `PoWidgetModule`
- `PoButtonModule`

### Cores e leitura

Padroes ja fechados:

- fundo neutro e limpo;
- destaque azul para navegacao e links;
- borda lateral colorida nos topicos;
- fundos suaves diferentes por assunto;
- tipografia simples e facil de ler;
- sem excesso de botoes ou chamadas visuais.

### O que evitar

Para manter a padronizacao:

- nao recolocar botoes CTA nos cards da pagina principal;
- nao recolocar bloco `Visao geral` nas paginas de rotina;
- nao recolocar titulo superior no `po-page-default` das paginas de rotina;
- nao renomear o widget inicial para `Indice`, pois o padrao aprovado e usar o nome da rotina;
- nao usar breadcrumb nas paginas operacionais;
- nao misturar varios estilos de indice na mesma pagina;
- nao transformar o indice em badges ou chips;
- nao usar cards com alturas diferentes na pagina principal;
- nao usar imagens fora de `public/assets/help-images` sem necessidade.

---

## Como criar uma nova ajuda de rotina

Se no futuro surgir uma nova rotina, seguir esta sequencia:

1. Criar a rota em `src/app/app.routes.ts`.
2. Criar os arquivos:
   - `ajuda-nova.page.ts`
   - `ajuda-nova.page.html`
   - `ajuda-nova.page.css`
3. Repetir o padrao da pagina de rotina:
   - breadcrumb;
   - botao flutuante;
   - ancora `indice-rotina` antes do primeiro widget;
   - widget inicial com o nome da rotina;
   - lista numerada de assuntos;
   - `po-widget` por topico.
4. Incluir a nova ajuda em `ajuda.page.ts` dentro de `rotinas`.
5. Adicionar imagem geral da rotina em `public/assets/help-images`.
6. Adicionar as imagens dos topicos em `public/assets/help-images`.
7. Descrever os componentes da tela com foco em:
   - o que aparece;
   - o que o usuario pode fazer;
   - filtros;
   - ordenacao;
   - selecao;
   - acoes futuras.
8. Executar `npm run build`.

---

## Como atualizar uma ajuda ja existente

Ao revisar `Dashboard` ou `Boletos`, seguir estas regras:

1. Primeiro atualizar a tela real da rotina.
2. Depois atualizar as imagens da ajuda, se o print tiver mudado.
3. Revisar o `description` do topico.
4. Revisar os `bullets` explicando:
   - conteudo apresentado;
   - funcao operacional;
   - regras de ordenacao;
   - rolagem;
   - filtros;
   - selecao;
   - placeholders ou acoes futuras.
5. Validar se o indice ainda corresponde exatamente aos assuntos da pagina.
6. Rodar revisao ortografica antes de finalizar.
7. Executar `npm run build`.

---

## Checklist minimo de validacao

Depois de qualquer mudanca na Ajuda, validar:

1. se `/ajuda` abre corretamente;
2. se os dois cards aparecem com a mesma altura;
3. se as imagens dos cards carregam corretamente;
4. se o clique na imagem abre a pagina da rotina correta;
5. se o breadcrumb da ajuda esta correto;
6. se a pagina da rotina abre sem titulo superior duplicado;
7. se o indice lista os assuntos em ordem numerica;
8. se cada item do indice rola para o ponto correto;
9. se o botao flutuante retorna para o topo do indice;
10. se as imagens dos topicos carregam corretamente;
11. se os textos continuam com ortografia e acentuacao corretas;
12. se `npm run build` conclui com sucesso.

---

## Resumo executivo

A rotina de `Ajuda` foi padronizada para ter:

- uma central de entrada simples;
- uma pagina de ajuda por rotina;
- indice interno com navegacao por ancora;
- conteudo orientado ao usuario final;
- imagens reais da interface;
- padrao visual consistente com PO-UI;
- manutencao simples por arquivo e por topico.

Seguindo os arquivos, regras e checklist desta documentacao, e possivel recriar ou evoluir a ajuda sem perder a padronizacao aprovada no projeto.
