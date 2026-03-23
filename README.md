# advpl_codex

![Platform](https://img.shields.io/badge/platform-Codex-blue)
![TOTVS](https://img.shields.io/badge/TOTVS-Protheus-orange)
![Language](https://img.shields.io/badge/lang-ADVPL%20%7C%20TLPP-yellow)
![Status](https://img.shields.io/badge/status-active-green)

Colecao de skills para Codex voltada ao ecossistema TOTVS Protheus, com foco em ADVPL, TLPP, MVC, REST, PO-UI, debugging, SQL e testes.

Este repositorio adapta para o formato de skills do Codex a proposta do projeto original [`advpl-specialist`](https://github.com/thalysjuvenal/advpl-specialist), criado por Thalys Juvenal, e tambem incorpora referencias praticas do projeto local `po-ui/Financeiro/po-boleto` para os cenarios de PO-UI + Protheus.

## Visao Geral

O repositorio agora entrega um conjunto de skills especializados para uso incremental no Codex. Em vez de uma unica skill grande, a base foi separada por contexto para facilitar o disparo correto e reduzir contexto desnecessario.

Skills atualmente incluidos:

- `advpl-protheus`
- `advpl-debugging`
- `advpl-code-review`
- `protheus-reference`
- `embedded-sql`
- `mvc-protheus`
- `pontos-de-entrada-protheus`
- `probat-testing`
- `rest-protheus`
- `tlpp-protheus`
- `po-ui-protheus`

Tambem permanece no repositorio a skill legada:

- `protheus-advpl-specialist`

## Estrutura

```text
advpl_codex/
|-- README.md
|-- LICENSE
|-- scripts/
|   |-- install.ps1
|   `-- install.sh
|-- examples/
|   `-- protheus-rest-po-ui/
`-- skills/
    |-- README.md
    |-- advpl-protheus/
    |-- advpl-debugging/
    |-- advpl-code-review/
    |-- protheus-reference/
    |-- embedded-sql/
    |-- mvc-protheus/
    |-- pontos-de-entrada-protheus/
    |-- probat-testing/
    |-- rest-protheus/
    |-- tlpp-protheus/
    |-- po-ui-protheus/
    `-- protheus-advpl-specialist/
```

## O Que Cada Skill Faz

### Base geral

- `advpl-protheus`: skill guarda-chuva para tarefas gerais de ADVPL, TLPP e Protheus.

### Desenvolvimento e arquitetura

- `tlpp-protheus`: classes TLPP, namespaces, wrappers e migracao de `.prw` para `.tlpp`.
- `mvc-protheus`: `MenuDef`, `ModelDef`, `ViewDef`, `FWExecView` e `FWMVCRotAuto`.
- `rest-protheus`: APIs REST com `WsRestFul`, `FWRest` e anotacoes TLPP.
- `po-ui-protheus`: apps Angular com PO-UI integradas ao backend Protheus e `FwCallApp`.

### Qualidade e manutencao

- `advpl-debugging`: erros de compilacao, runtime, stack, locks e performance.
- `advpl-code-review`: review com foco em bugs, risco de regressao, seguranca e modernizacao segura.
- `probat-testing`: testes TLPP com ProBat.

### Referencia tecnica

- `protheus-reference`: funcoes nativas, framework, dicionario SX e restricoes.
- `embedded-sql`: `BeginSQL`, `EndSQL`, `%table%`, `%xfilial%`, `%notDel%` e `TCQuery`.
- `pontos-de-entrada-protheus`: pontos de entrada, `PARAMIXB`, retorno esperado e consulta ao TDN.

Descricao detalhada por skill: [skills/README.md](skills/README.md)

## Instalacao

### Instalar todas as skills

PowerShell:

```powershell
./scripts/install.ps1
```

Bash:

```bash
bash ./scripts/install.sh
```

Os scripts copiam todas as pastas dentro de `skills/` para `~/.codex/skills`.

### Instalacao manual

Copie as pastas desejadas de `skills/` para:

- Windows: `%USERPROFILE%\.codex\skills`
- Linux/macOS: `~/.codex/skills`

Exemplo:

```text
%USERPROFILE%\.codex\skills\advpl-debugging
%USERPROFILE%\.codex\skills\po-ui-protheus
```

Depois reinicie a sessao do Codex para redescobrir os skills.

## Uso

Exemplos de prompts:

```text
Use $advpl-debugging para analisar este erro de RecLock
Use $protheus-reference para explicar a funcao FWExecView
Use $embedded-sql para revisar este BeginSQL
Use $mvc-protheus para criar MenuDef, ModelDef e ViewDef
Use $pontos-de-entrada-protheus para implementar o ponto MT100LOK
Use $probat-testing para gerar testes TLPP desta classe
Use $rest-protheus para criar um endpoint de consulta de clientes
Use $tlpp-protheus para migrar este .prw para .tlpp
Use $po-ui-protheus para evoluir esta app Angular embarcada no Protheus
Use $advpl-code-review para revisar este fonte legado
Use $advpl-protheus para me ajudar numa rotina Protheus sem definir ainda o contexto
```

## Publicacao e Atribuicao

Este repositorio:

- adapta o conteudo do projeto `advpl-specialist` para o formato de skill do Codex
- adiciona novas skills menores e mais especializadas
- incorpora referencias praticas de um projeto real de PO-UI + Protheus

Fontes principais utilizadas:

- Projeto original: [`thalysjuvenal/advpl-specialist`](https://github.com/thalysjuvenal/advpl-specialist)
- Autor original: Thalys Juvenal
- Projeto local de referencia para PO-UI: `po-ui/Financeiro/po-boleto`

Cada skill adaptada inclui um arquivo `references/source-attribution.md` quando aplicavel.

## Roadmap

- adicionar mais exemplos de pontos de entrada reais por modulo
- ampliar referencias de TLPP e REST com casos de autenticacao
- incluir exemplos completos de PO-UI com publicacao no Protheus
- revisar e padronizar o skill legado `protheus-advpl-specialist`

## Licenca

Este repositorio esta publicado sob a licenca [MIT](LICENSE).
