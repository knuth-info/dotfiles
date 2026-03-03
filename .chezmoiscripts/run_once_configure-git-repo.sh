#!/bin/bash
set -euo pipefail

CHEZMOI_SOURCE="${CHEZMOI_SOURCE_DIR%/}"
SSH_KEY="$HOME/.ssh/id_ed25519_knuth-info"

git -C "$CHEZMOI_SOURCE" config user.name "Marcus Knuth"
git -C "$CHEZMOI_SOURCE" config user.email "github@knuth.info"
git -C "$CHEZMOI_SOURCE" config core.sshCommand "ssh -i $SSH_KEY"

# Switch remote from HTTPS to SSH if needed
CURRENT_URL="$(git -C "$CHEZMOI_SOURCE" remote get-url origin)"
if [[ "$CURRENT_URL" == https://github.com/* ]]; then
    # Convert https://github.com/user/repo.git -> git@github.com:user/repo.git
    SSH_URL="${CURRENT_URL/https:\/\/github.com\//git@github.com:}"
    git -C "$CHEZMOI_SOURCE" remote set-url origin "$SSH_URL"
fi
