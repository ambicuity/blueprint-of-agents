# Provider Compatibility

This matrix separates model providers, workflow tools, and runtimes.

## Capability matrix
| Name | Class | Required env | Optional env | Supported workflows | Fallback / degradation |
|---|---|---|---|---|---|
| Claude (Anthropic) | model-provider | `ANTHROPIC_API_KEY` | `ANTHROPIC_MODEL` | Blueprint prompting, orchestration, skill usage | If missing, switch to Gemini/OpenAI-compatible where available |
| Gemini | model-provider | `GOOGLE_API_KEY` | `GEMINI_MODEL` | Blueprint prompting, orchestration, skill usage | If missing, switch to Claude/OpenAI-compatible where available |
| OpenAI-compatible | model-provider | `OPENAI_API_KEY` | `OPENAI_BASE_URL`, `OPENAI_MODEL` | Blueprint prompting, orchestration, skill usage | If missing, run docs-only flows and skip provider-dependent runs |
| Cursor | workflow-tool | none | `CURSOR_RULES_DIR` | Rules/instruction workflows, prompt execution in IDE | If absent, use CLI runtime guides directly |
| Claude Code | runtime | none | `CLAUDE_HOME` | Agent files and prompt workflows | If absent, use Codex/Gemini/OpenCode runtime setup |
| Codex CLI | runtime | none | `CODEX_HOME`, `AGENTS_SKILLS_DIR` | Skill discovery under `~/.agents/skills` | If absent, use Claude/Gemini/OpenCode setup |
| Gemini CLI | runtime | none | `GEMINI_EXTENSION_DIR` | Extension/workflow integration | If absent, use Claude/Codex/OpenCode setup |
| OpenCode | runtime | none | `OPENCODE_CONFIG_DIR` | Plugin + skills workflows | If absent, use Claude/Codex/Gemini setup |

## Validation policy
- Required env keys are validated by `tools/validate-integration.sh`.
- Missing optional env keys never hard-fail validation.
- Missing provider keys produce actionable warnings, not silent failures.
