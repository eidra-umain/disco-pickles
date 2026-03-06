---
name: github
description: |
  Full Git and GitHub workflow skill — branching, commits, PRs, merges, rebasing, and conflict resolution using the `gh` CLI and `git`. Use this skill whenever the user asks to create a branch, open a PR, merge changes, rebase, resolve conflicts, check PR status, manage releases, or do anything involving git operations in a repository. Also trigger when the user references task IDs (like TASK-001) and wants to start working on them, since that implies branch creation and workflow setup. If the user says "start working on TASK-X", "ship this", "open a PR", "merge", "rebase", or mentions branches in any way, use this skill.

  ALSO trigger this skill when users use beginner-friendly language like: "save my work", "sync", "backup", "upload to cloud", "share my progress", "let others see my work", "save to GitHub", "push my changes", "update the cloud", or any variation suggesting they want to preserve or share their work without knowing Git terminology.
---

# GitHub Workflow

This skill handles the full Git + GitHub lifecycle: branching, committing, pushing, opening PRs, merging, rebasing, and resolving conflicts. It auto-detects conventions from the repo rather than imposing its own.

---

## Beginner-Friendly Operations

These operations are for users who don't know Git. When they use casual language like "save my work", "sync", "backup", or "share progress", use these simplified workflows. **Always explain what you're doing in plain language** — avoid Git jargon unless explaining it.

### Save My Work / Sync to Cloud

When the user says things like "save my work", "sync", "backup to cloud", "upload my changes", or "save to GitHub":

1. First, check what's changed and the current state:
   ```bash
   git status
   git log --oneline -1  # see where we are
   ```

2. If there are changes to save, explain what files changed in plain terms:
   > "I found 3 files you've changed: `app.py`, `README.md`, and a new file `config.json`. I'll save these to the cloud."

3. Save everything (stage and commit):
   ```bash
   git add -A
   git commit -m "Save progress: <brief description of what changed>"
   ```
   Use a simple, descriptive message. If task IDs are used in the repo, include them.

4. Upload to the cloud:
   ```bash
   git push
   ```

5. If push fails due to remote changes, pull first and retry:
   ```bash
   git pull --rebase
   git push
   ```

6. Confirm success in plain language:
   > "Done! Your work is now saved to the cloud. Anyone with access to this project can see your latest changes."

### Share My Progress / Let Others See My Work

When the user wants to share their work or let teammates see what they've done:

1. First, save any unsaved work (use the "Save My Work" flow above)

2. Check if we're on a branch or main:
   ```bash
   git branch --show-current
   ```

3. **If on main**: Their work is already visible after pushing. Explain:
   > "Your changes are now on the main project. Everyone with access can see them!"

4. **If on a branch**: Offer to create a Pull Request so others can review:
   ```bash
   gh pr create --title "Work in progress: <description>" --body "Sharing my progress for feedback."
   ```
   Then provide the PR link:
   > "I've created a link you can share: <PR URL>. Others can see your work and leave comments there."

5. If they just want a quick link to share (no PR needed):
   ```bash
   # Get the repo URL and current branch
   gh repo view --json url -q '.url'
   git branch --show-current
   ```
   > "You can share this link: <repo-url>/tree/<branch-name> — it shows your current work."

### Get Latest Changes / Update My Copy

When the user says "get latest", "update", "sync down", "download changes", or "what did others change":

1. Save any local work first (if there are changes):
   ```bash
   git stash --include-untracked
   ```

2. Get the latest from the cloud:
   ```bash
   git pull
   ```

3. Restore their work on top:
   ```bash
   git stash pop
   ```
   If this causes conflicts, handle them gently (see "When Things Conflict" below).

4. Explain what happened:
   > "I've updated your copy with the latest changes from the cloud. You now have everyone's recent work."

### What Changed? / Show Me the History

When the user wants to see what's been happening:

1. Show recent activity in plain terms:
   ```bash
   git log --oneline --all -10
   ```

2. Translate this into plain language:
   > "Here's what's happened recently:
   > - 2 hours ago: Sarah added the login page
   > - Yesterday: You fixed the header bug
   > - 2 days ago: Mike updated the database settings"

