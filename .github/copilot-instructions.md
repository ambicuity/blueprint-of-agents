# Copilot Instructions for Blueprint of Agents

## Repository Context

This is a curated collection of AI agent blueprints organized into 9 divisions under the `blueprints/` directory. Each agent is a markdown file with YAML frontmatter containing `name`, `description`, and `color` fields.

## Agent File Structure

All agent files follow this structure:
1. YAML frontmatter (`---` delimiters) with `name`, `description`, `color`
2. H1 heading: Agent name
3. Sections: Identity and Memory, Core Mission, Critical Rules, Technical Deliverables, Workflow Process, Communication Style, Learning and Memory, Success Metrics, Advanced Capabilities

## Directory Layout

- `blueprints/<division>/` -- Agent blueprint markdown files
- `playbooks/` -- Strategy, runbooks, and coordination guides
- `workflows/` -- Multi-agent workflow examples
- `tools/` -- Utility scripts (linting, validation)

## Standards

- No emoji characters anywhere in the repository
- All GitHub links point to `ambicuity/blueprint-of-agents`
- Professional tone throughout
- Conventional Commits for all commit messages
- PRs must link to an issue with `Fixes #N`

## When Adding or Modifying Agents

1. Place the agent in the correct division directory under `blueprints/`
2. Use the filename pattern: `<descriptive-name>.md` (no division prefix)
3. Include YAML frontmatter with `name`, `description`, and `color`
4. Follow the section structure of existing agents
5. Include concrete code examples and measurable success metrics
6. Update the README.md agent roster table if adding a new agent
7. Update CHANGELOG.md under `## [Unreleased]`
