#!/usr/bin/env bash

# Lint blueprint markdown files against the repository schema baseline.
#
# Enforced (errors):
# 1) YAML frontmatter exists and includes: name, description, color
# 2) H1-style title exists in body (warning)
#
# Reported (warnings):
# 1) Missing required schema sections:
#    - When To Use
#    - Core Mission
#    - Workflow
#    - Success Metrics
# 2) Very short body (< 50 words)
#
# Usage:
#   ./tools/lint-agents.sh [file ...]
#   ./tools/lint-agents.sh --changed

set -euo pipefail

REQUIRED_FRONTMATTER=("name" "description" "color")
REQUIRED_SCHEMA_SECTIONS=("When To Use" "Core Mission" "Workflow" "Success Metrics")

errors=0
warnings=0

lint_file() {
  local file="$1"

  if [[ ! -f "$file" ]]; then
    return
  fi

  if [[ "$(head -1 "$file")" != "---" ]]; then
    echo "ERROR $file: missing frontmatter opening '---'"
    errors=$((errors + 1))
    return
  fi

  local fm_end
  fm_end=$(awk 'NR>1 && /^---$/ {print NR; exit}' "$file")
  if [[ -z "$fm_end" ]]; then
    echo "ERROR $file: missing frontmatter closing '---'"
    errors=$((errors + 1))
    return
  fi

  local frontmatter
  frontmatter=$(sed -n "2,$((fm_end - 1))p" "$file")
  if [[ -z "$frontmatter" ]]; then
    echo "ERROR $file: empty frontmatter"
    errors=$((errors + 1))
    return
  fi

  for field in "${REQUIRED_FRONTMATTER[@]}"; do
    if ! grep -qE "^${field}:" <<<"$frontmatter"; then
      echo "ERROR $file: missing frontmatter field '${field}'"
      errors=$((errors + 1))
    fi
  done

  local body
  body=$(tail -n +"$((fm_end + 1))" "$file")

  if ! grep -qE "^# " <<<"$body"; then
    # Backward-compatible fallback for legacy blueprint format.
    if ! grep -qE "^[[:space:]]*[A-Za-z].*Agent" <<<"$body"; then
      echo "WARN  $file: missing explicit H1 heading in body"
      warnings=$((warnings + 1))
    fi
  fi

  for section in "${REQUIRED_SCHEMA_SECTIONS[@]}"; do
    if ! grep -qiE "^## +${section}$" <<<"$body"; then
      echo "WARN  $file: missing schema section '${section}'"
      warnings=$((warnings + 1))
    fi
  done

  if [[ "$(wc -w <<<"$body" | tr -d ' ')" -lt 50 ]]; then
    echo "WARN  $file: body seems very short (< 50 words)"
    warnings=$((warnings + 1))
  fi
}

collect_files() {
  if [[ "${1-}" == "--changed" ]]; then
    git diff --name-only --diff-filter=ACMR origin/main -- 'blueprints/**/*.md' | sed '/^$/d'
    return
  fi

  if [[ "$#" -gt 0 ]]; then
    printf '%s\n' "$@"
    return
  fi

  find blueprints -mindepth 2 -maxdepth 2 -type f -name "*.md" | sort
}

files=()
while IFS= read -r line; do
  files+=("$line")
done < <(collect_files "$@")

if [[ "${#files[@]}" -eq 0 ]]; then
  echo "No blueprint markdown files found."
  exit 0
fi

echo "Linting ${#files[@]} blueprint file(s)..."
echo ""

for file in "${files[@]}"; do
  lint_file "$file"
done

echo ""
echo "Results: ${errors} error(s), ${warnings} warning(s)."

if [[ "$errors" -gt 0 ]]; then
  echo "FAILED: fix the errors above before merging."
  exit 1
fi

echo "PASSED"
exit 0
