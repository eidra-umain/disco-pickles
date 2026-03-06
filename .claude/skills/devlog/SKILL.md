---
name: devlog
description: |
  Development logging skill that documents everything happening during project development. Use this skill when creating branches, making commits, opening PRs, encountering problems, or when you need to log any significant development event. Also trigger when the user says "/devlog", "log this", "document what happened", or wants to add notes about their work. This skill maintains a single chronological timeline of all development activity.
---

# Development Log (Devlog)

This skill maintains a single chronological timeline of all development activity in `docs/devlog.md`. Every event — branches, commits, PRs, problems, learnings — goes into one file, organized by date with PR/branch tags for context.

## Storage Location

All devlog entries live in a single file:

```
docs/devlog.md
```

## File Format

The devlog follows this structure:

```markdown
# Development Log

A chronological record of all development activity on this project.

---

## Timeline

### YYYY-MM-DD

- `HH:MM` [PR-XXX] <event description>
- `HH:MM` [branch-name] <event description>
- `HH:MM` PROBLEM [PR-XXX]: <description>
- `HH:MM` RESOLVED [PR-XXX]: <description>

### YYYY-MM-DD

- `HH:MM` [PR-XXX] <event description>

---

## Learnings

<!-- Insights and lessons learned, tagged by PR -->

### PR-XXX: <title>
<reflection>

### PR-YYY: <title>
<reflection>

---

## Problems Archive

<!-- Detailed problem reports for future reference -->

### YYYY-MM-DD [PR-XXX]: <problem title>
**Description:** <what went wrong>
**Resolution:** <how it was fixed>
**Time spent:** <optional>
```

## Event Format

Every timeline entry follows this format:

```
- `HH:MM` [context] EVENT_TYPE: description
```

Where:
- `HH:MM` — 24-hour time
- `[context]` — PR number `[PR-42]` or branch name `[feature/auth]`
- `EVENT_TYPE` — Optional prefix like `COMMIT:`, `PROBLEM:`, `RESOLVED:`

### Event Types

| Event | Format | Example |
|-------|--------|---------|
| Branch created | `[branch] Branch created from <base>` | `[feature/auth] Branch created from main` |
| Commit | `[context] COMMIT: <hash> — <message>` | `[PR-42] COMMIT: a1b2c3d — Add login endpoint` |
| PR opened | `[PR-XXX] PR opened: <title>` | `[PR-42] PR opened: Add user authentication` |
| PR review | `[PR-XXX] Review from <user>: <status>` | `[PR-42] Review from @jane: approved` |
| PR merged | `[PR-XXX] Merged into <base>` | `[PR-42] Merged into main` |
| Problem | `PROBLEM [context]: <description>` | `PROBLEM [PR-42]: OAuth callback returns 500` |
| Resolved | `RESOLVED [context]: <description>` | `RESOLVED [PR-42]: Fixed redirect URI` |
| Note | `[context] <message>` | `[PR-42] Decided to use JWT instead of sessions` |

## Step-by-Step: Logging Events

### Initial Setup

If `docs/devlog.md` doesn't exist, create it:

```markdown
# Development Log

A chronological record of all development activity on this project.

---

## Timeline

---

## Learnings

<!-- Insights and lessons learned, tagged by PR -->

---

## Problems Archive

<!-- Detailed problem reports for future reference -->
```

### Adding a Timeline Entry

1. Get current context:
   ```bash
   # Get branch name
   BRANCH=$(git branch --show-current)
   
   # Check if PR exists
   PR_NUM=$(gh pr view --json number -q .number 2>/dev/null)
   
   # Determine context tag
   if [ -n "$PR_NUM" ]; then
     CONTEXT="PR-$PR_NUM"
   else
     CONTEXT="$BRANCH"
   fi
   ```

2. Get current date and time:
   ```bash
   DATE=$(date +%Y-%m-%d)
   TIME=$(date +%H:%M)
   ```

3. Check if today's date header exists in the Timeline section. If not, add it:
   ```markdown
   ### YYYY-MM-DD
   ```

4. Append the entry under today's date:
   ```markdown
   - `HH:MM` [context] <event>
   ```

### When a Branch is Created

Add to timeline:
```markdown
- `09:30` [feature/TASK-001-auth] Branch created from main
```

### When Commits are Made

For each new commit, add to timeline:
```markdown
- `10:15` [feature/auth] COMMIT: a1b2c3d — Add user model
- `10:45` [feature/auth] COMMIT: b2c3d4e — Add login endpoint
```

Get commits with:
```bash
git log --oneline -10 --format="%h — %s"
```

### When a PR is Opened

1. Add to timeline:
   ```markdown
   - `11:00` [PR-42] PR opened: Add user authentication
   ```

2. Update previous branch entries to use PR context (optional, for clarity):
   - Find recent `[feature/auth]` entries
   - Change to `[PR-42]`

### When Problems are Encountered

1. Add to timeline:
   ```markdown
   - `14:30` PROBLEM [PR-42]: OAuth callback returns 500 error
   ```

