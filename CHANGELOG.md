# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- New onboarding and navigation docs: `docs/start-here.md`, `docs/choose-an-agent.md`, and `docs/standards/blueprint-schema.md`.
- New discovery indexes: `blueprints/README.md`, `playbooks/README.md`, `playbooks/index.md`, and `workflows/index.md`.
- New machine-readable blueprint catalog: `blueprints/catalog.yaml`.
- New 2026 agentic standards blueprint expansion with 12 roles for AI governance, agentic risk assessment, red teaming, evaluations, guardrails, MCP/tooling architecture, context and memory integrity, observability, incident command, human-agent UX, release management, and supply-chain auditing.
- New Business Operations blueprint division with 12 roles for revenue operations, sales enablement, customer success, partnerships, procurement, operations analysis, business development, account execution, onboarding, renewals, vendor risk, and SOP documentation.
- New GitHub blueprint division with 12 roles for repository stewardship, issue triage, pull request review, review comment resolution, Actions CI debugging, release coordination, security alerts, rulesets, Copilot coding agent coordination, Copilot code review analysis, MCP integration, and Projects coordination.
- New website design blueprint expansion with 10 roles distributed across existing design, engineering, marketing, and testing divisions for website strategy, landing pages, visual design, web accessibility, design systems, responsive layout, conversion UX, content UX, SEO information architecture, and launch QA.
- New named expert skillset blueprint expansion with 12 non-impersonation archetypes inspired by public work patterns associated with Elon Musk, Bill Gates, Andrej Karpathy, Steve Jobs, Jeff Bezos, Sam Altman, Jensen Huang, Satya Nadella, Naval Ravikant, Paul Graham, Linus Torvalds, and Warren Buffett.

### Changed

- Reworked README with a 2-minute onboarding path, documentation hub links, and updated playbook/workflow references.
- Replaced broken or stale orchestration links and repaired anchor navigation in orchestration/workflow reference docs.
- Upgraded blueprint linting to a schema-aware baseline and wired CI workflows to run `tools/lint-agents.sh`.
- Normalized naming and portability in key blueprints (`ux-architect`, `senior-developer`, `agents-orchestrator`).

### Fixed

- Fixed broken internal markdown links across top-level, playbook, and workflow docs.
- Repaired corrupted encoding artifacts in `mobile-app-builder`, `rapid-prototyper`, and `app-store-optimizer` blueprints.

### Docs

- Added first-time contributor quick lane in `CONTRIBUTING.md`.
- Added trust and governance clarity updates to `SECURITY.md`, `GOVERNANCE.md`, `CODE_OF_CONDUCT.md`, and `.github/PULL_REQUEST_TEMPLATE.md`.

## [1.0.0] - 2026-03-07

### Added

- Initial release of Blueprint of Agents with 61 specialized agents across 9 divisions.
- Engineering Division: Frontend Developer, Backend Architect, Mobile App Builder, AI Engineer, DevOps Automator, Rapid Prototyper, Senior Developer, Security Engineer.
- Design Division: UI Designer, UX Researcher, UX Architect, Brand Guardian, Visual Storyteller, Whimsy Injector, Image Prompt Engineer.
- Marketing Division: Growth Hacker, Content Creator, Twitter Engager, TikTok Strategist, Instagram Curator, Reddit Community Builder, App Store Optimizer, Social Media Strategist, Xiaohongshu Specialist, WeChat Official Account Manager, Zhihu Strategist.
- Product Division: Sprint Prioritizer, Trend Researcher, Feedback Synthesizer.
- Project Management Division: Studio Producer, Project Shepherd, Studio Operations, Experiment Tracker, Senior Project Manager.
- Testing Division: Evidence Collector, Reality Checker, Test Results Analyzer, Performance Benchmarker, API Tester, Tool Evaluator, Workflow Optimizer, Accessibility Auditor.
- Support Division: Support Responder, Analytics Reporter, Finance Tracker, Infrastructure Maintainer, Legal Compliance Checker, Executive Summary Generator.
- Spatial Computing Division: XR Interface Architect, macOS Spatial/Metal Engineer, XR Immersive Developer, XR Cockpit Interaction Specialist, visionOS Spatial Engineer, Terminal Integration Specialist.
- Specialized Division: Agents Orchestrator, Data Analytics Reporter, LSP/Index Engineer, Sales Data Extraction Agent, Data Consolidation Agent, Report Distribution Agent, Agentic Identity and Trust Architect.
- Strategy playbooks (Phase 0 through Phase 6), runbooks, and coordination templates.
- Example workflows: Startup MVP, Landing Page, Orchestration Framework Spatial Discovery.
- Complete CI/CD infrastructure: 19 GitHub Actions workflows.
- Community governance: CONTRIBUTING.md, CODE_OF_CONDUCT.md, SECURITY.md, GOVERNANCE.md.
- CodeRabbit integration for automated code review.
- Release-please integration for automated versioning.
- Agent linting script and CI workflow.
