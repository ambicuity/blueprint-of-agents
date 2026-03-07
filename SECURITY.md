# Security Policy

## Supported Versions

The following versions of Blueprint of Agents are currently receiving security updates:

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | Active support     |
| < 1.0   | Not supported      |

## Reporting a Vulnerability

**Please do NOT open a public GitHub Issue for security vulnerabilities.**

Opening a public issue exposes the vulnerability to all users -- including malicious actors -- before a patch is available.

### Private Disclosure Process

1. **Email the maintainer directly at:** `contact@riteshrana.engineer`
2. Use the subject line: `[SECURITY] Blueprint of Agents - <brief description>`
3. Include the following in your report:
   - A description of the vulnerability and its potential impact
   - Steps to reproduce the issue
   - Any proof-of-concept code or screenshots
   - The version(s) affected
   - Your suggested fix (if you have one)

### What to Expect

| Timeline         | Action                                           |
| ---------------- | ------------------------------------------------ |
| Within 48 hours  | Acknowledgement of your report                   |
| Within 7 days    | Initial assessment and severity classification   |
| Within 30 days   | Patch released and CVE filed (if applicable)     |
| Post-patch       | Public disclosure with credit to the reporter    |

We will keep you informed throughout the process and, with your permission, will credit you in the security advisory upon public disclosure.

## Scope

The following are **in scope** for security reports:

- **GitHub Actions workflows**: Secrets exposure, workflow injection, supply-chain attacks
- **Agent markdown files**: Injection of malicious content, prompt injection vectors
- **Dependency vulnerabilities**: Known CVEs in any tooling dependencies
- **Repository configuration**: Configurations that could enable malicious behavior

The following are **out of scope**:

- Vulnerabilities in third-party AI tools (Claude, Cursor, etc.) -- report to those vendors
- AI hallucination or incorrect agent outputs -- these are expected limitations
- Social engineering attacks

## Security Best Practices for Contributors

When contributing to this project, please observe the following:

- **Never hardcode credentials, tokens, or API keys** -- use GitHub Secrets and environment variables
- **Review GitHub Actions permissions** -- workflows should request the minimum permissions required
- **Pin dependency versions** -- use exact versions in workflow files to prevent supply-chain attacks
- **Validate external content** -- treat user-submitted agent content as untrusted input

Thank you for helping keep Blueprint of Agents and its users safe.
