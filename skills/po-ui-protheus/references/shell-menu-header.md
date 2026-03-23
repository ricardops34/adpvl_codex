# Shell do Menu

Esta documentacao descreve o shell atual da aplicacao em `po-ui/Financeiro/po-boleto/src/app`, com foco no menu lateral. O objetivo e permitir recriar a estrutura sem depender do historico da conversa.

## Estado atual

O shell atual **nao usa header superior ativo no layout**.

Decisao adotada nesta fase:

- manter somente `po-menu` lateral
- manter `router-outlet` na area principal
- usar `p-menu-header-template` para montar a area superior customizada do menu
- deixar a logo e o nome do usuario preparados para origem dinamica do Protheus

Motivo:

- as tentativas com `po-header` acima do menu geraram sobreposicao, desalinhamento e conflito visual com o `po-menu`
- o menu isolado ficou mais estavel e mais simples de manter

## Arquivos principais

- `src/app/app.html`: estrutura do shell com `po-menu` e `router-outlet`
- `src/app/app.css`: ajustes visuais do menu e do bloco superior customizado
- `src/app/app.ts`: itens do menu e dados exibidos no topo lateral
- `src/app/app.routes.ts`: rotas `dashboard`, `boletos` e `ajuda`
- `public/menu-logo.png`: logo usada hoje para validacao de layout
- `public/bj_ico.png`: imagem fixa usada quando o menu estiver recolhido
- `src/assets/menu-logo.png`: copia de referencia da logo

## Estrutura do template

Arquivo: `src/app/app.html`

```html
<div class="po-wrapper boleto-shell">
  <po-menu
    [p-menus]="menus"
    [p-filter]="true"
    [p-automatic-toggle]="true"
    [p-logo-link]="false"
    [p-short-logo]="menuCollapsedLogoUrl"
  >
    <ng-template p-menu-header-template>
      <div class="menu-hero">
        <div class="menu-hero__logo-box">
          <img class="menu-hero__logo" [src]="userLogoUrl" alt="RCG" />
        </div>
        <p class="menu-hero__eyebrow">{{ menuWelcomeTitle }}</p>
        <h2 class="menu-hero__title">{{ userDisplayName }}</h2>
      </div>
    </ng-template>
  </po-menu>

  <div class="boleto-content">
    <router-outlet></router-outlet>
  </div>
</div>
```

Regras importantes:

- o shell comeca direto em `.po-wrapper`
- o `po-menu` continua nativo do PO-UI
- a area customizada do topo do menu e feita com `p-menu-header-template`
- a busca do menu deve continuar com o CSS padrao do PO-UI
- `router-outlet` fica ao lado do menu, sem wrappers extras desnecessarios

## Menu lateral

Configurado em `src/app/app.ts` pela propriedade `menus`.

Itens atuais:

- `Dashboard`
- `Boletos`
- `Ajuda`
- `Sair`

Icones atuais:

- `Dashboard`: `an an-chart-bar`
- `Boletos`: `an an-currency-circle-dollar`
- `Ajuda`: `an an-question`
- `Sair`: `an an-sign-out`

Cada item navegavel usa `link` interno:

- `/dashboard`
- `/boletos`
- `/ajuda`

A opcao `Sair` nao encerra sessao nesta versao. Ela exibe um aviso e redireciona para `/dashboard`.

Mensagem atual:

- `Saída indisponível nesta versão da interface.`

Configuracao usada no template:

- `[p-menus]="menus"`
- `[p-filter]="true"`
- `[p-automatic-toggle]="true"`
- `[p-logo-link]="false"`
- `[p-short-logo]="menuCollapsedLogoUrl"`

Observacao:

- no estado expandido, a logo visivel fica no bloco customizado do `p-menu-header-template`
- no estado recolhido, o `po-menu` usa o `p-short-logo`
- a imagem fixa atual do recolhido e `public/bj_ico.png`

## Bloco superior customizado do menu

Esse bloco foi criado para ficar acima da lista e acima do filtro.