2. Add detailed entry to Problems Archive section:
   ```markdown
   ### 2026-03-06 [PR-42]: OAuth callback 500 error
   **Description:** After successful Google OAuth login, the callback endpoint returned a 500 error. Logs showed "invalid redirect_uri" but the URI looked correct.
   **Resolution:** _pending_
   **Time spent:** —
   ```

### When Problems are Resolved

1. Add to timeline:
   ```markdown
   - `16:00` RESOLVED [PR-42]: Fixed redirect URI mismatch in OAuth config
   ```

2. Update the corresponding entry in Problems Archive:
   ```markdown
   **Resolution:** The OAuth config had a trailing slash but the callback URL didn't. Removed trailing slash.
   **Time spent:** ~1.5 hours
   ```

### When a PR is Merged

1. Add to timeline:
   ```markdown
   - `10:30` [PR-42] Merged into main
   ```

2. Check if there's a learning entry for this PR in the Learnings section. If not, prompt the author:
   ```
   The devlog has no "What Was Learned" entry for PR-42.
   Consider adding your insights with: /devlog learn "your reflection"
   ```

### Adding Learnings

When the user shares what they learned (via `/devlog learn` or at PR merge time):

1. Find the Learnings section
2. Add or update the entry for the current PR:
   ```markdown
   ### PR-42: Add user authentication
   OAuth providers are strict about redirect URI matching — even trailing slashes matter.
   Always test OAuth in incognito to avoid cached state issues.
   ```

## Integration with Other Skills

### GitHub Skill Integration

The `github` skill should log these events:
- `git checkout -b` → Log "Branch created from X"
- `git commit` → Log each commit with hash and message
- `git push` → Sync any unlogged commits
- `gh pr create` → Log "PR opened: title"
- `gh pr merge` → Log "Merged into X", check for learnings

### Build Agent Integration

The `build` agent should:
- Log problems encountered with `PROBLEM [context]:` prefix
- Log resolutions with `RESOLVED [context]:` prefix
- Log significant decisions as notes

### Code Review Skill Integration

The `code-review` skill should:
- Check if the Learnings section has an entry for the current PR
- If missing, add a **warning** (not blocker) in the review:
  ```
  The devlog has no learnings recorded for this PR.
  Consider adding insights before merging: /devlog learn "your reflection"
  ```

## Manual Commands

| Command | Purpose |
|---------|---------|
| `/devlog "message"` | Add a general note to timeline |
| `/devlog problem "desc"` | Log a problem with full details |
| `/devlog resolve "desc"` | Log a resolution |
| `/devlog learn "insight"` | Add to Learnings section for current PR |
| `/devlog status` | Show recent entries and current context |

## Safety Rules

- Never delete or overwrite existing entries — only append
- Preserve chronological order within each date
- Entries are immutable once written
- The Learnings section is strongly encouraged but not blocking

## Example Devlog

```markdown
# Development Log

A chronological record of all development activity on this project.

---

## Timeline

### 2026-03-06

- `09:30` [feature/TASK-001-auth] Branch created from main
- `10:15` [feature/TASK-001-auth] COMMIT: a1b2c3d — Scaffold auth module structure
- `11:45` [feature/TASK-001-auth] COMMIT: d4e5f6g — Add JWT token generation
- `14:00` [PR-42] PR opened: Add user authentication
- `14:00` [PR-42] COMMIT: h7i8j9k — Implement login endpoint
- `14:30` PROBLEM [PR-42]: OAuth callback returns 500 error
- `16:00` RESOLVED [PR-42]: Fixed redirect URI mismatch in OAuth config
- `16:15` [PR-42] COMMIT: l0m1n2o — Fix OAuth redirect URI

### 2026-03-07

- `09:00` [PR-42] COMMIT: p3q4r5s — Add refresh token logic
- `10:30` [PR-42] COMMIT: t6u7v8w — Write auth tests
- `14:00` [PR-42] Review from @jane: changes requested
- `15:30` [PR-42] COMMIT: x9y0z1a — Address review feedback

### 2026-03-08

- `10:00` [PR-42] Review from @jane: approved
- `10:30` [PR-42] Merged into main
- `11:00` [feature/TASK-002-logging] Branch created from main
- `11:30` [feature/TASK-002-logging] COMMIT: b1c2d3e — Add structured logging

---

## Learnings

### PR-42: Add user authentication
OAuth providers are very strict about redirect URI matching — even a trailing slash difference causes failure. Always test OAuth flows in an incognito window to avoid cached state issues.

Also discovered that our error handling middleware was swallowing the original error message. Filed TASK-002 to improve error logging.

---

## Problems Archive

### 2026-03-06 [PR-42]: OAuth callback 500 error
**Description:** After successful Google OAuth login, the callback endpoint returned a 500 error. Logs showed "invalid redirect_uri" but the URI looked correct.
**Resolution:** The OAuth config had a trailing slash on the redirect URI but the actual callback URL didn't. Removed the trailing slash from the config.
**Time spent:** ~1.5 hours
```
