---
title: Blueprint Schema Standard
summary: Canonical structure and quality standard for all agent blueprint files.
audience: [maintainer, contributor]
status: stable
last_reviewed: 2026-04-21
tags: [standards, blueprint, schema]
related:
  - ../../CONTRIBUTING.md
  - ../../tools/lint-agents.sh
---

## Required frontmatter

```yaml
---
name: Agent Name
description: One-line capability summary
color: blue
---
```

## Required body structure

1. `# Agent Name`
2. `## When To Use`
3. `## Core Mission`
4. `## Workflow`
5. `## Success Metrics`

## Recommended sections

- `## Inputs Required`
- `## Output Contract`
- `## Guardrails`
- `## Activation Prompt`
- `## Example Output`
- `## Handoff Instructions`

## Content rules

- Keep role identity consistent with filename and frontmatter.
- Use concrete outputs and measurable success criteria.
- Avoid non-portable references to files that do not exist in this repository.
- Avoid unsupported quantitative claims unless source-backed.
