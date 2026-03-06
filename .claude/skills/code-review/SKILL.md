---
name: code-review
description: |
  Code review skill for reviewing pull requests and code changes. Use this skill when the user asks to review a PR, review code changes, do a code review, check code quality on a branch, or says "/pr-review". Also trigger when the user wants feedback on their implementation before merging. Covers correctness, security, performance, style, and adherence to project conventions.
---

# Code Review

This skill performs thorough code reviews on pull requests or local branch changes. It checks for correctness, security issues, performance concerns, style consistency, and adherence to the project's conventions defined in CLAUDE.md.

## Step 0: Detect Context

Before reviewing, gather context about what to review and how the project works.

```bash
# Determine what's being reviewed
gh pr view --json number,title,body,baseRefName,headRefName,files 2>/dev/null

# If no PR, compare current branch to main
git log --oneline main..HEAD
git diff --stat main..HEAD

# Read project conventions
cat CLAUDE.md

# Check for linting/formatting configs
ls -la .eslintrc* .prettierrc* pyproject.toml .rubocop.yml biome.json 2>/dev/null

# Check for test conventions
ls -la **/test* **/spec* **/tests* 2>/dev/null | head -10
```

From this, understand:
- **What changed**: which files, how many lines, what areas of the codebase
- **Project conventions**: coding style, commit message format, required tests, QA gate rules
- **Base branch**: what to diff against

## Step 1: Review the Diff

Get the full diff and review it file by file.

```bash
# For a PR
gh pr diff

# Or for local changes vs main
git diff main..HEAD
```

For each changed file, evaluate:

### Correctness
- Does the logic do what it's supposed to?
- Are edge cases handled (null, empty, boundary values)?
- Are error paths handled properly?
- Do new functions have consistent return types?
- Are there any off-by-one errors, race conditions, or logic flaws?

### Security
- No hardcoded secrets, tokens, or credentials
- User input is validated and sanitized
- No SQL injection, XSS, or command injection vectors
- Auth checks are in place where needed
- Sensitive data isn't logged or exposed in error messages
- Dependencies are from trusted sources

### Performance
- No unnecessary loops, repeated DB queries, or N+1 patterns
- Large data sets are paginated or streamed
- No blocking operations in async contexts
- Caching is used where appropriate
- No memory leaks (unclosed connections, event listener buildup)

### Style & Conventions
- Code follows the project's style guide (from CLAUDE.md)
- Naming is clear and consistent with the codebase
- No dead code, commented-out blocks, or TODO debris
- File organization matches project structure
- Imports are clean (no unused imports)

### Tests
- New functionality has corresponding tests
- Tests cover happy path and edge cases
- Test names clearly describe what they verify
- No flaky patterns (timing-dependent, order-dependent)

### Git Hygiene
- Commit messages follow project convention (`TASK-XXX: description`)
- Commits are logically organized (not one giant commit, not micro-commits)
- No unrelated changes mixed in
- No merge commits that should have been rebased

## Step 2: Check for Task Compliance

If the change references a task ID (TASK-XXX):

```bash
# Check acceptance criteria
grep -A 20 "TASK-XXX" tasks.md
```

Verify:
- All acceptance criteria from `tasks.md` are addressed
- The scope matches — no over-engineering, no missing pieces
- QA report exists if required (`docs/qa/TASK-XXX-report.md`)

## Step 2.5: Check Devlog for Learnings

Check if the developer has recorded learnings for this PR:

```bash
# Get PR number
PR_NUM=$(gh pr view --json number -q .number 2>/dev/null)

# Check if learnings exist for this PR
grep -q "### PR-$PR_NUM" docs/devlog.md
```

If no learnings entry exists, note this as a **minor** finding (not blocking):
```
The devlog has no learnings recorded for this PR.
Consider documenting insights before merging: /devlog learn "your reflection"
```

## Step 3: Produce the Review

Output a structured review with:

### Summary
One paragraph describing what the change does and an overall assessment (Approve / Request Changes / Comment).

### Issues Found
Categorize findings by severity:

- **Blocker** — Must fix before merge (bugs, security issues, data loss risks)
- **Major** — Should fix before merge (performance problems, missing tests, convention violations)
- **Minor** — Nice to fix but not blocking (style nits, naming suggestions, optional improvements)

For each issue, include:
1. File and line reference (`path/to/file.ts:42`)
2. What the problem is
3. A suggested fix (code snippet if helpful)

### What Looks Good
Call out things done well — clean abstractions, good test coverage, clear naming. This helps reinforce good patterns.

### Checklist
- [ ] Correctness verified
- [ ] No security concerns
- [ ] Performance acceptable
- [ ] Tests adequate
- [ ] Style/conventions followed
- [ ] Task acceptance criteria met (if applicable)
- [ ] QA gate passed (if applicable)
- [ ] Devlog learnings recorded (encouraged)

## Step 4: Post the Review (if PR)

If reviewing an actual PR, post the review via `gh`:

```bash
# For approval
gh pr review --approve --body "review summary here"

# For requesting changes
gh pr review --request-changes --body "review summary here"

# For individual line comments, use
gh api repos/{owner}/{repo}/pulls/{number}/comments -f body="comment" -f path="file" -f line=42 -f side="RIGHT" -f commit_id="$(gh pr view --json headRefOid -q .headRefOid)"
```

Always confirm with the user before submitting the review to GitHub.

## Safety Rules

- Never approve a PR with known blockers
- Never auto-merge — always let the user decide
- Flag any secrets or credentials immediately, even as minor findings
- If unsure about a pattern, mention it as a question rather than a firm objection
- Respect CODEOWNERS — note if the right reviewers are assigned