3. If they want to see their own unsaved changes:
   ```bash
   git diff --stat
   ```
   > "You have changes in 2 files that haven't been saved to the cloud yet."

### When Things Conflict

If Git reports conflicts, don't panic the user. Explain simply:

> "It looks like someone else changed the same file you were working on. Let me help sort this out."

1. Show which files have conflicts:
   ```bash
   git diff --name-only --diff-filter=U
   ```

2. For each file, explain the situation:
   > "In `app.py`, you changed line 42, but someone else also changed that line. Here's what each version looks like..."

3. Ask the user which version they want, or offer to combine them:
   > "Would you like to keep your version, their version, or should I try to combine both?"

4. After resolving, complete the operation:
   ```bash
   git add <file>
   git rebase --continue  # or git commit if merging
   git push
   ```

5. Confirm:
   > "All sorted! Your work is now saved and up to date with everyone else's changes."

### Undo My Last Change / Go Back

When the user wants to undo something:

1. **If they haven't saved yet** (undo local edits):
   > "I'll restore the files to how they were before your recent edits."
   ```bash
   git checkout -- <file>  # or git restore <file>
   ```

2. **If they just saved but haven't synced** (undo last commit):
   > "I'll undo your last save, but keep your files as they are so you can make different changes."
   ```bash
   git reset --soft HEAD~1
   ```

3. **If they already synced to cloud** — be careful here:
   > "Your changes are already on the cloud. Undoing them would affect anyone who's already seen them. Are you sure? I can create a new save that reverses the changes instead."

   If they confirm, use a revert (safer than force push):
   ```bash
   git revert HEAD --no-edit
   git push
   ```

---

## Advanced Git Operations

The sections below are for users comfortable with Git terminology, or when the beginner flows above need more precision.

---

## Step 0: Detect Repo Conventions

Before doing anything, scan the repo to understand how it works. This avoids imposing generic patterns on a repo that already has its own style.

```bash
# Branch naming patterns
git branch -r --list 'origin/*' | head -20

# Recent commit message style
git log --oneline -15

# Check for PR templates
ls -la .github/PULL_REQUEST_TEMPLATE* .github/pull_request_template* 2>/dev/null

# Check for branch protection or workflow files
ls -la .github/workflows/ 2>/dev/null

# Check default branch name
git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null || echo "main"
```

From this, infer:

- **Branch naming**: If you see `feature/...`, `fix/...`, `chore/...` patterns, follow them. If branches are just descriptive slugs, do that instead. If there are task IDs in branch names (like `TASK-001-...`), include them.
- **Commit style**: If commits use conventional commits (`feat:`, `fix:`), follow that. If they're freeform, match the tone and length. If there's a pattern of including ticket/task IDs, include them.
- **Default branch**: Usually `main` or `master`. Use whatever the repo uses.
- **PR conventions**: If there's a template, follow it. If PRs tend to have a specific style (short title + description, or detailed checklists), match it.

If the repo is brand new or empty, fall back to sensible defaults: `feature/description`, `fix/description` for branches, and conventional commits.

## Creating a Branch

When the user wants to start work on something:

1. Make sure you're on the default branch and it's up to date:
   ```bash
   git checkout main && git pull origin main
   ```

2. Create and switch to a new branch. Name it based on detected conventions:
   ```bash
   git checkout -b <branch-name>
   ```

3. If the user mentioned a task ID (like TASK-001), incorporate it into the branch name following whatever pattern the repo uses.

4. Push the branch to set up tracking:
   ```bash
   git push -u origin <branch-name>
   ```

5. **Log to devlog:** Add an entry to `docs/devlog.md`:
   ```markdown
   - `HH:MM` [<branch-name>] Branch created from main
   ```
   If the devlog file doesn't exist, create it first (see devlog skill for template).

Tell the user what branch was created and that it's tracking the remote.

## Committing Changes

When the user wants to commit:

1. Check what's changed:
   ```bash
   git status
   git diff --stat
   ```

2. Stage the relevant files. Prefer staging specific files over `git add .` to avoid accidentally committing secrets or build artifacts:
   ```bash
   git add <specific-files>
   ```

