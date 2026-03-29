#!/bin/bash
# Run this once to set up and deploy to GitHub Pages

# Create repo if it doesn't exist
gh repo create bk-explorer --public --source=. --push 2>/dev/null || true

# Push to main
git add -A
git commit -m "deploy bk explorer"
BRANCH=$(git branch --show-current)
git push origin "$BRANCH"

# Enable GitHub Pages on main branch
OWNER=$(gh api user -q .login)
gh api "repos/${OWNER}/bk-explorer/pages" -X POST -f source.branch="$BRANCH" -f source.path=/ 2>/dev/null || \
gh api "repos/${OWNER}/bk-explorer/pages" -X PUT -f source.branch="$BRANCH" -f source.path=/

echo ""
echo "Done! Your site will be live at:"
echo "https://$(gh api user -q .login).github.io/bk-explorer/"
echo "(May take 1-2 minutes to go live)"
