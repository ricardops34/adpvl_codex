#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_ROOT="$REPO_ROOT/skills"
TARGET_ROOT="${HOME}/.codex/skills"

if [[ ! -d "$SKILLS_ROOT" ]]; then
  echo "Skills source not found: $SKILLS_ROOT" >&2
  exit 1
fi

mkdir -p "$TARGET_ROOT"

for SOURCE in "$SKILLS_ROOT"/*; do
  [[ -d "$SOURCE" ]] || continue
  NAME="$(basename "$SOURCE")"
  TARGET="$TARGET_ROOT/$NAME"
  rm -rf "$TARGET"
  cp -R "$SOURCE" "$TARGET"
  echo "Installed skill to: $TARGET"
done
