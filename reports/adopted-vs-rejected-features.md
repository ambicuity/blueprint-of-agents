# Adopted vs Rejected Features

Date: 2026-04-20

## Adopted (adapted)
1. Cross-platform install conventions and docs-first compatibility model (from superpowers).
2. Skill packaging conventions and metadata templates (`SKILL.md`, plugin and marketplace manifests).
3. Reusable workflow capability bundles (brainstorm/plan/execute/review) mapped into playbook language.
4. Guardrail doctrine template (think first, simplicity, surgical edits, goal-driven verification) inspired by karpathy-guidelines.
5. Provider/env capability matrix + graceful fallback and validation conventions (inspired by last30days).
6. Install safety conventions: dry-run support, explicit target paths, no destructive defaults.

## Rejected (with rationale)
1. Domain-specific scraper/research runtime from last30days.
   - Reason: out of scope for a blueprint/playbook repository.
2. Runtime-heavy orchestration internals and mandatory hooks from superpowers.
   - Reason: would conflict with target docs-first architecture.
3. Direct source-repo branding/content porting.
   - Reason: preserve target identity and maintainability.
4. Cursor as model provider abstraction.
   - Reason: inaccurate boundary; modeled as workflow tool.
