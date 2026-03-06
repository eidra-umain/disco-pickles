# QA Gate

Automatic QA validation that runs after each task is built. Auto-detects your stack and runs the right tools.

## Guidelines

- QA detects stack from package.json, Cargo.toml, go.mod, etc.
- If QA fails → fix → re-run (max 3 attempts before escalating)
- Each task gets a QA report: docs/qa/TASK-XXX-report.md
- Nothing gets marked "done" without passing QA

## Output

docs/qa/TASK-XXX-report.md
