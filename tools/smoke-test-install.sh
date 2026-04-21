#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_HOME="$(mktemp -d)"
trap 'rm -rf "$TMP_HOME"' EXIT

run_case() {
  local target="$1"
  local pack="$2"
  HOME="$TMP_HOME" "$ROOT_DIR/tools/install-skill-pack.sh" --target "$target" --pack "$pack" --dry-run >/dev/null
  HOME="$TMP_HOME" "$ROOT_DIR/tools/install-skill-pack.sh" --target "$target" --pack "$pack" >/dev/null
}

run_case claude blueprints
run_case codex templates
run_case gemini templates
run_case cursor guardrails
run_case opencode templates

echo "Smoke tests passed with isolated HOME=$TMP_HOME"
