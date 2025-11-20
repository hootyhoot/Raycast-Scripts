#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Current Finder Folder in Code
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🧑‍🔧

# Documentation:
# @raycast.description Opens the current open finder directory in Visual Studio Code
# @raycast.author Mikhail

# Alias set to 'ov'

on run
  tell application "Finder"
    if exists (front window) then
      set dirPath to POSIX path of (target of front window as alias)
    else
      set dirPath to POSIX path of (desktop as alias)
    end if
  end tell

  -- Launch VS Code at that folder
  do shell script "/usr/bin/open -a 'Visual Studio Code' " & quoted form of dirPath

  return "Opened in VS Code: " & dirPath
end run