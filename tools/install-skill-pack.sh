#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: $0 --target <claude|codex|gemini|cursor|opencode> --pack <blueprints|templates|guardrails|playbooks> [--dry-run]
USAGE
}

TARGET=""
PACK=""
DRY_RUN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target) TARGET="${2:-}"; shift 2 ;;
    --pack) PACK="${2:-}"; shift 2 ;;
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown arg: $1" >&2; usage; exit 1 ;;
  esac
done

if [[ -z "$TARGET" || -z "$PACK" ]]; then
  usage
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

ensure_dir() {
  local d="$1"
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] mkdir -p $d"
  else
    mkdir -p "$d"
  fi
}

copy_tree() {
  local src="$1"
  local dst="$2"
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] cp -R $src $dst"
  else
    cp -R "$src" "$dst"
  fi
}

case "$TARGET" in
  claude)
    DEST_ROOT="${CLAUDE_HOME:-$HOME/.claude}/agents/blueprint-of-agents"
    ensure_dir "$DEST_ROOT"
    case "$PACK" in
      blueprints) copy_tree "$ROOT_DIR/blueprints/." "$DEST_ROOT/" ;;
      playbooks) copy_tree "$ROOT_DIR/playbooks/." "$DEST_ROOT/playbooks/" ;;
      guardrails) ensure_dir "$DEST_ROOT/templates"; copy_tree "$ROOT_DIR/templates/skills/guardrails-karpathy.template.md" "$DEST_ROOT/templates/" ;;
      templates) ensure_dir "$DEST_ROOT/templates/skills"; copy_tree "$ROOT_DIR/templates/skills/." "$DEST_ROOT/templates/skills/" ;;
      *) echo "Unsupported pack '$PACK' for claude" >&2; exit 2 ;;
    esac
    ;;
  codex)
    DEST_ROOT="${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}/blueprint-of-agents"
    ensure_dir "$DEST_ROOT"
    case "$PACK" in
      templates) copy_tree "$ROOT_DIR/templates/skills/." "$DEST_ROOT/" ;;
      guardrails) copy_tree "$ROOT_DIR/templates/skills/guardrails-karpathy.template.md" "$DEST_ROOT/" ;;
      playbooks) copy_tree "$ROOT_DIR/playbooks/." "$DEST_ROOT/playbooks/" ;;
      blueprints) copy_tree "$ROOT_DIR/blueprints/." "$DEST_ROOT/blueprints/" ;;
      *) echo "Unsupported pack '$PACK' for codex" >&2; exit 2 ;;
    esac
    ;;
  gemini)
    DEST_ROOT="${GEMINI_EXTENSION_DIR:-$HOME/.gemini/extensions/blueprint-of-agents}/skills"
    ensure_dir "$DEST_ROOT"
    case "$PACK" in
      templates) copy_tree "$ROOT_DIR/templates/skills/." "$DEST_ROOT/" ;;
      guardrails) copy_tree "$ROOT_DIR/templates/skills/guardrails-karpathy.template.md" "$DEST_ROOT/" ;;
      playbooks) copy_tree "$ROOT_DIR/playbooks/." "$DEST_ROOT/playbooks/" ;;
      blueprints) copy_tree "$ROOT_DIR/blueprints/." "$DEST_ROOT/blueprints/" ;;
      *) echo "Unsupported pack '$PACK' for gemini" >&2; exit 2 ;;
    esac
    ;;
  cursor)
    DEST_ROOT="${CURSOR_RULES_DIR:-$HOME/.cursor/rules}"
    ensure_dir "$DEST_ROOT"
    case "$PACK" in
      guardrails)
        SRC="$ROOT_DIR/templates/skills/guardrails-karpathy.template.md"
        DST="$DEST_ROOT/blueprint-of-agents-guardrails.mdc"
        if [[ "$DRY_RUN" -eq 1 ]]; then
          echo "[dry-run] cp $SRC $DST"
        else
          cp "$SRC" "$DST"
        fi
        ;;
      *) echo "Cursor target supports only '--pack guardrails'" >&2; exit 2 ;;
    esac
    ;;
  opencode)
    DEST_ROOT="${OPENCODE_CONFIG_DIR:-$HOME/.config/opencode}/skills/blueprint-of-agents"
    ensure_dir "$DEST_ROOT"
    case "$PACK" in
      templates) copy_tree "$ROOT_DIR/templates/skills/." "$DEST_ROOT/" ;;
      guardrails) copy_tree "$ROOT_DIR/templates/skills/guardrails-karpathy.template.md" "$DEST_ROOT/" ;;
      playbooks) copy_tree "$ROOT_DIR/playbooks/." "$DEST_ROOT/playbooks/" ;;
      blueprints) copy_tree "$ROOT_DIR/blueprints/." "$DEST_ROOT/blueprints/" ;;
      *) echo "Unsupported pack '$PACK' for opencode" >&2; exit 2 ;;
    esac
    ;;
  *)
    echo "Unknown target: $TARGET" >&2
    exit 2
    ;;
esac

echo "Install completed for target='$TARGET' pack='$PACK' dry_run='$DRY_RUN'"
