#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
errors=0
warnings=0

require_file() {
  local path="$1"
  if [[ ! -f "$ROOT_DIR/$path" ]]; then
    echo "ERROR missing file: $path"
    errors=$((errors + 1))
  fi
}

for f in \
  "docs/integrations/README.md" \
  "docs/integrations/agent-provider-taxonomy.md" \
  "docs/integrations/provider-compatibility.md" \
  "docs/integrations/install-guides.md" \
  "docs/integrations/workflow-capability-bundles.md" \
  "templates/skills/SKILL.template.md" \
  "templates/skills/plugin.template.json" \
  "templates/skills/marketplace.template.json" \
  "templates/skills/guardrails-karpathy.template.md" \
  "manifests/installable-packs.yaml" \
  ".env.example" \
  "reports/provider-compatibility-matrix.md" \
  "reports/adopted-vs-rejected-features.md" \
  "reports/final-integration-summary.md" \
  "reports/worklog.md"; do
  require_file "$f"
done

# Validate expected env keys from compatibility docs exist in .env.example
if [[ -f "$ROOT_DIR/docs/integrations/provider-compatibility.md" && -f "$ROOT_DIR/.env.example" ]]; then
  for key in ANTHROPIC_API_KEY GOOGLE_API_KEY OPENAI_API_KEY OPENAI_BASE_URL OPENAI_MODEL CURSOR_RULES_DIR CODEX_HOME AGENTS_SKILLS_DIR GEMINI_EXTENSION_DIR OPENCODE_CONFIG_DIR; do
    if ! rg -q "^${key}=" "$ROOT_DIR/.env.example"; then
      echo "ERROR missing env key in .env.example: $key"
      errors=$((errors + 1))
    fi
  done
fi

# Sanity-check manifest has required top-level keys
if [[ -f "$ROOT_DIR/manifests/installable-packs.yaml" ]]; then
  if ! rg -q "^version:" "$ROOT_DIR/manifests/installable-packs.yaml"; then
    echo "ERROR manifests/installable-packs.yaml missing 'version'"
    errors=$((errors + 1))
  fi
  if ! rg -q "^packs:" "$ROOT_DIR/manifests/installable-packs.yaml"; then
    echo "ERROR manifests/installable-packs.yaml missing 'packs'"
    errors=$((errors + 1))
  fi
fi

# Link/reference smoke checks
if ! rg -q "docs/integrations/README.md" "$ROOT_DIR/README.md"; then
  echo "WARN README.md does not link docs/integrations/README.md"
  warnings=$((warnings + 1))
fi

# Platform install matrix contract checks
if [[ -f "$ROOT_DIR/docs/integrations/install-guides.md" ]]; then
  for heading in \
    "### Claude Code Official Marketplace" \
    "### Claude Code Marketplace" \
    "### OpenAI Codex CLI" \
    "### OpenAI Codex App" \
    "### Cursor (Plugin Marketplace)" \
    "### OpenCode" \
    "### GitHub Copilot CLI" \
    "### Gemini CLI"; do
    if ! rg -F -q "${heading}" "$ROOT_DIR/docs/integrations/install-guides.md"; then
      echo "ERROR missing platform section in install guide: $heading"
      errors=$((errors + 1))
    fi
  done

  if ! rg -q "^## Compatibility and Limitations$" "$ROOT_DIR/docs/integrations/install-guides.md"; then
    echo "ERROR docs/integrations/install-guides.md missing 'Compatibility and Limitations' section"
    errors=$((errors + 1))
  fi

  # canonical fallback mechanism must be referenced
  if ! rg -q "tools/install-skill-pack.sh" "$ROOT_DIR/docs/integrations/install-guides.md"; then
    echo "ERROR docs/integrations/install-guides.md missing fallback reference to tools/install-skill-pack.sh"
    errors=$((errors + 1))
  fi
fi

echo "Validation results: ${errors} error(s), ${warnings} warning(s)."
if [[ "$errors" -gt 0 ]]; then
  exit 1
fi
