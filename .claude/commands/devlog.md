# Devlog Command

Add entries to the development log (`docs/devlog.md`).

## Usage

```
/devlog <message>           — Add a general note to the timeline
/devlog problem <desc>      — Log a problem you encountered
/devlog resolve <desc>      — Log how a problem was resolved
/devlog learn <insight>     — Add to the Learnings section for current PR
/devlog status              — Show recent timeline entries
```

## Instructions

When this command is invoked:

### 1. Load the devlog skill

Use the `devlog` skill for full instructions on file format and conventions.

### 2. Ensure devlog file exists

Check if `docs/devlog.md` exists. If not, create it:

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

### 3. Determine current context

```bash
# Get branch name
BRANCH=$(git branch --show-current)

# Check if PR exists for this branch
PR_NUM=$(gh pr view --json number -q .number 2>/dev/null)

# Set context tag
if [ -n "$PR_NUM" ]; then
  CONTEXT="PR-$PR_NUM"
else
  CONTEXT="$BRANCH"
fi
```

### 4. Process the command

#### `/devlog <message>` — General note

1. Get current date and time
2. Check if today's date header exists in Timeline section; add if not
3. Append entry:
   ```markdown
   - `HH:MM` [context] <message>
   ```

#### `/devlog problem <description>` — Log a problem

1. Append to Timeline:
   ```markdown
   - `HH:MM` PROBLEM [context]: <brief description>
   ```

2. Add detailed entry to Problems Archive section:
   ```markdown
   ### YYYY-MM-DD [context]: <short title>
   **Description:** <full description>
   **Resolution:** _pending_
   **Time spent:** —
   ```

#### `/devlog resolve <description>` — Log resolution

1. Append to Timeline:
   ```markdown
   - `HH:MM` RESOLVED [context]: <brief description>
   ```

2. Find the most recent pending problem for this context in Problems Archive and update:
   ```markdown
   **Resolution:** <description>
   ```

#### `/devlog learn <insight>` — Add learning

1. Find the Learnings section
2. Look for existing entry for current PR/context
3. If exists, append to it. If not, create new entry:
   ```markdown
   ### PR-XXX: <PR title or branch name>
   <insight>
   ```

#### `/devlog status` — Show status

Display:
- Current context (PR number or branch name)
- Last 10 timeline entries
- Whether there's a learning entry for current PR

### 5. Confirm the action

After updating, confirm:

```
Added to devlog (docs/devlog.md):
- `14:30` [PR-42] <message>
```

## Examples

**Adding a note:**
```
User: /devlog Decided to use Redis for session storage
Assistant: Added to devlog:
- `14:30` [PR-42] Decided to use Redis for session storage
```

**Logging a problem:**
```
User: /devlog problem Tests are failing intermittently on CI
Assistant: Added to devlog:
- Timeline: `15:00` PROBLEM [PR-42]: Tests are failing intermittently on CI
- Problems Archive: Created detailed entry for tracking
```

**Recording a learning:**
```
User: /devlog learn Redis connection pooling is critical for performance under load
Assistant: Added to Learnings section for PR-42:
> Redis connection pooling is critical for performance under load
```
