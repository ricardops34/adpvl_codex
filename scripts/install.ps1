$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repoRoot "skills/protheus-advpl-specialist"
$targetRoot = Join-Path $HOME ".codex/skills"
$target = Join-Path $targetRoot "protheus-advpl-specialist"

if (-not (Test-Path $source)) {
    throw "Skill source not found: $source"
}

New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null

if (Test-Path $target) {
    Remove-Item -Recurse -Force $target
}

Copy-Item -Recurse -Force $source $target

Write-Host "Installed skill to: $target"
