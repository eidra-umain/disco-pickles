# build-agent Skill

This skill provides implementation guidance for the build agent, including integration with the devlog for tracking problems and progress.

## Purpose

Provide implementation guidance and patterns for the build agent, ensuring all development activity is documented in the devlog.

## Inputs

- Task from `tasks.md` with acceptance criteria
- `pm/prd.md` for product requirements
- `design/design-spec.md` for UI/UX specs
- `docs/tech-design.md` for technical approach

## Outputs

- Implemented code
- Tests covering acceptance criteria
- QA report at `docs/qa/TASK-XXX-report.md`
- Updated task status in `tasks.md`
- Devlog entries in `docs/devlog.md`

## Instructions

### 1. Read and understand the task

Review the assigned task from `tasks.md` and all related documentation.

### 2. Log start of work

Add an entry to `docs/devlog.md` when starting implementation:
```markdown
- `HH:MM` [context] Starting work on TASK-XXX: <task title>
```

### 3. Implement with devlog integration

During implementation:

**When encountering a problem:**
1. Add to timeline:
   ```markdown
   - `HH:MM` PROBLEM [context]: <brief description>
   ```
2. Add detailed entry to Problems Archive section:
   ```markdown
   ### YYYY-MM-DD [context]: <problem title>
   **Description:** <what went wrong>
   **Resolution:** _pending_
   **Time spent:** —
   ```

**When resolving a problem:**
1. Add to timeline:
   ```markdown
   - `HH:MM` RESOLVED [context]: <how it was fixed>
   ```
2. Update the Problems Archive entry with resolution and time spent.

**When making significant decisions:**
Add a note to the timeline:
```markdown
- `HH:MM` [context] DECISION: <what was decided and why>
```

### 4. Commit regularly

After each logical unit of work, commit and ensure the commit is logged to devlog (the github skill handles this).

### 5. Write tests

Write tests that cover the acceptance criteria. If tests reveal issues, log them as problems in the devlog.

### 6. Generate QA report

Create `docs/qa/TASK-XXX-report.md` with test results and validation.

### 7. Update task status

Change task status in `tasks.md` to `review`.

### 8. Prompt for learnings

Before completing, remind the developer to record learnings:
```
Consider documenting what you learned during this task: /devlog learn "your insights"
```

## Problem Logging Guidelines

Always log problems when:
- Tests fail unexpectedly
- Build errors occur
- Dependencies conflict
- Edge cases are discovered
- Performance issues are found
- Integration issues arise

Include enough detail that future developers can learn from the problem without experiencing it themselves.
