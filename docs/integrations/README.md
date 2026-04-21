# Integrations

This directory defines the portable integration layer for Blueprint of Agents.

## What this adds
- Cross-agent installation guidance for Claude Code, Codex CLI, Gemini CLI, Cursor workflows, and OpenCode.
- Explicit compatibility taxonomy across model providers, workflow tools, and agent runtimes.
- Skill-pack metadata contract templates for reusable packaging.
- Docs-first install and validation scripts under `tools/`.

## Docs in this folder
- `agent-provider-taxonomy.md` - explicit boundary model
- `provider-compatibility.md` - capability matrix and fallback behavior
- `install-guides.md` - installation and validation workflows
- `workflow-capability-bundles.md` - reusable brainstorm/plan/execute/review bundle patterns

## Related assets
- `templates/skills/` - starter templates for SKILL and plugin manifests
- `manifests/installable-packs.yaml` - optional machine-readable pack index
- `.env.example` - normalized environment configuration surface
- `tools/install-skill-pack.sh`
- `tools/validate-integration.sh`
- `tools/smoke-test-install.sh`
