# Workflow Capability Bundles

This repository keeps workflow patterns docs-first and runtime-agnostic.

## Bundle model

| Bundle | Purpose | Source inspiration | Target adaptation |
|---|---|---|---|
| Brainstorm | Clarify intent and constraints before execution | superpowers brainstorming discipline | Use playbooks + prompt templates; no runtime lock-in |
| Plan | Produce decision-complete implementation plans | superpowers writing-plans | Use `playbooks/` orchestration docs and handoff templates |
| Execute | Implement in bounded increments with verification | superpowers/subagent workflows | Use phased playbooks with explicit quality gates |
| Review | Validate correctness, quality, and readiness | superpowers review discipline + Karpathy guardrails | Use Evidence Collector + Reality Checker workflows |

## Guardrail layer

Adopted from karpathy-guidelines:
- Think before coding
- Simplicity first
- Surgical changes
- Goal-driven verification

Template: `templates/skills/guardrails-karpathy.template.md`

## Intended usage

- Treat bundles as reusable operating modes across runtimes.
- Keep behavior portable by describing intent and checks, not runtime-specific hooks.
