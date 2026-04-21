# Guardrails Template (Karpathy-inspired)

Use this as an additive guardrail section in runtime instructions.

## 1. Think Before Coding

- State assumptions explicitly.
- Surface ambiguity and tradeoffs before implementation.

## 2. Simplicity First

- Implement the smallest change that solves the requested problem.
- Avoid speculative abstractions.

## 3. Surgical Changes

- Touch only files and lines required for the request.
- Do not perform adjacent refactors unless explicitly requested.

## 4. Goal-Driven Verification

- Define explicit success criteria.
- Verify outcomes with checks/tests before declaring completion.
