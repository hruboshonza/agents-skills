#!/bin/sh
# New-machine setup: symlink every skill in ~/.agents/skills into ~/.claude/skills.
# Idempotent — skips names that already exist.
set -eu
mkdir -p "$HOME/.claude/skills"
for skill in "$HOME/.agents/skills"/*/; do
    name=$(basename "$skill")
    target="$HOME/.claude/skills/$name"
    [ -e "$target" ] || [ -L "$target" ] || ln -s "../../.agents/skills/$name" "$target"
done
echo "Linked. Check: ls -la ~/.claude/skills/"
