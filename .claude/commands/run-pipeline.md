# Run Pipeline

Execute the full development pipeline for the current phase.

## Instructions

Based on the current project state, run the appropriate pipeline phase:

### Phase 1: Planning
1. Check if `pm/summary.md` exists → if not, prompt PM to create it
2. Check if `pm/prd.md` exists → if not, use `prd-generator` skill
3. Check if `design/design-spec.md` exists → if not, use `design-spec` skill

### Phase 2: Technical Design
1. Check if `docs/tech-design.md` exists → if not, use `tech-design` skill
2. Check if `tasks.md` has tasks → if not, use `task-breakdown` skill

### Phase 3: Implementation
1. Find next `pending` task in `tasks.md`
2. Use `build` agent to implement
3. Use `qa` agent to validate
4. Repeat until all tasks are done

Report the current phase and what needs to happen next.
