---
name: prd-generator
description: >
  Generate a comprehensive Product Requirements Document (PRD) from a project summary, brainstorm
  notes, or external brief. Use this skill whenever the user asks to create, write, or generate
  a PRD, product spec, product requirements, feature spec, or requirements document. Also trigger
  when the user says things like "turn this brief into requirements", "write up the product spec",
  "create a PRD from this summary", or "what should we build" after a brainstorm session.
  If the user has a Google Doc brief open in Chrome, this skill can read it directly.
---

# PRD Generator

## Purpose

Transform a project idea — whether it comes from a structured summary file, a raw brainstorm conversation, or an external brief (including Google Docs) — into a stakeholder-ready Product Requirements Document with prioritised requirements, user stories, and success metrics.

## Why this structure matters

A good PRD serves three audiences: the product team (what to build and why), designers (who the users are and what they need), and engineers (exactly what the system must do). The 14-section structure below covers all three. Sections scale with project complexity — a small feature gets a few paragraphs per section; a full product gets pages. The point is completeness, not length.

## Inputs

The skill accepts input from three sources, checked in this order:

1. **`pm/summary.md`** — If this file exists and has real content (not just a TODO placeholder), use it as the primary source.
2. **Google Doc in Chrome** — If the user mentions a Google Doc or has one open, use the Chrome MCP tools (`tabs_context_mcp` → `get_page_text` or `screenshot`) to read it. Extract the relevant content.
3. **Conversation context** — If neither of the above is available, work from whatever the user has described in the conversation (brainstorm output, pasted notes, verbal description).

If none of these provide enough information to write a meaningful PRD, ask the user targeted questions rather than generating a vague document. The minimum you need: what the product does, who it's for, and what problem it solves.

## Output

Write the PRD to **`pm/prd.md`**.

If the project summary doesn't exist yet (or is a placeholder), also generate `pm/summary.md` from the source material before writing the PRD. The summary should be concise — one page max — covering the what, why, who, scope, key features, and open questions.

## PRD Structure

Generate these 14 sections. Not every section needs to be long — calibrate depth to the project's scope. A weekend hack doesn't need a 3-page risk assessment.

### 1. Executive Summary
One paragraph. What is this product, who is it for, and why build it now? A busy VP should be able to read this and understand the bet.

### 2. Problem Statement
What pain exists today? Be specific — cite data, user quotes, or market evidence if available from the source material. Separate the problem from the proposed solution.

### 3. Target Users
Define 2-3 user personas with: demographics, current behaviour, pain points, and what success looks like for them. Use a table for scannability.

### 4. User Stories
Write user stories in the format: *As a [persona], I want to [action] so that [outcome].*
Group by persona. Prioritise: P0 (must have for launch), P1 (important, can follow fast), P2 (nice to have).

### 5. Functional Requirements
The heart of the PRD. Break into logical sections (e.g., by feature area or screen). Each requirement gets:
- A clear, testable statement
- Priority: P0 / P1 / P2
- Any constraints or dependencies

Use tables for dense requirements. Use prose for requirements that need context.

### 6. Non-Functional Requirements
Cover these categories (skip any that genuinely don't apply):
- **Performance**: response times, throughput, load targets
- **Security**: auth, data protection, encryption, compliance (GDPR, etc.)
- **Accessibility**: WCAG level, screen reader support, touch targets
- **Scalability**: expected user growth, data volume
- **Reliability**: uptime targets, graceful degradation, offline support

### 7. Information Architecture
High-level sitemap or navigation structure. What are the top-level sections? How do users move between them? A simple indented list or ASCII tree works well here.

### 8. Data Model (High Level)
What are the core entities? What are the key relationships? This isn't a database schema — it's a conceptual model that helps engineers and designers think about the same domain objects. Use a table: Entity | Key Attributes | Relationships.

### 9. API / Integration Points
External services, third-party APIs, platform integrations. For each: what it does, why it's needed, and any known constraints (rate limits, costs, terms).

### 10. Success Metrics
How do we know this product is working? Define 4-6 metrics with:
- Metric name
- Baseline (current state, often 0 for new products)
- Target (realistic goal for a defined timeframe)
- How it's measured

Use a table.

### 11. Scope & Constraints
What's explicitly in scope for this version? What's explicitly out? What technical, legal, or business constraints shape the solution? Being clear about boundaries prevents scope creep and disappointed stakeholders.

### 12. Risks & Mitigations
What could go wrong? For each risk: likelihood (low/med/high), impact (low/med/high), and a mitigation strategy. Include technical risks, market risks, and dependency risks.

### 13. Timeline & Milestones
If the source material suggests phases or deadlines, capture them. Otherwise, suggest a phased approach: Foundation → Core Features → Secondary Features → Polish. Don't fabricate specific dates — use relative timing ("Phase 1: 2-3 weeks").

### 14. Open Questions
Things that need answers before implementation. Flag who should answer each question (product, design, engineering, legal). These often come directly from the source material — preserve them rather than guessing at answers.

## Writing Guidelines

- **Use the source's language.** If the brief calls them "nudges", don't rename them to "notifications" without reason. Preserving terminology reduces confusion across the team.
- **Flag inferences.** If you're filling in gaps that the source material didn't cover, mark them with `[inferred]` so the team knows what to validate.
- **Prioritise ruthlessly.** Everything can't be P0. If the source doesn't prioritise, make a judgment call based on what's core to the value proposition vs. what's enhancement.
- **Be specific.** "The app should be fast" is not a requirement. "Home screen loads in < 2 seconds on 4G" is.
- **Tables for dense data, prose for context.** Don't force everything into tables, but don't write paragraphs where a table would be clearer.
