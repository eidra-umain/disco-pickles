# Design Specification

Bridges "what to build" and "how it looks." Produces a full design spec with screen inventory, user flows, component list, and state definitions for every screen.

## Guidelines

- Screen inventory with purpose, components, and states
- User flows mapped step by step (happy path + error + edge cases)
- Every state covered: empty, loading, loaded, error, offline
- Optional: generates Pencil.dev wireframes if MCP is available

## Prerequisites

docs/PRD.md must exist

## Output

docs/design-spec.md + design/*.pen
