# 📝 Neovim Note-Taking Setup

A lightweight, fast, and feature-rich Neovim configuration optimized for note-taking. Uses **~50-100MB RAM** (vs. Obsidian's 300-500MB or Notion's 400-600MB).

## ✨ Features

### Core Note-Taking
- ⚡ **Auto-save** - Notes save automatically as you type
- 🔍 **Fuzzy search** - Find notes instantly with Telescope
- 📁 **File explorer** - Browse your notes with nvim-tree
- 📅 **Daily notes** - Quick access to daily journal entries
- 📋 **Templates** - Pre-made templates for meetings, projects, ideas
- 🏷️ **Tag support** - Search notes by tags
- ☑️ **Checkbox toggling** - Manage tasks with ease

### Markdown Support
- 🎨 **Syntax highlighting** - Beautiful markdown rendering
- 👁️ **Live preview** - See rendered markdown in browser
- ✏️ **Auto-formatting** - Lists and checkboxes continue automatically
- **Quick formatting** - Bold, italic, code, strikethrough shortcuts
- 🔗 **Link insertion** - Easy link creation

### UI & Theme
- 🌙 **Dark theme** - Catppuccin Mocha (easy on the eyes)
- 📊 **Status line** - Clean, informative lualine
- 🎯 **Minimal UI** - Distraction-free writing experience

### Performance
- 🚀 **Lazy loading** - Plugins load only when needed
- 💾 **Low memory** - No swap files, optimized for speed
- ⚡ **Fast startup** - Typically under 100ms

## 📦 Installation

### Prerequisites
- Neovim 0.9+ (check with `nvim --version`)
- Git
- Node.js (for markdown preview)

### Quick Install

```bash
# 1. Download the setup
cd /path/to/neovim-notes-setup

# 2. Run the installer
chmod +x install.sh
./install.sh
```

The installer will:
- ✅ Backup your existing config (if any)
- ✅ Install the configuration
- ✅ Create notes directory at `~/notes`
- ✅ Create a welcome note with instructions
- ✅ Set up plugin manager

### First Launch

1. Open Neovim: `nvim`
2. Wait for plugins to install (1-2 minutes on first launch)
3. Press `Space + f + f` to find your welcome note
4. Start taking notes!

## ⌨️ Keybindings

All keybindings use **Space** as the leader key.

### Note Management

| Key | Action |
|-----|--------|
| `Space + n + n` | Create new note |
| `Space + n + d` | Open/create daily note |
| `Space + f + f` | Find notes (fuzzy search) |
| `Space + f + g` | Search inside notes (grep) |
| `Space + f + r` | Recent files |
| `Space + w` | Save note |

### File Navigation

| Key | Action |
|-----|--------|
| `Space + e` | Toggle file explorer |
| `Space + o` | Focus file explorer |
| `Tab` | Next buffer |
| `Shift + Tab` | Previous buffer |
| `Space + b + d` | Close buffer |

### Markdown Formatting

Select text in visual mode (`v`), then:

| Key | Action |
|-----|--------|
| `Space + m + b` | **Bold** |
| `Space + m + i` | *Italic* |
| `Space + m + c` | `Code` |
| `Space + m + s` | ~~Strikethrough~~ |
| `Space + m + l` | Insert link |

### Tasks & Checkboxes

| Key | Action |
|-----|--------|
| `Space + m + t` | Toggle checkbox (on checkbox line) |

### Markdown Preview

| Key | Action |
|-----|--------|
| `Space + m + p` | Start preview in browser |
| `Space + m + s` | Stop preview |

### Window Management

| Key | Action |
|-----|--------|
| `Space + s + v` | Split vertically |
| `Space + s + h` | Split horizontally |
| `Space + s + c` | Close split |
| `Ctrl + h/j/k/l` | Navigate between splits |

### Templates

Use commands in normal mode:

| Command | Description |
|---------|-------------|
| `:NewTemplate meeting` | Meeting notes template |
| `:NewTemplate project` | Project planning template |
| `:NewTemplate idea` | Idea capture template |

### Search by Tag

