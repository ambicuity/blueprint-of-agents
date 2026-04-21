---
name: your-skill-name
version: "1.0.0"
description: What this skill does and when to use it
compatibility:
  runtimes: [claude-code, codex-cli, gemini-cli, opencode]
  workflow_tools: [cursor]
  model_providers: [anthropic, gemini, openai-compatible]
requirements:
  required_env: []
  optional_env: []
  required_tools: []
install:
  mode: copy
  target_paths:
    claude-code: ~/.claude/skills/your-skill-name
    codex-cli: ~/.agents/skills/your-skill-name
    gemini-cli: ~/.gemini/extensions/your-skill-name
    opencode: ~/.config/opencode/skills/your-skill-name
---

# Skill Name

## When to use
- Condition A
- Condition B

## Workflow
1. Discover context.
2. Confirm constraints.
3. Execute bounded steps.
4. Verify output explicitly.

## Success criteria
- Output is complete.
- Output is validated.
- Failures are surfaced with actionable next steps.
