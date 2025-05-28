#!/bin/bash

# Define bashrc path and repo directory
BASHRC="$HOME/.bashrc"
REPO_DIR="$HOME/hillbillyer/taskwarrior"

# Ensure .bashrc exists
[ -f "$BASHRC" ] || touch "$BASHRC"

# Aliases to add
ALIASES=(
  "alias add='bash $REPO_DIR/add-task.sh'"
  "alias done='bash $REPO_DIR/done-task.sh'"
  "alias mod='bash $REPO_DIR/mod-task.sh'"
)

# Add each alias if it doesn't already exist
for ALIAS in "${ALIASES[@]}"; do
  grep -qxF "$ALIAS" "$BASHRC" || echo "$ALIAS" >> "$BASHRC"
done

# Clone the taskwarrior repo if it doesn't exist
if [ ! -d "$REPO_DIR" ]; then
  echo "Cloning taskwarrior repo to $REPO_DIR..."
  mkdir -p "$HOME/hillbillyer"
  git clone https://github.com/hillbillyer/taskwarrior "$REPO_DIR"
fi

# Source .bashrc to apply aliases immediately (only affects current shell session)
source "$BASHRC"

echo "Setup complete."
