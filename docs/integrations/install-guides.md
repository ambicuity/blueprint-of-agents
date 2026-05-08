# Install Guides

Use the scripts in `tools/` to install and validate portable packs.

Last reviewed: 2026-05-08

## Platform Install Matrix

This matrix separates verified local install paths from marketplace-style references. The canonical path for this repository is always the script-based installer because the repo does not currently publish a live marketplace listing for every runtime.

### Claude Code Official Marketplace

- **Status**: Reference only
- **Install method**: Use Claude Code's supported local surfaces: custom agents, custom slash commands, MCP servers, and project/user configuration.
- **Command sequence (placeholder only)**:
```bash
/plugin install blueprint-of-agents@claude-plugins-official
```
- **Notes**: This repository does not currently publish an Anthropic official marketplace plugin entry. Do not present the placeholder command as a verified live install command.
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target claude --pack blueprints --dry-run
./tools/install-skill-pack.sh --target claude --pack blueprints
```

### Claude Code Marketplace

- **Status**: Reference only
- **Install method**: Community/custom marketplace registration, if a registry is created later.
- **Command sequence (placeholder only)**:
```bash
/plugin marketplace add ambicuity/blueprint-of-agents-marketplace
/plugin install blueprint-of-agents@blueprint-of-agents-marketplace
```
- **Notes**: Marketplace metadata is documented via templates, but no live marketplace publication is provided in this repo.
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target claude --pack blueprints --dry-run
./tools/install-skill-pack.sh --target claude --pack blueprints
```

### OpenAI Codex CLI

- **Status**: Partial
- **Install method**: Codex supports skills and plugins as platform-native extension surfaces. This repo currently ships script-based skill/template install as the canonical path.
- **Command sequence (app/CLI reference only)**:
```text
/plugins
Search for "blueprint-of-agents"
Select Install Plugin
```
- **Notes**: Use the in-product plugin library only after a `blueprint-of-agents` listing exists. Until then, install the portable skill templates locally.
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target codex --pack templates --dry-run
./tools/install-skill-pack.sh --target codex --pack templates
```

### OpenAI Codex App

- **Status**: Reference only
- **Install method**: App plugin sidebar flow
- **UI flow**:
1. Open Plugins in the Codex app sidebar.
2. Find `blueprint-of-agents` in the coding section.
3. Click `+` to install.
- **Notes**: Listed for parity with platform coverage; canonical repo flow remains script-based.
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target codex --pack templates --dry-run
./tools/install-skill-pack.sh --target codex --pack templates
```

### Cursor (Plugin Marketplace)

- **Status**: Partial
- **Install method**: Cursor rules/workflow install is the supported local path in this repo. Marketplace/chat plugin flow is listed only as a future distribution reference.
- **Command sequence (placeholder only)**:
```text
/add-plugin blueprint-of-agents
```
- **Notes**: Cursor is modeled as workflow tooling, not a model provider.
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target cursor --pack guardrails --dry-run
./tools/install-skill-pack.sh --target cursor --pack guardrails
```

### OpenCode

- **Status**: Partial
- **Install method**: Local skills/config install through this repository's portable script.
- **Command sequence (reference)**:
```text
Fetch and follow instructions from https://raw.githubusercontent.com/ambicuity/blueprint-of-agents/main/docs/integrations/install-guides.md
```
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target opencode --pack templates --dry-run
./tools/install-skill-pack.sh --target opencode --pack templates
```

### GitHub Copilot CLI

- **Status**: Reference only
- **Install method**: Copilot plugin marketplace commands, if a compatible marketplace target is published later.
- **Command sequence (placeholder only)**:
```bash
copilot plugin marketplace add ambicuity/blueprint-of-agents-marketplace
copilot plugin install blueprint-of-agents@blueprint-of-agents-marketplace
```
- **Notes**: Marketplace publication is not currently provided by this repository.
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target codex --pack templates --dry-run
./tools/install-skill-pack.sh --target codex --pack templates
```

### Gemini CLI

- **Status**: Partial
- **Install method**: Gemini extensions can install from GitHub or local paths. This repo's script currently installs portable skill templates into the Gemini extension directory.
- **Command sequence (GitHub extension reference)**:
```bash
gemini extensions install https://github.com/ambicuity/blueprint-of-agents
gemini extensions update blueprint-of-agents
```
- **Notes**: A proper Gemini extension requires a valid extension manifest at the installed extension root. Use the fallback until this repository publishes a complete Gemini extension package.
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target gemini --pack templates --dry-run
./tools/install-skill-pack.sh --target gemini --pack templates
```

## Compatibility and Limitations

| Topic | Clarification |
|---|---|
| Marketplace availability | Runtime-specific and requires publication outside this repository before placeholder commands are valid. |
| Cursor classification | Cursor is workflow tooling, not a model provider. |
| Canonical install path | `tools/install-skill-pack.sh` remains the canonical fallback install mechanism. |
| 2026 extension pattern | Modern agent runtimes increasingly package skills, prompts, MCP servers, commands, and app connectors together; this repo keeps those pieces portable and script-installable. |
| Verification standard | Prefer official runtime docs and a dry-run/smoke-test before documenting any command as live. |

## 1) Validate integration files

```bash
./tools/validate-integration.sh
```

## 2) Preview install actions (dry-run)

```bash
./tools/install-skill-pack.sh --target claude --pack blueprints --dry-run
./tools/install-skill-pack.sh --target codex --pack templates --dry-run
./tools/install-skill-pack.sh --target gemini --pack templates --dry-run
./tools/install-skill-pack.sh --target cursor --pack guardrails --dry-run
./tools/install-skill-pack.sh --target opencode --pack templates --dry-run
```

## 3) Run install

```bash
./tools/install-skill-pack.sh --target claude --pack blueprints
```

## 4) Run smoke tests with isolated HOME

```bash
./tools/smoke-test-install.sh
```

## Install targets

- `claude`: installs blueprint markdown files into `~/.claude/agents/blueprint-of-agents/`
- `codex`: installs templates into `~/.agents/skills/blueprint-of-agents/`
- `gemini`: installs templates into `${GEMINI_EXTENSION_DIR:-~/.gemini/extensions/blueprint-of-agents}/skills/`
- `cursor`: installs guardrail rules into `${CURSOR_RULES_DIR:-~/.cursor/rules}/`
- `opencode`: installs templates into `${OPENCODE_CONFIG_DIR:-~/.config/opencode}/skills/blueprint-of-agents/`

## Safety defaults

- Dry-run is explicit and supported for every action.
- No destructive actions are performed.
- Existing files are not removed by installer scripts.
