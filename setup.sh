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

# Temporary file for modified .bashrc
TMP_BASHRC="$(mktemp)"

# Prepend missing aliases to the temp file
for ALIAS in "${ALIASES[@]}"; do
  if ! grep -qxF "$ALIAS" "$BASHRC"; then
    echo "$ALIAS" >> "$TMP_BASHRC"
  fi
done

# Append the existing .bashrc content
cat "$BASHRC" >> "$TMP_BASHRC"

# Replace the original .bashrc
mv "$TMP_BASHRC" "$BASHRC"

# Clone the taskwarrior repo if it doesn't exist
if [ ! -d "$REPO_DIR" ]; then
  echo "Cloning taskwarrior repo to $REPO_DIR..."
  mkdir -p "$HOME/hillbillyer"
  git clone https://github.com/hillbillyer/taskwarrior "$REPO_DIR"
fi

# Source .bashrc to apply aliases immediately (only affects current shell session)
source "$BASHRC"

echo "Setup complete."
