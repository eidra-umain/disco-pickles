---
name: github
description: |
  Full Git and GitHub workflow skill — branching, commits, PRs, merges, rebasing, and conflict resolution using the `gh` CLI and `git`. Use this skill whenever the user asks to create a branch, open a PR, merge changes, rebase, resolve conflicts, check PR status, manage releases, or do anything involving git operations in a repository. Also trigger when the user references task IDs (like TASK-001) and wants to start working on them, since that implies branch creation and workflow setup. If the user says "start working on TASK-X", "ship this", "open a PR", "merge", "rebase", or mentions branches in any way, use this skill.
---

# GitHub Workflow

This skill handles the full Git + GitHub lifecycle: branching, committing, pushing, opening PRs, merging, rebasing, and resolving conflicts. It auto-detects conventions from the repo rather than imposing its own.

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

## Merging

When the user wants to merge:

1. Check PR status and reviews:
   ```bash
   gh pr status
   gh pr checks
   ```

2. If checks pass and it's approved, merge using the repo's preferred strategy:
   ```bash
   # Check what merge strategies the repo tends to use
   gh pr list --state merged --limit 5 --json mergeCommit,title

   # Then merge accordingly
   gh pr merge --squash   # or --merge or --rebase depending on convention
   ```

3. Clean up the branch after merge:
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
