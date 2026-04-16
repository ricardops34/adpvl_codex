---
name: tlpp-protheus
description: Desenvolvimento e migracao de codigo TLPP no TOTVS Protheus. Use quando Codex precisar criar classes TLPP, organizar namespaces, migrar `.prw` para `.tlpp`, montar wrappers de compatibilidade, aplicar `tlpp-core.th` e outros includes `.th`, ou revisar estrutura orientada a objetos em projetos Protheus.
---

# TLPP Protheus

## Quando usar

Use este skill para criacao, revisao e migracao de codigo TLPP no Protheus, com foco em namespaces, classes, encapsulamento e convivencia segura com codigo ADVPL legado.

## Quando nao usar

- debug geral de ADVPL sem foco em classes TLPP: prefira `advpl-protheus`
- consulta de sintaxe/documentacao sem mudanca de codigo: prefira `protheus-reference`

## Fluxo rapido (eficiente)

1. Classificar: `classe nova`, `ajuste`, `migracao`.
2. Consultar `doc/referencias-advpl-tlpp.md` do repositorio alvo.
3. Ler somente a referencia necessaria:
   - classe nova: `references/templates-classes.md`
   - migracao: `references/migration-rules.md`, `references/migration-checklist.md`
4. Aplicar padrao de saida objetivo (abaixo) e checagem de compatibilidade.

## Formato de saida

- estrutura proposta (classe/metodos/dados)
- patch/trechos alterados
- impactos em compatibilidade
- checklist de validacao final

## Regras de prioridade

- Preferir `#Include "tlpp-core.th"` e demais `.th` adequados.
- Usar namespace coerente, em minusculas e sem underscore.
- Manter uma classe por arquivo quando fizer sentido.
- Migrar `Static Function` para metodo privado e `Private/Public` para `data`/parametros.
- Preservar `GetArea()` e `RestArea()` quando houver acesso a banco.

## Guardrails criticos

- Nao usar `using namespace tlpp.*` como substituto de `.th` quando a recomendacao for include.
- Nao remover `User Function` legado sem avaliar wrapper de compatibilidade.
- Nao migrar estrutura sem preservar comportamento funcional.
- Sempre alinhar decisoes ao arquivo `doc/referencias-advpl-tlpp.md`.

## Fontes oficiais

- `https://tdn.totvs.com/display/tec/TLPP`
- `https://tdn.totvs.com/display/tec/AdvPL`

## References

- `references/templates-classes.md`
- `references/migration-rules.md`
- `references/migration-checklist.md`
- `references/source-attribution.md`
- `TDN TLPP (oficial): https://tdn.totvs.com/display/tec/TLPP`
- `TDN AdvPL (oficial): https://tdn.totvs.com/display/tec/AdvPL`
