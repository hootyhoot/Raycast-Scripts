#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Current Finder File in Helix
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📖

# Documentation:
# @raycast.description Opens the current focused finder file in helix text editor
# @raycast.author Mikhail

# Set alias to 'oh'

on run
  tell application "Finder"
    set selectedItems to selection
    if (count of selectedItems) > 0 then
      set filePath to POSIX path of (item 1 of selectedItems as alias)
    else if exists (front window) then
      -- No selection, try to get the folder path
      set filePath to POSIX path of (target of front window as alias)
    else
      -- Fallback to Desktop
      set filePath to POSIX path of (desktop as alias)
    end if
  end tell

  set shellCommand to "/opt/homebrew/bin/hx " & quoted form of filePath & "; exec zsh"

  -- Launch Alacritty CLI directly
  do shell script "/opt/homebrew/bin/alacritty -e zsh -c " & quoted form of shellCommand & " >/dev/null 2>&1 &"

  return "Opened in Helix: " & filePath
end run
