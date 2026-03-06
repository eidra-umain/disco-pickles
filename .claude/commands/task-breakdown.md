# Task Breakdown

Decomposes everything into buildable tasks with TASK-XXX IDs. Each task is 2–8 hours, one layer, one developer, testable in isolation.

## Guidelines

- TASK-XXX format with zero-padded IDs and acceptance criteria
- Organized in epics → tasks by layer (frontend / backend / shared)
- Build order in phases: Foundation → Core → Secondary → Polish
- Dependencies are sacred — no guessing what to build first

## Prerequisites

docs/PRD.md + docs/design-spec.md + docs/technical-design.md must exist

## Output

docs/tasks.md
