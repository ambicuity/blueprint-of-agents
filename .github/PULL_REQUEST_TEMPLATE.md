<!--
  PR TITLE -- READ BEFORE TYPING (bot will auto-reject if wrong)
  ---------------------------------------------------------------
  Format:  <type>(<scope>): <short summary, lowercase, no period>

  Types:
    feat     -- new agent or feature added
    fix      -- bug fix
    docs     -- documentation only
    chore    -- maintenance (deps, CI, housekeeping)
    refactor -- structural change that is neither a fix nor a feature

  Scopes (optional but recommended):
    engineering, design, marketing, product, project-management,
    testing, support, spatial-computing, specialized,
    playbooks, workflows, ci, docs

  Examples:
    feat(engineering): add cloud infrastructure agent
    fix(docs): correct broken link in agent roster
    docs(contributing): clarify PR title requirements
    chore(ci): pin actions/checkout to v4

  Shortcut: title the PR "@coderabbitai" and the bot renames it correctly.
-->

## Linked Issue

Fixes #

## Summary

<!-- What changed and why? One or two sentences max. -->

## Changes Made

<!-- Which files changed and why? Delete rows that do not apply. -->

| File | What changed |
|------|-------------|
| `blueprints/...` | |
| `playbooks/...` | |
| `workflows/...` | |
| Other | |

## Testing

<!-- How did you verify this locally before pushing? -->

- [ ] `pre-commit run --all-files` -- clean (if installed)
- [ ] Agent follows the template structure in CONTRIBUTING.md
- [ ] All internal links are valid

## Notes for Reviewer

<!-- Anything non-obvious about the approach? Leave blank if straightforward. -->

---

> **What is checked automatically by CI -- you do not need to self-certify these:**
>
> | Check | Enforced by |
> |-------|-------------|
> | PR title follows Conventional Commits | `bot-pr-title-check` -- auto-rejects on open |
> | PR links to an assigned issue | `bot-linked-issue-enforcer` + `bot-assignment-check` |
> | Branch is up to date with `main` | Branch protection -- merge blocked if behind |
> | Agent file structure validation | `lint-agents` -- checks frontmatter and sections |
> | Pre-commit hooks (YAML, whitespace) | `pre-commit` -- required status check |
