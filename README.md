# Protheus ADVPL Specialist for Codex

Skill do Codex para desenvolvimento TOTVS Protheus com ADVPL e TLPP.

## O que cobre

- Geracao de codigo ADVPL e TLPP
- Migracao de ADVPL procedural para TLPP
- Debugging de AppServer, runtime, locks e performance
- Embedded SQL com `BeginSQL` / `EndSQL`
- Referencias de framework Protheus, SX e convencoes gerais

## Estrutura

```text
skills/
  protheus-advpl-specialist/
    SKILL.md
    agents/openai.yaml
    references/
```

## Instalacao manual

Copie a pasta `skills/protheus-advpl-specialist` para:

- Windows: `%USERPROFILE%\\.codex\\skills\\protheus-advpl-specialist`
- Linux/macOS: `~/.codex/skills/protheus-advpl-specialist`

## Instalacao por script

### PowerShell

```powershell
./scripts/install.ps1
```

### Bash

```bash
bash ./scripts/install.sh
```

## Uso

Exemplos de prompts:

- `Use $protheus-advpl-specialist para criar uma User Function de faturamento`
- `Use $protheus-advpl-specialist para migrar este .prw para TLPP`
- `Use $protheus-advpl-specialist para revisar este BeginSQL`
- `Use $protheus-advpl-specialist para diagnosticar erro de RecLock`

## Publicacao no GitHub

1. Crie um repositorio novo.
2. Publique estes arquivos.
3. Oriente os usuarios a copiar a pasta da skill para `~/.codex/skills/`.

Se quiser, voce ainda pode adicionar exemplos reais de `.prw` e `.tlpp` em uma pasta separada do skill.
