# Skills Disponiveis

Este diretorio contem as skills do repositorio `advpl_codex` prontas para copiar para `~/.codex/skills`.

## Lista

- `advpl-protheus`: skill geral para ADVPL, TLPP e Protheus.
- `advpl-debugging`: debugging de compilacao, runtime, stack, locks e performance.
- `advpl-code-review`: review tecnico com foco em bugs, risco de regressao e seguranca.
- `protheus-reference`: funcoes nativas, dicionario SX, REST e recursos restritos.
- `embedded-sql`: SQL em ADVPL/TLPP com `BeginSQL`, `EndSQL` e macros Protheus.
- `mvc-protheus`: `MenuDef`, `ModelDef`, `ViewDef`, `FWExecView` e automacao MVC.
- `pontos-de-entrada-protheus`: entry points, `PARAMIXB`, retorno e consulta de documentacao.
- `probat-testing`: testes unitarios TLPP com ProBat.
- `rest-protheus`: APIs REST com `WsRestFul`, `FWRest` e anotacoes TLPP.
- `tlpp-protheus`: classes TLPP, namespaces e migracao de `.prw` para `.tlpp`.
- `po-ui-protheus`: Angular + PO-UI integrados ao backend Protheus e `FwCallApp`.
- `protheus-advpl-specialist`: skill legada consolidada, mantida por compatibilidade.

## Instalacao

Para instalar tudo de uma vez, use:

PowerShell:

```powershell
./scripts/install.ps1
```

Bash:

```bash
bash ./scripts/install.sh
```

Ou copie manualmente apenas as pastas desejadas.
