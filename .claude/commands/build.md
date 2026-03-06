# Build & QA Loop

Implements tasks one at a time. After each task, an automatic QA gate validates everything. QA auto-detects your stack and runs the right tools. Reports saved per task.

## Guidelines

- Two modes: autonomous (continuous) or supervised (one at a time)
- QA detects stack from package.json, Cargo.toml, go.mod, etc.
- If QA fails → fix → re-run (max 3 attempts before escalating)
- Each task gets a QA report: docs/qa/TASK-XXX-report.md
- Nothing gets marked "done" without passing QA

## Output

src/ + docs/qa/TASK-XXX-report.md
