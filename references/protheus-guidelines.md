# Diretrizes Protheus

## Regras basicas

- Preferir `Local` em codigo novo.
- Salvar e restaurar area com `GetArea()` e `RestArea()` quando houver acesso a banco.
- Validar `RecLock()` e garantir `MsUnlock()`.
- Usar `xFilial()` e filtro de exclusao logica em consultas.
- Preservar assinatura de `User Function`, ponto de entrada, job e rotinas chamadas por menu.

## ADVPL

- Usar `#Include "TOTVS.CH"` por padrao.
- Incluir `TopConn.ch` apenas quando houver necessidade de SQL, `TCQuery`, `TCGenQry` ou `TCSqlExec`.
- Evitar `Public` e `Private` em codigo novo.
- Em exemplos internos, preferir identificadores em portugues.

## TLPP

- Usar classes e metodos com nomes claros e coerentes com o modulo.
- Para REST, validar payload, padronizar resposta e evitar expor erro interno bruto.
- Para migracao, manter o ponto de entrada antigo quando o contrato precisar continuar ativo.

## SQL embarcado

- Documentar `%table%`, `%xfilial%` e `%notDel%` quando o skill ensinar consultas.
- Depois de `TCGenQry`, aplicar `TCSetField()` nos campos numericos e de data retornados.

## Encoding

- Preservar `.prw` e `.tlpp` em `Windows-1252` quando o repositorio original usar essa codificacao.
