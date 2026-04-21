# Agent and Provider Taxonomy

Use this taxonomy to prevent architectural ambiguity.

## Classes

| Class | Definition | Examples |
|---|---|---|
| Model Provider | Service that serves inference models via API/runtime credentials | Anthropic (Claude), Google (Gemini), OpenAI-compatible endpoints |
| Workflow Tool | IDE or operator workflow surface that invokes agents/runtimes | Cursor |
| Agent Runtime | Host environment that discovers/executes agents or skills | Claude Code, Codex CLI, Gemini CLI, OpenCode |
| Skill/Plugin System | Packaging/discovery mechanism loaded by runtimes | SKILL.md-based packs, plugin manifests |

## Non-negotiable boundaries

- Cursor is modeled as a workflow tool, not as a model API provider.
- Model providers are configured independently from workflow tooling.
- Runtime compatibility is declared separately from provider compatibility.

## Why this matters

- Enables clean migration between runtimes without changing provider contracts.
- Prevents implicit coupling between editor preferences and model backend choice.
- Keeps install scripts explicit and safe.