```vim
:NotesByTag work
```

## 📂 File Structure

```
~/
├── .config/nvim/
│   └── init.lua          # Your Neovim configuration
└── notes/                # Your notes directory
    ├── daily/            # Daily notes
    ├── welcome.md        # Getting started guide
    └── ...               # Your other notes
```

## 🎯 Workflow Examples

### Starting Your Day
1. `nvim` - Open Neovim
2. `Space + n + d` - Open today's daily note
3. Start writing!

### Creating a Project Note
1. `Space + n + n` - New note
2. Type: `my-project`
3. Type: `:NewTemplate project`
4. Fill in the template

### Finding a Note
1. `Space + f + f` - Opens fuzzy finder
2. Start typing the note name
3. Press `Enter` to open

### Searching Across Notes
1. `Space + f + g` - Opens live grep
2. Type your search term
3. Press `Enter` to jump to match

## 🎨 Customization

Edit `~/.config/nvim/init.lua` to customize:

- **Change theme**: Modify the `catppuccin` setup section
- **Add keybindings**: Add to the keymaps section
- **Adjust auto-save**: Modify the `TextChanged` autocmd
- **Change notes directory**: Update `notes_dir` variable

## 🔧 Troubleshooting

### Plugins not installing?
```bash
# Remove plugin data and restart
rm -rf ~/.local/share/nvim
nvim
```

### Markdown preview not working?
```bash
# Install Node.js if not already installed
# Then reinstall the plugin
cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app
npm install
```

### File explorer not showing?
Press `Space + e` to toggle it on.

### Auto-save not working?
Make sure you're editing a `.md` file. Auto-save only works for markdown files.

## 💡 Tips & Tricks

1. **Use tags liberally**: Add tags like `#work #personal #important` to organize notes
2. **Daily notes for tasks**: Use the checkbox feature in daily notes for task management
3. **Templates save time**: Create your own templates in the config
4. **Fuzzy search is powerful**: You don't need to type the exact filename
5. **Split windows**: Work on multiple notes at once with splits

## 📊 Performance Comparison

| App | RAM Usage | Startup Time |
|-----|-----------|--------------|
| This Setup | 50-100 MB | < 100ms |
| Obsidian | 300-500 MB | 1-3s |
| Notion | 400-600 MB | 2-5s |
| VS Code | 200-400 MB | 1-2s |

## 🆘 Getting Help

- Check the welcome note: Open `~/notes/welcome.md` in Neovim
- View this README: Keep it handy for reference
- Neovim help: Type `:help` in Neovim

## 🎓 Learning Resources

- **Neovim basics**: https://neovim.io/doc/user/
- **Lua configuration**: https://learnxinyminutes.com/docs/lua/
- **Markdown guide**: https://www.markdownguide.org/

## ✅ What's Included

### Plugins (9 total - lightweight!)
1. **Catppuccin** - Dark theme
2. **nvim-tree** - File explorer
3. **Telescope** - Fuzzy finder
4. **Treesitter** - Syntax highlighting
5. **markdown-preview** - Live preview
6. **nvim-autopairs** - Auto-close brackets
7. **vim-markdown** - Markdown enhancements
8. **lualine** - Status line
9. **indent-blankline** - Indent guides

### Custom Features
- Auto-save for markdown
- Daily notes system
- Template system (3 templates)
- Tag search functionality
- Checkbox toggling
- Auto-list continuation
- Link insertion helper

## 📝 Example Note

```markdown
# My Project

**Status:** In Progress
**Created:** 2025-02-04
**Tags:** #work #important

## Overview

This is my awesome project where I'm building something cool.

## Tasks

- [x] Initial planning
- [ ] Design mockups
- [ ] Start development

## Notes

Remember to check the documentation at [project website](https://example.com)

## Ideas

- Could add feature X
- Integration with Y might be useful
```

## 🚀 Next Steps

1. Explore the welcome note in `~/notes/welcome.md`
2. Create your first note with `Space + n + n`
3. Customize the config to your liking
4. Happy note-taking! 📝

---

**Made with ❤️ for productive note-taking**
