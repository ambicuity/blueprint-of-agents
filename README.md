# Blueprint of Agents

Production-grade AI agent blueprints you can adopt in minutes.

Blueprint of Agents is a Markdown-first library of specialized agent roles, orchestration playbooks, and reusable workflows for teams using [Claude Code](https://docs.anthropic.com/en/docs/build-with-claude/code), [Cursor](https://cursor.sh), and other coding assistants.

- 61 agents across 9 divisions
- Ready-to-copy activation prompts
- Practical workflows for MVPs, launches, and incident response

---

## Start in 2 Minutes

Choose one path:

1. **Use one specialist**
   - Browse the [Blueprint Catalog](blueprints/README.md)
   - Copy one activation prompt from that blueprint
2. **Run a proven workflow**
   - Start with the [Startup MVP workflow](workflows/workflow-startup-mvp.md)
3. **Run full orchestration**
   - Use the [Orchestration Framework](playbooks/orchestration-framework.md)

If you only do one thing now, start with path 2.

Need onboarding help? Start at [docs/start-here.md](docs/start-here.md).

---

## Table of Contents

1. [Start in 2 Minutes](#start-in-2-minutes)
2. [What Is This?](#what-is-this)
3. [Quick Start](#quick-start)
4. [Multi-Agent Integration](#multi-agent-integration)
5. [Agent Roster](#agent-roster)
6. [Real-World Use Cases](#real-world-use-cases)
7. [Agent Design Philosophy](#agent-design-philosophy)
8. [Playbooks and Strategy](#playbooks-and-strategy)
9. [Contributing](#contributing)
10. [Roadmap](#roadmap)
11. [License](#license)
12. [Community](#community)

---

## What Is This?

Blueprint of Agents is a growing collection of production-grade AI agent personalities. Each agent is:

- **Specialized**: Deep expertise in a specific domain (not generic prompt templates)
- **Personality-Driven**: A unique voice, communication style, and approach to problem-solving
- **Deliverable-Focused**: Produces real code, processes, templates, and measurable outcomes
- **Production-Ready**: Battle-tested workflows, success metrics, and quality standards

Think of it as assembling your ideal engineering team -- except each specialist is an AI agent that integrates directly into your development workflow.

---

## Quick Start

### Option 1: Use with Claude Code (Recommended)

```bash
# Clone the repository
git clone https://github.com/ambicuity/blueprint-of-agents.git

# Copy agent blueprints to your Claude Code agents directory
cp -r blueprint-of-agents/blueprints/* ~/.claude/agents/

# Activate any agent in your Claude Code session:
# "Activate Frontend Developer mode and help me build a React component"
```

### Option 2: Use as Reference

Each agent file contains:

- Identity and personality traits
- Core mission and workflows
- Technical deliverables with code examples
- Success metrics and communication style

Browse the agents below and copy or adapt the ones you need.

---

## Multi-Agent Integration

This repository now includes an additive integration layer for multi-runtime and multi-provider workflows.

### Quick links
- [Integration Docs](docs/integrations/README.md)
- [Install Guides](docs/integrations/install-guides.md)
- [Platform Install Matrix](docs/integrations/install-guides.md#platform-install-matrix)
- [Provider Compatibility Matrix](reports/provider-compatibility-matrix.md)
- [Installable Pack Index](manifests/installable-packs.yaml)

### Runtime targets
- Claude Code
- Codex CLI
- Gemini CLI
- Cursor (workflow/rules integration)
- OpenCode
- Plus documented marketplace-style reference coverage for Codex App and Copilot CLI.

### Provider model
- Model providers: Anthropic (Claude), Gemini, OpenAI-compatible APIs
- Workflow tools: Cursor
- Runtimes: Claude Code, Codex CLI, Gemini CLI, OpenCode

### Validate and smoke-test
```bash
./tools/validate-integration.sh
./tools/smoke-test-install.sh
```

### Migration note
- Existing `cp -r blueprint-of-agents/blueprints/* ~/.claude/agents/` workflow remains valid and supported.

### Install with dry-run first
```bash
./tools/install-skill-pack.sh --target claude --pack blueprints --dry-run
./tools/install-skill-pack.sh --target codex --pack templates --dry-run
```

---

## Agent Roster

### Engineering Division

Building the future, one commit at a time.

| Agent | Blueprint |
|-------|-----------|
| Frontend Developer | [frontend-developer.md](blueprints/engineering/frontend-developer.md) |
| Backend Architect | [backend-architect.md](blueprints/engineering/backend-architect.md) |
| Mobile App Builder | [mobile-app-builder.md](blueprints/engineering/mobile-app-builder.md) |
| AI Engineer | [ai-engineer.md](blueprints/engineering/ai-engineer.md) |
| DevOps Automator | [devops-automator.md](blueprints/engineering/devops-automator.md) |
| Rapid Prototyper | [rapid-prototyper.md](blueprints/engineering/rapid-prototyper.md) |
| Senior Developer | [senior-developer.md](blueprints/engineering/senior-developer.md) |
| Security Engineer | [security-engineer.md](blueprints/engineering/security-engineer.md) |

---

### Design Division

Making it beautiful, usable, and delightful.

| Agent | Blueprint |
|-------|-----------|
| UI Designer | [ui-designer.md](blueprints/design/ui-designer.md) |
| UX Researcher | [ux-researcher.md](blueprints/design/ux-researcher.md) |
| UX Architect | [ux-architect.md](blueprints/design/ux-architect.md) |
| Brand Guardian | [brand-guardian.md](blueprints/design/brand-guardian.md) |
| Visual Storyteller | [visual-storyteller.md](blueprints/design/visual-storyteller.md) |
| Whimsy Injector | [whimsy-injector.md](blueprints/design/whimsy-injector.md) |
| Image Prompt Engineer | [image-prompt-engineer.md](blueprints/design/image-prompt-engineer.md) |

---

### Marketing Division

Growing your audience, one authentic interaction at a time.

| Agent | Blueprint |
|-------|-----------|
| Growth Hacker | [growth-hacker.md](blueprints/marketing/growth-hacker.md) |
| Content Creator | [content-creator.md](blueprints/marketing/content-creator.md) |
| Twitter Engager | [twitter-engager.md](blueprints/marketing/twitter-engager.md) |
| TikTok Strategist | [tiktok-strategist.md](blueprints/marketing/tiktok-strategist.md) |
| Instagram Curator | [instagram-curator.md](blueprints/marketing/instagram-curator.md) |
| Reddit Community Builder | [reddit-community-builder.md](blueprints/marketing/reddit-community-builder.md) |
| App Store Optimizer | [app-store-optimizer.md](blueprints/marketing/app-store-optimizer.md) |
| Social Media Strategist | [social-media-strategist.md](blueprints/marketing/social-media-strategist.md) |
| Xiaohongshu Specialist | [xiaohongshu-specialist.md](blueprints/marketing/xiaohongshu-specialist.md) |
| WeChat Official Account Manager | [wechat-official-account.md](blueprints/marketing/wechat-official-account.md) |
| Zhihu Strategist | [zhihu-strategist.md](blueprints/marketing/zhihu-strategist.md) |

---

### Product Division

Building the right thing at the right time.

| Agent | Blueprint |
|-------|-----------|
| Sprint Prioritizer | [sprint-prioritizer.md](blueprints/product/sprint-prioritizer.md) |
| Trend Researcher | [trend-researcher.md](blueprints/product/trend-researcher.md) |
| Feedback Synthesizer | [feedback-synthesizer.md](blueprints/product/feedback-synthesizer.md) |

---

### Project Management Division

Keeping projects on track, on time, and under budget.

| Agent | Blueprint |
|-------|-----------|
| Studio Producer | [studio-producer.md](blueprints/project-management/studio-producer.md) |
| Project Shepherd | [project-shepherd.md](blueprints/project-management/project-shepherd.md) |
| Studio Operations | [studio-operations.md](blueprints/project-management/studio-operations.md) |
| Experiment Tracker | [experiment-tracker.md](blueprints/project-management/experiment-tracker.md) |
| Senior Project Manager | [project-manager-senior.md](blueprints/project-management/project-manager-senior.md) |

---

### Testing Division

Breaking things so users do not have to.

| Agent | Blueprint |
|-------|-----------|
| Evidence Collector | [evidence-collector.md](blueprints/testing/evidence-collector.md) |
| Reality Checker | [reality-checker.md](blueprints/testing/reality-checker.md) |
| Test Results Analyzer | [test-results-analyzer.md](blueprints/testing/test-results-analyzer.md) |
| Performance Benchmarker | [performance-benchmarker.md](blueprints/testing/performance-benchmarker.md) |
| API Tester | [api-tester.md](blueprints/testing/api-tester.md) |
| Tool Evaluator | [tool-evaluator.md](blueprints/testing/tool-evaluator.md) |
| Workflow Optimizer | [workflow-optimizer.md](blueprints/testing/workflow-optimizer.md) |
| Accessibility Auditor | [accessibility-auditor.md](blueprints/testing/accessibility-auditor.md) |

---

### Support Division

The backbone of the operation.

| Agent | Blueprint |
|-------|-----------|
| Support Responder | [support-responder.md](blueprints/support/support-responder.md) |
| Analytics Reporter | [analytics-reporter.md](blueprints/support/analytics-reporter.md) |
| Finance Tracker | [finance-tracker.md](blueprints/support/finance-tracker.md) |
| Infrastructure Maintainer | [infrastructure-maintainer.md](blueprints/support/infrastructure-maintainer.md) |
| Legal Compliance Checker | [legal-compliance-checker.md](blueprints/support/legal-compliance-checker.md) |
| Executive Summary Generator | [executive-summary-generator.md](blueprints/support/executive-summary-generator.md) |

---

### Spatial Computing Division

Building the immersive future.

| Agent | Blueprint |
|-------|-----------|
| XR Interface Architect | [xr-interface-architect.md](blueprints/spatial-computing/xr-interface-architect.md) |
| macOS Spatial/Metal Engineer | [macos-spatial-metal-engineer.md](blueprints/spatial-computing/macos-spatial-metal-engineer.md) |
| XR Immersive Developer | [xr-immersive-developer.md](blueprints/spatial-computing/xr-immersive-developer.md) |
| XR Cockpit Interaction Specialist | [xr-cockpit-interaction-specialist.md](blueprints/spatial-computing/xr-cockpit-interaction-specialist.md) |
| visionOS Spatial Engineer | [visionos-spatial-engineer.md](blueprints/spatial-computing/visionos-spatial-engineer.md) |
| Terminal Integration Specialist | [terminal-integration-specialist.md](blueprints/spatial-computing/terminal-integration-specialist.md) |

---

### Specialized Division

Unique specialists who do not fit in a single category.

| Agent | Blueprint |
|-------|-----------|
| Agents Orchestrator | [agents-orchestrator.md](blueprints/specialized/agents-orchestrator.md) |
| Data Analytics Reporter | [data-analytics-reporter.md](blueprints/specialized/data-analytics-reporter.md) |
| LSP/Index Engineer | [lsp-index-engineer.md](blueprints/specialized/lsp-index-engineer.md) |
| Sales Data Extraction Agent | [sales-data-extraction-agent.md](blueprints/specialized/sales-data-extraction-agent.md) |
| Data Consolidation Agent | [data-consolidation-agent.md](blueprints/specialized/data-consolidation-agent.md) |
| Report Distribution Agent | [report-distribution-agent.md](blueprints/specialized/report-distribution-agent.md) |
| Agentic Identity and Trust Architect | [agentic-identity-trust.md](blueprints/specialized/agentic-identity-trust.md) |

---

## Real-World Use Cases

### Scenario 1: Building a Startup MVP

**Your Team:**

1. **Frontend Developer** -- Build the React application
2. **Backend Architect** -- Design the API and database layer
3. **Growth Hacker** -- Plan user acquisition strategy
4. **Rapid Prototyper** -- Fast iteration cycles
5. **Reality Checker** -- Quality verification before launch

**Result:** Ship faster with specialized expertise at every stage.

### Scenario 2: Marketing Campaign Launch

**Your Team:**

1. **Content Creator** -- Develop campaign content
2. **Twitter Engager** -- Twitter strategy and execution
3. **Instagram Curator** -- Visual content and stories
4. **Reddit Community Builder** -- Authentic community engagement
5. **Analytics Reporter** -- Track and optimize performance

**Result:** Multi-channel coordinated campaign with platform-specific expertise.

### Scenario 3: Enterprise Feature Development

**Your Team:**

1. **Senior Project Manager** -- Scope and task planning
2. **Senior Developer** -- Complex implementation
3. **UI Designer** -- Design system and components
4. **Experiment Tracker** -- A/B test planning
5. **Evidence Collector** -- Quality verification
6. **Reality Checker** -- Production readiness

**Result:** Enterprise-grade delivery with quality gates and documentation.

### Scenario 4: Full-Stack Product Discovery

See the [Orchestration Framework Spatial Discovery Exercise](workflows/spatial-discovery-exercise.md) for a complete example where 8 agents were deployed simultaneously to evaluate a software opportunity and produce a unified product plan covering market validation, technical architecture, brand strategy, go-to-market, support systems, UX research, project execution, and spatial UI design.

More examples are available in the [workflows/](workflows/) directory.

---

## Agent Design Philosophy

Each agent is designed with:

1. **Strong Personality**: Not generic templates -- real character and voice that shapes how the agent approaches problems
2. **Clear Deliverables**: Concrete outputs including code, templates, and documents -- not vague guidance
3. **Success Metrics**: Measurable outcomes and quality standards that define what "done" looks like
4. **Proven Workflows**: Step-by-step processes tested in real-world scenarios
5. **Learning Memory**: Pattern recognition and continuous improvement across sessions

---

## Playbooks and Strategy

The [playbooks/](playbooks/) directory contains comprehensive operational guides:

- **[Executive Brief](playbooks/EXECUTIVE-BRIEF.md)** -- High-level overview for decision-makers
- **[Quick Start Guide](playbooks/QUICKSTART.md)** -- Get started in minutes
- **[Orchestration Framework Strategy](playbooks/orchestration-framework.md)** -- Multi-agent orchestration framework
- **[Playbooks Index](playbooks/index.md)** -- Navigation by phase and scenario

### Phased Delivery Playbooks

| Phase | Document |
|-------|----------|
| Phase 0: Discovery | [phase-0-discovery.md](playbooks/playbooks/phase-0-discovery.md) |
| Phase 1: Strategy | [phase-1-strategy.md](playbooks/playbooks/phase-1-strategy.md) |
| Phase 2: Foundation | [phase-2-foundation.md](playbooks/playbooks/phase-2-foundation.md) |
| Phase 3: Build | [phase-3-build.md](playbooks/playbooks/phase-3-build.md) |
| Phase 4: Hardening | [phase-4-hardening.md](playbooks/playbooks/phase-4-hardening.md) |
| Phase 5: Launch | [phase-5-launch.md](playbooks/playbooks/phase-5-launch.md) |
| Phase 6: Operate | [phase-6-operate.md](playbooks/playbooks/phase-6-operate.md) |

### Scenario Runbooks

| Scenario | Document |
|----------|----------|
| Startup MVP | [scenario-startup-mvp.md](playbooks/runbooks/scenario-startup-mvp.md) |
| Marketing Campaign | [scenario-marketing-campaign.md](playbooks/runbooks/scenario-marketing-campaign.md) |
| Enterprise Feature | [scenario-enterprise-feature.md](playbooks/runbooks/scenario-enterprise-feature.md) |
| Incident Response | [scenario-incident-response.md](playbooks/runbooks/scenario-incident-response.md) |

### Coordination

- [Agent Activation Prompts](playbooks/coordination/agent-activation-prompts.md)
- [Handoff Templates](playbooks/coordination/handoff-templates.md)

### Documentation Hub

- [Start Here](docs/start-here.md)
- [Choose an Agent](docs/choose-an-agent.md)
- [Blueprint Schema Standard](docs/standards/blueprint-schema.md)

---

## Contributing

We welcome contributions. See [CONTRIBUTING.md](CONTRIBUTING.md) for the full guide.

**Quick summary:**

1. **Find** an issue tagged `good first issue` and comment `/assign`
2. **Fork** the repository and create a feature branch
3. **Follow** the agent template structure (see existing agents for reference)
4. **Test** your agent in real scenarios
5. **Submit** a PR with `Fixes #<issue-number>` in the description

---

## Roadmap

- [ ] Interactive agent selector web tool
- [ ] Multi-agent workflow examples (see [workflows/](workflows/))
- [ ] Video tutorials on agent design
- [ ] Community agent marketplace
- [ ] Agent personality quiz for project matching
- [ ] Integration examples with popular tools
- [ ] Agent of the Week showcase series

---

## Stats

- 61 specialized agents across 9 divisions
- 10,000+ lines of personality, process, and code examples
- Months of iteration from real-world usage
- Battle-tested in production environments

---

## License

MIT License -- Use freely, commercially or personally. See [LICENSE](LICENSE) for full text.

---

## Community

- **GitHub Discussions**: [Share your success stories](https://github.com/ambicuity/blueprint-of-agents/discussions)
- **Issues**: [Report bugs or request features](https://github.com/ambicuity/blueprint-of-agents/issues)
- **Contributing**: [Read the guide](CONTRIBUTING.md)
- **Support**: [Get help and support channels](.github/SUPPORT.md)
- **Security**: [Report vulnerabilities](SECURITY.md)

---

## Maintainer

This repository is maintained by [Ritesh Rana](https://github.com/ambicuity) (`@ambicuity`).

---

## Get Started

1. Browse the agents above and find specialists for your needs
2. Copy the agent blueprints to `~/.claude/agents/` for Claude Code integration
3. For cross-runtime setups, follow [docs/integrations/install-guides.md](docs/integrations/install-guides.md)
4. Validate integration with `./tools/validate-integration.sh`
5. Activate agents by referencing them in your coding sessions
6. Customize agent personalities and workflows for your specific needs
7. Contribute back to the community

---

[Star this repo](https://github.com/ambicuity/blueprint-of-agents) | [Fork it](https://github.com/ambicuity/blueprint-of-agents/fork) | [Report an issue](https://github.com/ambicuity/blueprint-of-agents/issues) | [Sponsor](https://github.com/sponsors/ambicuity)
