# Customisation Instructions

# open-current-finder-folder-in-alacritty

This AppleScript opens the current Finder folder in your terminal of choice.

### To customize for your terminal:

Find line 30 and update the terminal path and flags:

```applescript
do shell script "/opt/homebrew/bin/alacritty --working-directory " & quoted form of dirPath & " -e zsh -c " & quoted form of shellCommand & " >/dev/null 2>&1 &"
```

Replace `/opt/homebrew/bin/alacritty --working-directory` with your terminal's path and working directory flag.

### Terminal-specific configurations:

**For iTerm2:**
Replace line 30 with:
```applescript
tell application "iTerm"
    activate
    create window with default profile
    tell current session of current window
        write text "cd " & quoted form of dirPath
    end tell
end tell
```

**For macOS Terminal:**
Replace line 30 with:
```applescript
tell application "Terminal"
    activate
    do script "cd " & quoted form of dirPath
end tell
```

**For Kitty:**
```applescript
do shell script "/opt/homebrew/bin/kitty --working-directory " & quoted form of dirPath & " >/dev/null 2>&1 &"
```

**For WezTerm:**
```applescript
do shell script "/opt/homebrew/bin/wezterm start --cwd " & quoted form of dirPath & " >/dev/null 2>&1 &"
```

**For Alacritty (different install location):**
Common paths: `/opt/homebrew/bin/alacritty`, `/usr/local/bin/alacritty`, `~/Applications/Alacritty.app/Contents/MacOS/alacritty`, or find the location of your claude by using the command `which claude`

---

# open-current-finder-folder-in-claude-code

This AppleScript opens the current Finder folder in Claude Code within your terminal of choice.

### Step 1: Configure Claude Code path

Find line 27 and update your username:

```applescript
set shellCommand to "/Users/{Your local user name}/.npm-global/bin/claude -c || /Users/{Your local user name}/.npm-global/bin/claude; exec zsh"
```

**Replace `{Your local user name}`** with your actual macOS username.

**If Claude is installed elsewhere**, replace the entire path. Common locations:
- `~/.npm-global/bin/claude` (default npm global)
- `/usr/local/bin/claude`
- `~/.local/bin/claude`
- `/opt/homebrew/bin/claude`

### Step 2: Configure your terminal

Find line 27 and update the terminal path:

```applescript
do shell script "/opt/homebrew/bin/alacritty --working-directory " & quoted form of dirPath & " -e zsh -c " & quoted form of shellCommand & " >/dev/null 2>&1 &"
```

**For iTerm2:**
Replace line 27 with:
```applescript
tell application "iTerm"
    activate
    create window with default profile
    tell current session of current window
        write text "cd " & quoted form of dirPath & " && " & shellCommand
    end tell
end tell
```

**For macOS Terminal:**
Replace line 27 with:
```applescript
tell application "Terminal"
    activate
    do script "cd " & quoted form of dirPath & " && " & shellCommand
end tell
```

**For Kitty:**
```applescript
do shell script "/opt/homebrew/bin/kitty --working-directory " & quoted form of dirPath & " -e zsh -c " & quoted form of shellCommand & " >/dev/null 2>&1 &"
```

**For WezTerm:**
```applescript
do shell script "/opt/homebrew/bin/wezterm start --cwd " & quoted form of dirPath & " -- zsh -c " & quoted form of shellCommand & " >/dev/null 2>&1 &"
```

---

# open-current-finder-folder-in-code

This AppleScript opens the current Finder folder in Visual Studio Code.

### No customization needed

This script works out of the box for standard VS Code installations. It uses the `open -a` command to launch VS Code with the current Finder directory.

### However, if VS Code is installed in a non-standard location:

Find line 27 and update the path:

```applescript
do shell script "open -a '/Applications/Visual Studio Code.app' " & quoted form of dirPath
```

Replace `/Applications/Visual Studio Code.app` with your VS Code installation path.

**Common alternative locations:**
- `~/Applications/Visual Studio Code.app` (user-specific install)
- `/Applications/VSCodium.app` (VSCodium variant)
- `/Applications/Visual Studio Code - Insiders.app` (Insiders build)

---

# edit-.zshrc

This script opens your `.zshrc` file in a terminal editor, then automatically reloads it after you save and exit.

### To customize for your terminal and editor:

1. **Choose your terminal** - Find line 20 and change `alacritty` to one of:
   - `alacritty` - Alacritty terminal
   - `iterm` - iTerm2
   - `terminal` - Default macOS Terminal
   - `kitty` - Kitty terminal
   - `wezterm` - WezTerm

2. **Choose your editor** - On the same line, change `nvim` to:
   - `nvim` - Neovim
   - `vim` - Vim
   - `nano` - Nano editor
   - `micro` - Micro editor

### Current structure:
```bash
alacritty --working-directory "$HOME" \
  -e zsh -c 'nvim ~/.zshrc; status=$?; if [ $status -eq 0 ]; then source ~/.zshrc; fi' >/dev/null 2>&1
```

### For iTerm2 users:
Replace the entire command block (lines 20-21) with:
```bash
osascript -e "tell application \"iTerm\"
  activate
  create window with default profile
  tell current session of current window
    write text \"nvim ~/.zshrc && source ~/.zshrc && echo '✅ Reloaded ~/.zshrc'\"
  end tell
end tell" &
```
(Replace `nvim` with your preferred editor)

### For macOS Terminal users:
Replace the entire command block (lines 20-21) with:
```bash
osascript -e "tell application \"Terminal\"
  activate
  do script \"nvim ~/.zshrc && source ~/.zshrc && echo '✅ Reloaded ~/.zshrc'\"
end tell" &
```
(Replace `nvim` with your preferred editor)

### For Kitty users:
Replace with:
```bash
kitty --working-directory "$HOME" zsh -c 'nvim ~/.zshrc && source ~/.zshrc && echo "✅ Reloaded ~/.zshrc"' &
```

### For WezTerm users:
Replace with:
```bash
wezterm start --cwd "$HOME" -- zsh -c 'nvim ~/.zshrc && source ~/.zshrc && echo "✅ Reloaded ~/.zshrc"' &
```
