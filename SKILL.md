---
name: advpl-tlpp-skill-template
description: Specialist template for creating reusable Codex skills focused on TOTVS Protheus with ADVPL and TLPP. Use when Codex needs to generate, adapt, review, or document `.prw`, `.tlpp`, `.prx`, `.ch`, `.th`, MVC routines, REST APIs, pontos de entrada, embedded SQL, or Protheus integration patterns in a reusable skill repository.
---

# ADVPL TLPP Skill Template

Use this skill as a base when creating a new repository for Protheus work with ADVPL and TLPP. Keep the trigger description specific, preserve runtime safety rules, and load only the references needed for the task being handled.

## Workflow

1. Rename the folder and the `name:` field to the final skill name in lowercase with hyphens.
2. Rewrite `description:` so it names the Protheus contexts that should trigger the skill.
3. Detect whether the skill is mainly for code generation, migration, debugging, REST, MVC, or embedded SQL.
4. Keep this file short and move detailed domain guidance to `references/`.
5. Add scripts only for repeated operations such as validation, boilerplate generation, or repository checks.
6. Validate the final folder before publishing or cloning it to another Codex environment.

## Authoring Rules

- Write the body in imperative form.
- Prefer short sections over long prose.
- Refer directly to bundled resources by path.
- Preserve Protheus safety rules in examples: prefer `Local`, restore areas, validate locks, and use `xFilial()` plus deletion filters.
- Keep backward compatibility in examples unless the skill explicitly targets migration.
- Preserve `.prw` and `.tlpp` encoding expectations when documenting edit workflows.
- Prefer Portuguese for internal identifiers and comments in repository-facing examples.
- Remove unused directories before publishing if the skill does not need them.

## Resource Selection

- Use `references/usage-examples.md` to store trigger examples and repository usage notes.
- Use `references/protheus-guidelines.md` for Protheus-specific coding and runtime rules.
- Use `scripts/` for automation helpers that save time or reduce mistakes, such as validation wrappers and boilerplate generation.
- Use `assets/` for templates, icons, starter files, or static artifacts copied into outputs.

## Validation

Run the validator from the skill-creator package or from any copied local version:

```powershell
python C:\Users\ricar\.codex\skills\.system\skill-creator\scripts\quick_validate.py C:\caminho\para\seu-skill
```

## Suggested Triggers

- "Crie uma rotina ADVPL para Protheus."
- "Monte uma API REST em TLPP."
- "Revise um ponto de entrada ou MVC do Protheus."
- "Ajude a migrar uma rotina `.prw` para `.tlpp`."
- "Preciso de padroes Protheus para SQL embarcado, locks e SX."

## Publishing

After finalizing the contents:

```powershell
git init
git add .
git commit -m "Primeira versao do skill"
```

If the repository will be cloned into another Codex installation, keep the folder name equal to the skill name.
