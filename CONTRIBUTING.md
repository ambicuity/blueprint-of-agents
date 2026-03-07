# Contributing to Blueprint of Agents

First off -- **thank you** for taking the time to contribute.

> **TL;DR Quick Start (3 steps):**
> 1. **Find** an issue tagged [`good first issue`](https://github.com/ambicuity/blueprint-of-agents/labels/good%20first%20issue) and comment `/assign`
> 2. **Fork** the repository, create a branch, make your changes
> 3. **Submit** a PR with `Fixes #<issue-number>` in the description
>
> Full details in the sections below.

Blueprint of Agents is a curated collection of production-grade AI agent blueprints. Every contribution -- whether it is adding a new agent, improving an existing one, fixing documentation, or sharing success stories -- directly helps developers build better AI-assisted workflows.

---

## Table of Contents

1. [Ways to Contribute](#1-ways-to-contribute)
2. [The AI-Assisted Workflow](#2-the-ai-assisted-workflow)
3. [Local Development Setup](#3-local-development-setup)
4. [Full Contribution Lifecycle](#4-full-contribution-lifecycle)
5. [Agent Design Guidelines](#5-agent-design-guidelines)
6. [Project Architecture](#6-project-architecture)
7. [Branching and Commit Standards](#7-branching-and-commit-standards)
8. [Pull Request Checklist](#8-pull-request-checklist)
9. [Reporting Issues](#9-reporting-issues)
10. [Good First Issues](#10-good-first-issues)
11. [Bot Commands (Slash Commands)](#11-bot-commands-slash-commands)
12. [When Will My PR Be Merged?](#12-when-will-my-pr-be-merged)

---

## 1. Ways to Contribute

We organize work into clear tiers:

- [`good first issue`](https://github.com/ambicuity/blueprint-of-agents/labels/good%20first%20issue) -- Small, scoped, well-defined tasks. Great for your first PR.
- [`help wanted`](https://github.com/ambicuity/blueprint-of-agents/labels/help%20wanted) -- Medium complexity tasks where maintainer support is available.
- [`architecture proposal`](https://github.com/ambicuity/blueprint-of-agents/issues/new?template=architecture_proposal.yml) -- For proposing major structural changes. Discuss these before writing code.

**Non-coding contributions:**

- **Bug report** or **missing agent**: Use our [Issue Templates](https://github.com/ambicuity/blueprint-of-agents/issues/new/choose).
- **Translation**: Add a translated README (e.g. `README.zh-CN.md`).
- **Success stories**: Share how you used these agents in [Discussions](https://github.com/ambicuity/blueprint-of-agents/discussions).

---

## 2. The AI-Assisted Workflow

We are a solo-maintained repository that leverages AI to manage contributions. We use **CodeRabbit** as our Lead Architect.

To contribute to this repository, follow this workflow:

1. **Open an Issue**: Use the appropriate template or add the `plan-me` label to have CodeRabbit generate an implementation plan.
2. **Wait for the Plan**: CodeRabbit will scan the codebase and reply with a step-by-step plan.
3. **Refine the Plan**: If the plan needs adjustment, reply with `@coderabbitai clarify <your question>`.
4. **Write the Changes**: You can hand CodeRabbit's plan to Cursor, GitHub Copilot, or implement it yourself.
5. **Open a PR**: You **must** link the PR to the issue (`Fixes #123`).
6. **Auto-Title your PR**: Set the PR title to `@coderabbitai` and the bot will rename it to a correct Conventional Commit title automatically.
7. **Review Gate**: CodeRabbit will cross-examine your changes against its original plan.

---

## 3. Local Development Setup

### Prerequisites

- Git
- A text editor

### Setup

```bash
# 1. Fork the repo on GitHub, then clone YOUR fork
git clone https://github.com/<your-username>/blueprint-of-agents.git
cd blueprint-of-agents

# 2. Add upstream remote
git remote add upstream https://github.com/ambicuity/blueprint-of-agents.git
```

### Verification

```bash
# Verify remotes
git remote -v
# Expected:
# origin    https://github.com/<your-username>/blueprint-of-agents.git (fetch)
# origin    https://github.com/<your-username>/blueprint-of-agents.git (push)
# upstream  https://github.com/ambicuity/blueprint-of-agents.git (fetch)
# upstream  https://github.com/ambicuity/blueprint-of-agents.git (push)
```

---

## 4. Full Contribution Lifecycle

### Phase 1: Claiming the Issue and Alignment

**Before writing anything**, claim and understand the issue.

#### 1.1 -- Claim the issue

Comment on the issue:

```text
/assign
```

This assigns the issue to you. Do not start work until you are assigned.

#### 1.2 -- Clarify scope before working

Read the issue carefully. If anything is ambiguous, ask clarifying questions **before** starting work.

> **Rule:** The cost of a clarifying question is 5 minutes. The cost of building the wrong thing is a reverted PR.

---

### Phase 2: Git Hygiene and Local Setup

#### 2.1 -- Create a dedicated feature branch

**Never work on `main`.** Create a descriptively named branch:

```bash
git checkout -b feat/add-devops-agent
# or
git checkout -b fix/issue-42-broken-link
# or
git checkout -b docs/update-contributing-guide
```

| Prefix | When to use |
|--------|-------------|
| `feat/` | New agent or new feature |
| `fix/` | Bug fix |
| `docs/` | Documentation only |
| `chore/` | Maintenance (CI, config, etc.) |

---

### Phase 3: Development and Standards

#### 3.1 -- Agent file structure

All agent blueprints live in `blueprints/<division>/`. Follow the template structure documented in [Agent Design Guidelines](#5-agent-design-guidelines).

#### 3.2 -- Stay within scope

Do **not**:
- Rename unrelated files or reformat content you did not author.
- Fix style issues in lines you did not touch.
- Add unrelated changes "while you are in there."

#### 3.3 -- Run pre-commit hooks

```bash
pre-commit run --all-files
```

Fix any errors before committing.

---

### Phase 4: Conflict Prevention and Committing

#### 4.1 -- Fetch and rebase onto upstream

Before pushing, always sync with upstream `main`:

```bash
git fetch upstream
git rebase upstream/main
```

> **Why rebase instead of merge?** Rebasing produces a clean, linear history. Our PRs are squash-merged.

#### 4.2 -- Write atomic, logical commits

Each commit should represent one logical unit of work.

Good commit examples:

```text
feat(engineering): add cloud infrastructure agent
fix(docs): correct broken link in README agent roster
docs(contributing): add upstream remote setup instructions
```

We enforce [Conventional Commits](https://www.conventionalcommits.org/):

```text
<type>(<scope>): <short summary in imperative mood>

Types:
  feat     -- new agent or feature
  fix      -- bug fix
  docs     -- documentation only
  chore    -- maintenance (CI, config, etc.)
  refactor -- structural change that is neither a fix nor a feature
```

---

### Phase 5: Opening the Pull Request

#### 5.1 -- Push your branch

```bash
git push origin feat/add-devops-agent
```

#### 5.2 -- Open the PR against main

Open the PR against **`main`** in the upstream repository (`ambicuity/blueprint-of-agents`).

#### 5.3 -- Use the PR template

Fill out the PR description template completely.

#### 5.4 -- Link the issue

Include one of these in the PR description:

```text
Fixes #123
Closes #456
Resolves #789
```

This is a **hard requirement**. Unlinked PRs will be asked to add the link before review begins.

---

### Phase 6: Code Review and History Cleanup

#### 6.1 -- Responding to review feedback

- Respond to **every comment**, even if just to acknowledge.
- If you disagree, explain your reasoning clearly.

#### 6.2 -- Interactive rebase to squash messy commits

```bash
git rebase -i upstream/main
```

#### 6.3 -- Force-push safely

```bash
git push origin feat/add-devops-agent --force-with-lease
```

> **Never use `git push --force`** without `--lease`.

---

## 5. Agent Design Guidelines

### Agent File Structure

Every agent blueprint must follow this structure:

```markdown
---
name: Agent Name
description: One-line description of the agent's specialty
color: colorname or "#hexcode"
---

# Agent Name

## Your Identity and Memory
- **Role**: Clear role description
- **Personality**: Personality traits and communication style
- **Memory**: What the agent remembers and learns
- **Experience**: Domain expertise and perspective

## Your Core Mission
- Primary responsibility 1 with clear deliverables
- Primary responsibility 2 with clear deliverables
- **Default requirement**: Always-on best practices

## Critical Rules You Must Follow
Domain-specific rules and constraints

## Your Technical Deliverables
Concrete examples: code samples, templates, frameworks

## Your Workflow Process
1. Phase 1: Discovery and research
2. Phase 2: Planning and strategy
3. Phase 3: Execution and implementation
4. Phase 4: Review and optimization

## Your Communication Style
- How the agent communicates
- Example phrases and patterns

## Learning and Memory
- Successful patterns
- Domain evolution

## Your Success Metrics
- Quantitative metrics (with numbers)
- Performance benchmarks

## Advanced Capabilities
Advanced techniques the agent masters
```

### Design Principles

1. **Strong Personality**: Give the agent a distinct voice and character. Not "I am a helpful assistant."
2. **Clear Deliverables**: Provide concrete code examples, templates, and frameworks. Show real outputs.
3. **Success Metrics**: Include specific, measurable metrics (e.g., "Page load times under 3 seconds on 3G").
4. **Proven Workflows**: Step-by-step processes that are battle-tested, not theoretical.
5. **Learning Memory**: What patterns the agent recognizes and how it improves over time.

### What Makes a Great Agent

**Great agents have:**
- Narrow, deep specialization
- Distinct personality and voice
- Concrete code/template examples
- Measurable success metrics
- Step-by-step workflows
- Real-world testing and iteration

**Avoid:**
- Generic "helpful assistant" personality
- Vague "I will help you with..." descriptions
- No code examples or deliverables
- Overly broad scope (jack of all trades)
- Untested theoretical approaches

---

## 6. Project Architecture

```text
blueprint-of-agents/
|-- blueprints/               # All agent blueprints organized by division
|   |-- engineering/           # 8 agents
|   |-- design/                # 7 agents
|   |-- marketing/             # 11 agents
|   |-- product/               # 3 agents
|   |-- project-management/    # 5 agents
|   |-- testing/               # 8 agents
|   |-- support/               # 6 agents
|   |-- spatial-computing/     # 6 agents
|   +-- specialized/           # 7 agents
|-- playbooks/                 # Strategy, runbooks, and coordination
|   |-- playbooks/             # Phased delivery playbooks (Phase 0-6)
|   |-- runbooks/              # Scenario-based runbooks
|   +-- coordination/          # Agent activation and handoff templates
|-- workflows/                 # Multi-agent workflow examples
|-- tools/                     # Utility scripts (agent linting, etc.)
|-- .github/                   # CI/CD, issue templates, PR templates
|   |-- workflows/             # GitHub Actions
|   +-- ISSUE_TEMPLATE/        # Structured issue forms
|-- CONTRIBUTING.md            # This file
|-- CODE_OF_CONDUCT.md         # Community standards
|-- SECURITY.md                # Security policy
|-- GOVERNANCE.md              # Project governance
|-- CHANGELOG.md               # Release history
+-- CONTRIBUTORS.md            # Hall of Fame
```

---

## 7. Branching and Commit Standards

We use **GitHub Flow** (trunk-based development):

1. `main` is always the latest stable version.
2. All work happens in short-lived branches created from `main`.

When your PR is merged, it will be squash-merged to maintain a single atomic commit per contribution.

---

## 8. Pull Request Checklist

Before opening a PR, confirm every item:

- [ ] I have commented `/assign` on the issue and have been officially assigned.
- [ ] I have added `upstream` as a remote.
- [ ] I am working on a feature branch -- **not** on `main`.
- [ ] I ran `git fetch upstream && git rebase upstream/main` before pushing.
- [ ] `pre-commit run --all-files` passes (if pre-commit is installed).
- [ ] My changes are scoped to the described problem -- no unrelated modifications.
- [ ] Commit messages follow the Conventional Commits format.
- [ ] The PR is linked to the issue with `Fixes #<number>` in the description.
- [ ] The PR is opened against `main` in the **upstream** repository, not my fork.
- [ ] I have updated CHANGELOG.md with my change under `## [Unreleased]`.

---

## 9. Reporting Issues

Use the structured issue templates:

- **[Bug Report](https://github.com/ambicuity/blueprint-of-agents/issues/new?template=bug_report.yml)** -- broken links, formatting issues, incorrect agent content
- **[Feature Request](https://github.com/ambicuity/blueprint-of-agents/issues/new?template=feature_request.yml)** -- suggest a new feature or improvement
- **[New Agent](https://github.com/ambicuity/blueprint-of-agents/issues/new?template=new_agent.yml)** -- propose a new agent blueprint
- **[Improve Agent](https://github.com/ambicuity/blueprint-of-agents/issues/new?template=improve_agent.yml)** -- suggest improvements to an existing agent
- **[Architecture Proposal](https://github.com/ambicuity/blueprint-of-agents/issues/new?template=architecture_proposal.yml)** -- major structural changes

> Not sure if it is an issue? Start a [Discussion](https://github.com/ambicuity/blueprint-of-agents/discussions) instead.

> **Security issues**: Please email `contact@riteshrana.engineer` -- **do not** open a public issue. See [SECURITY.md](./SECURITY.md).

---

## 10. Good First Issues

New here? Look for issues tagged:

- [`good first issue`](https://github.com/ambicuity/blueprint-of-agents/labels/good%20first%20issue) -- small, self-contained tasks
- [`help wanted`](https://github.com/ambicuity/blueprint-of-agents/labels/help%20wanted) -- medium tasks with maintainer support
- [`documentation`](https://github.com/ambicuity/blueprint-of-agents/labels/documentation) -- docs improvements (no coding required)

---

## 11. Bot Commands (Slash Commands)

Our repository uses bots to automate the contributor workflow. Post a comment on any issue:

| Command | What it does |
|---------|-------------|
| `/assign` or `.take` | Assigns the issue to you and marks it as in-progress |
| `/working` | Tells the bot you are still actively working (resets inactivity timer) |
| `/need help` | Pings the maintainer and adds a `help-needed` label |
| `/unassign` | Removes yourself from the issue so someone else can pick it up |

### How the lifecycle works

1. **Claim an issue** -- Comment `/assign` on any unassigned issue.
2. **Work on it** -- You have 7 days to open a PR. If you need more time, comment `/working`.
3. **Stuck?** -- Comment `/need help` and a maintainer will assist you.
4. **Life happens?** -- Comment `/unassign` to gracefully step away. No hard feelings.
5. **Went silent?** -- After 2 days of inactivity, the bot will check in. After 7 days with no response, it will gently unassign you so someone else can help.

---

## 12. When Will My PR Be Merged?

The maintainer (`@ambicuity`) merges PRs manually after reviewing. Here is the decision matrix:

### Ready to Merge -- all of the following must be true:

| Check | Required? |
|-------|-----------|
| All required CI checks are green | Yes |
| At least one maintainer approval (`@ambicuity`) | Yes |
| PR body contains `Fixes #N` / `Closes #N` | Yes |
| PR title follows Conventional Commits format | Yes |
| No merge conflicts with `main` | Yes |
| PR has been open at least 24 hours (except trivial fixes) | Yes |

### Hard Blockers -- Do NOT merge:

| Failing Check | Why It Blocks |
|---------------|---------------|
| Agent Lint | Structural issues in agent blueprint files |
| Pre-commit | Malformed YAML, whitespace, merge conflict markers |
| PR Title Check | PR cannot be auto-merged without a clean commit message |
| Linked Issue Enforcer | Every community PR must be tied to a tracked issue |
| Merge conflict | Cannot squash-merge a conflicted PR |

### Auto-Merge (Dependabot)

Dependabot patch and minor updates are automatically approved and squash-merged once all CI checks pass. Major version bumps require explicit maintainer review.

---

## Contributors

Every contribution is recognized. When your PR is merged, you will be added to our [Contributors Hall of Fame](./CONTRIBUTORS.md).

---

Thank you for helping build a better collection of AI agent blueprints. Every contribution matters.
