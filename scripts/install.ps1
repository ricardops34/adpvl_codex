$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$targetRoot = Join-Path $HOME ".codex/skills"
$skillsRoot = Join-Path $repoRoot "skills"

if (-not (Test-Path $skillsRoot)) {
    throw "Skills source not found: $skillsRoot"
}

New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null

Get-ChildItem $skillsRoot -Directory | ForEach-Object {
    $source = $_.FullName
    $target = Join-Path $targetRoot $_.Name

    if (Test-Path $target) {
        Remove-Item -Recurse -Force $target
    }

    Copy-Item -Recurse -Force $source $target
    Write-Host "Installed skill to: $target"
}
