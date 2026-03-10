#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="$REPO_ROOT/skills/protheus-advpl-specialist"
TARGET_ROOT="${HOME}/.codex/skills"
TARGET="$TARGET_ROOT/protheus-advpl-specialist"

if [[ ! -d "$SOURCE" ]]; then
  echo "Skill source not found: $SOURCE" >&2
  exit 1
fi

mkdir -p "$TARGET_ROOT"
rm -rf "$TARGET"
cp -R "$SOURCE" "$TARGET"

echo "Installed skill to: $TARGET"
