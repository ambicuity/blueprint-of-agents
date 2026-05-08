#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT_DIR/manifests/installable-packs.yaml"

blueprint_count=$(find "$ROOT_DIR/blueprints" -mindepth 2 -maxdepth 2 -type f -name '*.md' | wc -l | tr -d ' ')
playbook_count=$(find "$ROOT_DIR/playbooks" -type f -name '*.md' | wc -l | tr -d ' ')
workflow_count=$(find "$ROOT_DIR/workflows" -type f -name '*.md' | wc -l | tr -d ' ')

cat > "$OUT" <<YAML
version: 1
updated_at: $(date +%Y-%m-%d)
generated_by: tools/build-installable-index.sh
packs:
  - id: blueprint-library
    name: Blueprint Library
    stats:
      blueprints: $blueprint_count
    source_paths:
      - blueprints/
    install_modes: [copy]

  - id: orchestration-playbooks
    name: Orchestration Playbooks
    stats:
      playbook_docs: $playbook_count
      workflow_docs: $workflow_count
    source_paths:
      - playbooks/
      - workflows/
    install_modes: [reference, copy]

  - id: portable-skill-templates
    name: Portable Skill Templates
    source_paths:
      - templates/skills/
    install_modes: [copy]
YAML

echo "Wrote $OUT"