Elementos exibidos:

- logo dentro de um box com borda
- texto fixo `Bem-vindo,`
- nome do usuario logado

Hoje os dados estao assim em `src/app/app.ts`:

- `menuWelcomeTitle = 'Bem-vindo,'`
- `userDisplayName = 'Usuario Protheus'`
- `userLogoUrl = '/menu-logo.png'`
- `menuCollapsedLogoUrl = '/bj_ico.png'`

Objetivo final:

- `userDisplayName` deve vir do usuario logado no Protheus
- `userLogoUrl` deve vir de logo dinamica enviada pelo Protheus

## Logo

Estado atual:

- a logo usada para validar o layout e `public/menu-logo.png`
- a logo fixa do estado recolhido e `public/bj_ico.png`
- o template usa `[src]="userLogoUrl"`

Motivo de usar `public`:

- foi a forma mais estavel para servir a imagem local durante os testes

Regra futura:

- quando a integracao estiver pronta, manter o binding dinamico e trocar apenas o valor de `userLogoUrl`
- a logo do recolhido pode continuar fixa ou tambem virar dinamica, se o Protheus passar uma versao reduzida

## Estilo do shell

Arquivo: `src/app/app.css`

Ajustes principais:

- `:host` com `min-height: 100vh`
- fundo suave com gradiente neutro
- `po-menu` ocupando a altura total no desktop
- ocultacao da area nativa de logo do menu somente quando expandido:
  - `.po-wrapper:not(.po-collapsed-menu) .po-menu-header-container-logo { display: none; }`
- exibicao da area nativa de logo quando recolhido:
  - `.po-wrapper.po-collapsed-menu .po-menu-header-container-logo { display: flex; }`
- bloco customizado com:
  - `.menu-hero`
  - `.menu-hero__logo-box`
  - `.menu-hero__logo`
  - `.menu-hero__eyebrow`
  - `.menu-hero__title`

Regras importantes:

- a caixa de pesquisa do menu deve ficar no CSS padrao do PO-UI
- evitar override direto em `.po-menu-filter` se nao for realmente necessario
- no mobile, o bloco `menu-hero` fica oculto
- o item `Sair` segue o visual nativo do PO-UI; a tentativa de deixar esse item em vermelho nao foi mantida

## O que nao fazer

Para evitar repetir os problemas desta rodada:

- nao recolocar `po-header` global por cima do menu sem revisar o shell inteiro
- nao misturar logo nativa do `po-menu` com logo customizada ao mesmo tempo
- nao esconder a logo nativa em todos os estados, porque isso quebra a imagem do menu recolhido
- nao sobrescrever a caixa de pesquisa do menu sem necessidade
- nao criar shell customizado com `aside/main` fora do padrao do PO-UI

## Como recriar do zero

Se precisarmos refazer essa parte:

1. Recriar o `.po-wrapper`.
2. Recolocar `po-menu` com `p-menus`, `p-filter` e `p-automatic-toggle`.
3. Recriar o `p-menu-header-template` com logo, saudacao e nome do usuario.
4. Recolocar o `router-outlet` na area `.boleto-content`.
5. Restaurar os itens `menus` em `src/app/app.ts`.
6. Restaurar `userLogoUrl`, `menuCollapsedLogoUrl`, `menuWelcomeTitle` e `userDisplayName`.
7. Reaplicar os estilos de `src/app/app.css`, inclusive a alternancia entre logo expandida e recolhida.
8. Executar `npm run build`.

## Validacao minima apos mudancas

Depois de qualquer ajuste no shell:

1. abrir `Dashboard`
2. abrir `Boletos`
3. abrir `Ajuda`
4. validar se a logo aparece no topo do menu
5. validar se o nome do usuario aparece abaixo de `Bem-vindo,`
6. validar se a busca do menu continua no visual padrao do PO-UI
7. validar se o `bj_ico.png` aparece corretamente quando o menu estiver recolhido
8. rodar `npm run build`