3. Write the commit message matching the repo's style (detected in Step 0). Include:
   - A clear summary line (respect any length conventions you detected)
   - A body if the change is non-trivial
   - Task/ticket IDs if the repo convention includes them

4. Commit:
   ```bash
   git commit -m "summary" -m "body if needed"
   ```

5. Push:
   ```bash
   git push
   ```

6. **Log to devlog:** After each commit, add an entry to `docs/devlog.md`:
   ```markdown
   - `HH:MM` [context] COMMIT: <short-hash> — <commit message>
   ```
   Where `[context]` is the PR number if one exists, otherwise the branch name.

## Opening a Pull Request

Use the `gh` CLI for PR operations. Before opening:

1. Make sure all changes are committed and pushed
2. Check if a PR template exists and follow it
3. Create the PR:
   ```bash
   gh pr create --title "..." --body "..." --base main
   ```

If there's a PR template, populate its sections. If the repo links PRs to issues or tasks, include references (e.g., `Closes #123` or `Implements TASK-001`).

For the PR title, match the style of recent merged PRs in the repo.

4. **Log to devlog:** After creating the PR, add an entry to `docs/devlog.md`:
   ```markdown
   - `HH:MM` [PR-XXX] PR opened: <title>
   ```
   Also update any recent entries that used the branch name as context to use the PR number instead.

## Merging

When the user wants to merge:

1. Check PR status and reviews:
   ```bash
   gh pr status
   gh pr checks
   ```

2. **Check devlog for learnings:** Before merging, check if the Learnings section in `docs/devlog.md` has an entry for this PR. If not, remind the user:
   ```
   The devlog has no learnings recorded for PR-XXX.
   Consider adding insights before merging: /devlog learn "your reflection"
   ```
   This is a **warning only** — do not block the merge.

3. If checks pass and it's approved, merge using the repo's preferred strategy:
   ```bash
   # Check what merge strategies the repo tends to use
   gh pr list --state merged --limit 5 --json mergeCommit,title

   # Then merge accordingly
   gh pr merge --squash   # or --merge or --rebase depending on convention
   ```

4. **Log to devlog:** After merging, add an entry:
   ```markdown
   - `HH:MM` [PR-XXX] Merged into main
   ```

5. Clean up the branch after merge:
   ```bash
   git checkout main && git pull
   git branch -d <branch-name>
   ```

## Rebasing

When the user wants to rebase (e.g., their branch is behind main):

1. Fetch latest:
   ```bash
   git fetch origin
   ```

2. Rebase onto the default branch:
   ```bash
   git rebase origin/main
   ```

3. If there are conflicts, see the conflict resolution section below.

4. Force-push after successful rebase (since history changed):
   ```bash
   git push --force-with-lease
   ```

Use `--force-with-lease` instead of `--force` — it's safer because it won't overwrite someone else's push.

## Conflict Resolution

When conflicts arise during merge or rebase:

1. List conflicted files:
   ```bash
   git diff --name-only --diff-filter=U
   ```

2. For each conflicted file, read it and understand both sides of the conflict. The markers look like:
   ```
   <<<<<<< HEAD
   your changes
   =======
   their changes
   >>>>>>> branch-name
   ```

3. Resolve by editing the file to combine or choose the right version. Remove all conflict markers.

4. After resolving all files:
   ```bash
   git add <resolved-files>
   git rebase --continue   # if rebasing
   # or
   git commit              # if merging
   ```

5. Always tell the user what conflicts were found and how you resolved them, so they can verify.

## Checking Status

When the user wants to know what's going on:

```bash
# Local status
git status
git log --oneline -5

# PR status
gh pr status

# Check CI/checks on current PR
gh pr checks
```

## Safety Rules

- Never force-push to the default branch (main/master)
- Always use `--force-with-lease` instead of `--force`
- Don't amend commits that have already been pushed unless the user explicitly asks
- When in doubt about a destructive operation (reset, force push, branch deletion), confirm with the user first
- Don't commit files that look like secrets (.env, credentials, tokens, keys)
