# advpl_codex

![Platform](https://img.shields.io/badge/platform-Codex-blue)
![TOTVS](https://img.shields.io/badge/TOTVS-Protheus-orange)
![Language](https://img.shields.io/badge/lang-ADVPL%20%7C%20TLPP-yellow)
![Status](https://img.shields.io/badge/status-initial-green)

Skill do Codex para desenvolvimento no ecossistema **TOTVS Protheus** com foco em **ADVPL**, **TLPP**, **API REST** e integrações com **PO-UI**.

Este repositório adapta para o formato de skills do Codex a proposta do projeto original **[`advpl-specialist`](https://github.com/thalysjuvenal/advpl-specialist)**, criado por **Thalys Juvenal**, preservando os devidos créditos e acrescentando uma organização voltada ao uso no Codex.

## Indice

- [Visao Geral](#visao-geral)
- [Objetivo](#objetivo)
- [O que esta incluido](#o-que-esta-incluido)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Exemplo Fim a Fim](#exemplo-fim-a-fim)
- [Instalacao](#instalacao)
- [Uso](#uso)
- [Contribuicao Desta Adaptacao](#contribuicao-desta-adaptacao)
- [Creditos e Atribuicao](#creditos-e-atribuicao)
- [Roadmap](#roadmap)
- [Licenca](#licenca)

## Visao Geral

O repositório entrega uma skill chamada `protheus-advpl-specialist` para uso no Codex, cobrindo os cenários mais comuns de desenvolvimento Protheus:

- geracao de codigo ADVPL e TLPP
- desenvolvimento de API REST em ADVPL e TLPP
- integracao de backend Protheus com frontend PO-UI
- migracao de ADVPL procedural para TLPP
- debugging de erros de compilacao, runtime, locks e performance
- Embedded SQL com `BeginSQL` / `EndSQL`
- referencia pratica para framework Protheus, SX e convencoes de projeto

## Objetivo

O objetivo deste projeto nao e substituir o trabalho original, e sim:

1. reaproveitar a ideia e a base conceitual do `advpl-specialist`
2. converter esse conhecimento para o formato nativo de skills do Codex
3. facilitar a instalacao e o uso pela comunidade ADVPL/TLPP que trabalha com Codex

## O que esta incluido

### Skill principal

- `skills/protheus-advpl-specialist/SKILL.md`

### Referencias separadas por contexto

- `references/code-generation.md`
- `references/migration.md`
- `references/debugging.md`
- `references/embedded-sql.md`
- `references/protheus-reference.md`
- `references/rest-po-ui.md`

### Metadados de interface

- `agents/openai.yaml`

### Scripts de instalacao

- `scripts/install.ps1`
- `scripts/install.sh`

## Estrutura do Projeto

```text
advpl_codex/
├── README.md
├── LICENSE
├── scripts/
│   ├── install.ps1
│   └── install.sh
├── examples/
│   └── protheus-rest-po-ui/
│       ├── backend/
│       ├── contract/
│       └── frontend/
└── skills/
    └── protheus-advpl-specialist/
        ├── SKILL.md
        ├── agents/
        │   └── openai.yaml
        └── references/
            ├── code-generation.md
            ├── migration.md
            ├── debugging.md
            ├── embedded-sql.md
            ├── protheus-reference.md
            └── rest-po-ui.md
```

## Exemplo Fim a Fim

O repositório agora inclui um exemplo completo em `examples/protheus-rest-po-ui/`:

- backend REST em ADVPL
- backend REST em TLPP
- contrato JSON para `clientes`
- frontend Angular com PO-UI para listagem e formulario

Esse exemplo foi pensado como material de estudo e como base para adaptar em projetos reais.

## Instalacao

### Instalacao manual

Copie a pasta `skills/protheus-advpl-specialist` para:

- Windows: `%USERPROFILE%\\.codex\\skills\\protheus-advpl-specialist`
- Linux/macOS: `~/.codex/skills/protheus-advpl-specialist`

### Instalacao por script

PowerShell:

```powershell
./scripts/install.ps1
```

Bash:

```bash
bash ./scripts/install.sh
```

## Uso

Exemplos de prompts:

```text
Use $protheus-advpl-specialist para criar uma User Function de faturamento
Use $protheus-advpl-specialist para migrar este .prw para TLPP
Use $protheus-advpl-specialist para revisar este BeginSQL
Use $protheus-advpl-specialist para diagnosticar erro de RecLock
Use $protheus-advpl-specialist para explicar uma rotina MVC do Protheus
Use $protheus-advpl-specialist para criar uma API REST em ADVPL para consumo no PO-UI
Use $protheus-advpl-specialist para desenhar contrato backend Protheus + frontend PO-UI
```

## Contribuicao Desta Adaptacao

Esta adaptacao traz algumas contribuicoes especificas para o ecossistema Codex:

- empacotamento no formato de skill reutilizavel do Codex
- separacao das referencias por tipo de tarefa para reduzir contexto carregado
- instalacao simplificada por script
- organizacao voltada ao uso em projetos reais com `.prw`, `.tlpp`, `.ch` e `.th`
- suporte inicial para backend REST Protheus e frontend PO-UI
- base inicial para futura expansao com mais conteudo do projeto original

## Creditos e Atribuicao

Este projeto foi inspirado e parcialmente adaptado a partir de:

- Projeto original: [`thalysjuvenal/advpl-specialist`](https://github.com/thalysjuvenal/advpl-specialist)
- Autor original: **Thalys Juvenal**

Reconhecemos que a ideia, a estrutura conceitual e parte da organizacao funcional partiram do trabalho original. Esta versao apresenta uma **adaptacao para o Codex**, com foco em:

- formato de distribuicao compatível com skills do Codex
- instalacao local em `~/.codex/skills`
- reorganizacao do conteudo para invocacao progressiva

Se o projeto original evoluir, este repositorio pode incorporar novas melhorias mantendo a atribuicao adequada.

## Roadmap

- ampliar a base de referencias com mais exemplos praticos ADVPL/TLPP
- ampliar a cobertura de REST Protheus e PO-UI com exemplos completos
- incluir exemplos reais de MVC, REST e pontos de entrada
- enriquecer o exemplo fim a fim com autenticacao e fluxos de exclusao
- adicionar documentacao mais detalhada sobre TDN, SX e boas praticas
- avaliar empacotamento adicional para distribuicao mais simples

## Licenca

Este repositório esta publicado sob a licenca [MIT](LICENSE).

Sempre que reutilizar este material, mantenha tambem os creditos ao projeto original `advpl-specialist` e ao autor **Thalys Juvenal**.
