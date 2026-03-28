# ADVPL TLPP Skill Template

Template base para criar um skill reutilizavel do Codex para TOTVS Protheus com ADVPL e TLPP, pronto para publicar em um repositorio Git.

## Estrutura

```text
advpl-tlpp-skill-template/
  SKILL.md
  README.md
  .gitignore
  agents/
    openai.yaml
  references/
    usage-examples.md
    protheus-guidelines.md
  scripts/
    validate-skill.ps1
  assets/
    .gitkeep
```

## Como adaptar

1. Renomeie a pasta para o nome final do skill.
2. Edite `SKILL.md`:
   troque `name:` pelo nome final em minusculo com hifens.
   reescreva `description:` para dizer claramente quando o skill deve ser usado em ADVPL/TLPP.
3. Ajuste `agents/openai.yaml` com nome amigavel, descricao curta e prompt padrao.
4. Revise `references/protheus-guidelines.md` e adapte as regras ao seu padrao interno.
5. Preencha `references/`, `scripts/` e `assets/` conforme a necessidade.
6. Remova diretorios vazios que nao fizerem sentido para o skill final.

## Publicar no Git

```powershell
cd C:\caminho\para\advpl-tlpp-skill-template
git init
git add .
git commit -m "Primeira versao do skill"
git branch -M main
git remote add origin https://github.com/seu-usuario/seu-skill.git
git push -u origin main
```

## Instalar em outro VS Code

Clone o repositorio dentro da pasta de skills do Codex:

```powershell
cd C:\Users\<usuario>\.codex\skills
git clone https://github.com/seu-usuario/seu-skill.git
```

Depois reinicie a sessao do Codex ou o VS Code para recarregar os skills.

## Casos de uso esperados

- Geracao de rotinas `.prw` e `.tlpp`
- MVC Protheus
- REST API em TLPP ou legado
- Pontos de entrada
- SQL embarcado com TopConn
- Migracao de ADVPL para TLPP
- Review tecnico de customizacoes Protheus
