#!/bin/zsh

# Function: deploy to sandbox environment
gdsb() {
  local msg="$1"
  local current_branch=$(git rev-parse --abbrev-ref HEAD)

  # Prevent running from sandbox
  if [[ "$current_branch" == "sandbox" ]]; then
    echo "❌ You must be on a different branch, not 'sandbox'."
    return 1
  fi

  echo "🔎 Current branch: $current_branch"

  # Prevent commit and push on main
  if [[ "$current_branch" == "main" ]]; then
    echo "🚫 Commit and push to 'main' are blocked for this command."
    echo "Proceeding WITHOUT commit/push..."
  else
    # Commit changes if any
    if git diff --quiet && git diff --cached --quiet; then
      echo "ℹ️ No changes to commit."
    else
      echo "📝 Committing changes..."
      git commit -m "$msg"
    fi

    # Push if ahead
    if git status | grep -q "Your branch is ahead"; then
      echo "📤 Pushing changes to remote..."
      git push
    else
      echo "ℹ️ Nothing to push."
    fi
  fi

  echo "🔀 Switching to sandbox..."
  git checkout sandbox || return 1

  echo "🔄 Merging $current_branch into sandbox..."
  git merge "$current_branch"

  echo "📤 Pushing sandbox..."
  git push

  echo "↩️ Returning to $current_branch..."
  git checkout "$current_branch"

  echo "✅ Sandbox deploy finished."
}
