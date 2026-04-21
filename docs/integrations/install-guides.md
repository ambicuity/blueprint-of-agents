# Install Guides

Use the scripts in `tools/` to install and validate portable packs.

## Platform Install Matrix

This matrix mirrors common marketplace/install surfaces across major runtimes and tools.

### Claude Code Official Marketplace

- **Status**: Reference only
- **Install method**: Anthropic official plugin marketplace UI/command surface
- **Command sequence**:
```bash
/plugin install blueprint-of-agents@claude-plugins-official
```
- **Notes**: This repository does not currently publish an official marketplace plugin entry.
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target claude --pack blueprints --dry-run
./tools/install-skill-pack.sh --target claude --pack blueprints
```

### Claude Code Marketplace

- **Status**: Reference only
- **Install method**: Custom plugin marketplace registration and install
- **Command sequence**:
```bash
/plugin marketplace add ambicuity/blueprint-of-agents-marketplace
/plugin install blueprint-of-agents@blueprint-of-agents-marketplace
```
- **Notes**: Marketplace metadata is documented via templates but no live marketplace publication is provided in this repo.
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target claude --pack blueprints --dry-run
./tools/install-skill-pack.sh --target claude --pack blueprints
```

### OpenAI Codex CLI

- **Status**: Partial
- **Install method**: Plugin search UX is platform-native; this repo currently ships script-based install as canonical path.
- **Command sequence (marketplace-style reference)**:
```text
/plugins
Search for "blueprint-of-agents"
Select Install Plugin
```
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
- **Install method**: Cursor marketplace/chat plugin flow
- **Command sequence (marketplace-style reference)**:
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
- **Install method**: OpenCode plugin reference flow
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
- **Install method**: Copilot plugin marketplace commands
- **Command sequence (reference)**:
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
- **Install method**: Gemini extensions install/update flow
- **Command sequence (marketplace-style reference)**:
```bash
gemini extensions install https://github.com/ambicuity/blueprint-of-agents
gemini extensions update blueprint-of-agents
```
- **Fallback (canonical)**:
```bash
./tools/install-skill-pack.sh --target gemini --pack templates --dry-run
./tools/install-skill-pack.sh --target gemini --pack templates
```

## Compatibility and Limitations

| Topic | Clarification |
|---|---|
| Marketplace availability | Runtime-specific and may require publication outside this repository. |
| Cursor classification | Cursor is workflow tooling, not a model provider. |
| Canonical install path | `tools/install-skill-pack.sh` remains the canonical fallback install mechanism. |

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
