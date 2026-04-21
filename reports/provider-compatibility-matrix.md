# Provider Compatibility Matrix

Date: 2026-04-20

| Name | Class | Required env | Optional env | Supported in this repo |
|---|---|---|---|---|
| Claude (Anthropic) | model-provider | `ANTHROPIC_API_KEY` | `ANTHROPIC_MODEL` | Yes |
| Gemini | model-provider | `GOOGLE_API_KEY` | `GEMINI_MODEL` | Yes |
| OpenAI-compatible | model-provider | `OPENAI_API_KEY` | `OPENAI_BASE_URL`, `OPENAI_MODEL` | Yes |
| Cursor | workflow-tool | none | `CURSOR_RULES_DIR` | Yes (workflow/rules integration) |
| Claude Code | runtime | none | `CLAUDE_HOME` | Yes |
| Codex CLI | runtime | none | `CODEX_HOME`, `AGENTS_SKILLS_DIR` | Yes |
| Gemini CLI | runtime | none | `GEMINI_EXTENSION_DIR` | Yes |
| OpenCode | runtime | none | `OPENCODE_CONFIG_DIR` | Yes |

## Notes
- Cursor is represented as workflow tooling, not a model API provider.
- Missing provider keys should degrade gracefully to docs-only and alternative providers.
- Validation checks live in `tools/validate-integration.sh`.
