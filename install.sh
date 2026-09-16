#!/usr/bin/env bash
# lazy-dev install script for Mac/Linux
# Usage: bash install.sh

set -e

REPO_URL="https://github.com/Dang3rStrang3r/lazy-dev-skill.git"
SKILL_NAME="lazy-dev"

echo "Installing $SKILL_NAME..."

TARGETS=(
    "Claude Code:$HOME/.claude/skills/$SKILL_NAME"
    "Cursor:$HOME/.cursor/skills/$SKILL_NAME"
    "Gemini CLI:$HOME/.gemini/skills/$SKILL_NAME"
)

INSTALLED=0

for TARGET in "${TARGETS[@]}"; do
    NAME="${TARGET%%:*}"
    PATH_TARGET="${TARGET#*:}"
    PARENT_DIR="$(dirname "$PATH_TARGET")"

    if [ -d "$PARENT_DIR" ]; then
        echo "  -> $NAME: $PATH_TARGET"
        rm -rf "$PATH_TARGET"
        git clone --quiet "$REPO_URL" "$PATH_TARGET"
        INSTALLED=$((INSTALLED + 1))
    else
        echo "  -- $NAME: not found, skipping"
    fi
done

if [ "$INSTALLED" -eq 0 ]; then
    echo ""
    echo "No supported agent found."
    echo "Install Claude Code, Cursor, or Gemini CLI first, or clone manually:"
    echo "  git clone $REPO_URL <your-skills-dir>/$SKILL_NAME"
    exit 1
fi

echo ""
echo "Done. Installed to $INSTALLED location(s)."