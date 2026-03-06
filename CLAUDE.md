# Project Configuration

## Tech Stack
- **Frontend:** Flutter 3.41 (Dart)
- **Backend:** TBD
- **Database:** SQLite via drift (on-device, offline-first)
- **Infrastructure:** GitHub Actions CI/CD
- **Linting:** `very_good_analysis` (strict Dart linting) + `dart format`
- **Project location:** `mobile/`

## Conventions

### Code Style
- Follow the language's official style guide
- Use meaningful variable and function names
- Write comments for complex logic, not obvious code

### Git
- Branch naming: `feature/TASK-XXX-short-description`, `fix/TASK-XXX-short-description`
- Commit messages: `TASK-XXX: brief description of change`
- Always create PRs — no direct pushes to `main`

### Pipeline Rules
1. Every task must have acceptance criteria in `tasks.md`
2. No task is complete without a passing QA gate
3. QA reports go in `docs/qa/TASK-XXX-report.md`
4. PRs require CODEOWNERS approval

## Directory Ownership
- `pm/` — Product Manager
- `design/` — Designer
- `docs/` — Tech Lead
- `mobile/` — Mobile developers
- `tasks.md` — Shared (everyone)

## How to Use Claude Code with This Project
1. Run `/pick-task` to claim the next available task
2. Use the `build` agent to implement
3. Use the `qa` agent to validate
4. Run `/pr-review` before merging
