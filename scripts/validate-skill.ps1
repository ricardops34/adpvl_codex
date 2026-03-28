param(
    [Parameter(Mandatory = $true)]
    [string]$SkillPath
)

$validator = "C:\Users\ricar\.codex\skills\.system\skill-creator\scripts\quick_validate.py"

if (-not (Test-Path -LiteralPath $validator)) {
    Write-Error "Validador nao encontrado em $validator"
    exit 1
}

python $validator $SkillPath
