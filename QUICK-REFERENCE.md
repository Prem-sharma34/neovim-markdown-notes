# Neovim Note-Taking - Quick Reference Card

## 🚀 Essential Commands (Leader = Space)

### Create & Find Notes
```
Space + n + n    →  New note
Space + n + d    →  Daily note
Space + f + f    →  Find notes
Space + f + g    →  Search in notes
```

### File Explorer
```
Space + e    →  Toggle file tree
Space + o    →  Focus file tree
```

### In File Explorer:
```
j/k          →  Move up/down
Enter        →  Open file
a            →  Create file
d            →  Delete file
r            →  Rename file
```

### Markdown Formatting
**First select text with `v`, then:**
```
Space + m + b    →  Bold
Space + m + i    →  Italic
Space + m + c    →  Code
Space + m + s    →  Strikethrough
```

### Tasks
```
Space + m + t    →  Toggle checkbox [ ] ↔ [x]
```

### Preview
```
Space + m + p    →  Start preview
Space + m + s    →  Stop preview
```

### Buffers & Windows
```
Tab              →  Next note
Shift + Tab      →  Previous note
Space + b + d    →  Close note

Space + s + v    →  Split vertical
Space + s + h    →  Split horizontal
Ctrl + h/j/k/l   →  Navigate splits
```

### Templates
```
:NewTemplate meeting    →  Meeting notes
:NewTemplate project    →  Project notes
:NewTemplate idea       →  Idea notes
```

### Search
```
:NotesByTag work    →  Find notes tagged #work
```

### Basic Vim
```
i            →  Insert mode
Esc          →  Normal mode
:w           →  Save (but auto-save is on!)
:q           →  Quit
:wq          →  Save & quit
u            →  Undo
Ctrl + r     →  Redo
```

### Movement
```
h/j/k/l      →  Left/Down/Up/Right
w            →  Next word
b            →  Previous word
0            →  Start of line
$            →  End of line
gg           →  Top of file
G            →  Bottom of file
```

## 📁 File Locations

```
Config:    ~/.config/nvim/init.lua
Notes:     ~/notes/
Daily:     ~/notes/daily/
```

## 💡 Pro Tips

1. Don't save manually - auto-save handles it!
2. Use fuzzy find (Space + f + f) - you don't need exact names
3. Tag everything with #tags for easy searching
4. Press Enter in lists - they continue automatically
5. Daily notes are great for journaling and task tracking

## 🆘 Quick Help

```
:help              →  Neovim help
:checkhealth       →  Diagnose issues
:Lazy              →  Plugin manager
```

## 🎯 Common Workflows

**Daily Journaling:**
1. `nvim`
2. `Space + n + d`
3. Start writing!

**New Project:**
1. `Space + n + n` → type name
2. `:NewTemplate project`
3. Fill it in

**Find Old Note:**
1. `Space + f + f`
2. Type partial name
3. Enter

---

**Print this and keep it handy!**
