#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Edit .zshrc
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🧑‍💻

# Documentation:
# @raycast.description Opens .zshrc in lvim on Alacritty, then when saved will automatically run source command to load zsh changes
# @raycast.author Mikhail

# Set alias to 'ez'

#!/usr/bin/env bash
# edit-zshrc.sh — open Alacritty → nvim ~/.zshrc → source after quit

alacritty --working-directory "$HOME" \
  -e zsh -c 'nvim ~/.zshrc; status=$?; if [ $status -eq 0 ]; then source ~/.zshrc; fi' >/dev/null 2>&1

echo "✅ Reloaded ~/.zshrc"
