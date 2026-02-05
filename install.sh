#!/bin/bash

# ============================================================================
# NEOVIM NOTE-TAKING SETUP INSTALLER
# ============================================================================

set -e  # Exit on error

echo "=========================================="
echo "  Neovim Note-Taking Setup Installer"
echo "=========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo -e "${RED}Error: Neovim is not installed!${NC}"
    echo "Please install Neovim first:"
    echo "  Ubuntu/Debian: sudo apt install neovim"
    echo "  Fedora: sudo dnf install neovim"
    echo "  Arch: sudo pacman -S neovim"
    echo "  macOS: brew install neovim"
    exit 1
fi

echo -e "${GREEN}✓ Neovim is installed${NC}"

# Check Neovim version
NVIM_VERSION=$(nvim --version | head -n1 | grep -oP '\d+\.\d+' | head -n1)
REQUIRED_VERSION="0.9"

if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$NVIM_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echo -e "${RED}Error: Neovim version $REQUIRED_VERSION or higher is required${NC}"
    echo "Current version: $NVIM_VERSION"
    exit 1
fi

echo -e "${GREEN}✓ Neovim version is compatible ($NVIM_VERSION)${NC}"

# Check for git
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: Git is not installed!${NC}"
    echo "Please install git first"
    exit 1
fi

echo -e "${GREEN}✓ Git is installed${NC}"

# Backup existing config if it exists
NVIM_CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"

if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo -e "${YELLOW}Existing Neovim config found${NC}"
    read -p "Do you want to backup and replace it? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Backing up to: $BACKUP_DIR"
        mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
        echo -e "${GREEN}✓ Backup created${NC}"
    else
        echo "Installation cancelled"
        exit 0
    fi
fi

# Create config directory
mkdir -p "$NVIM_CONFIG_DIR"
echo -e "${GREEN}✓ Config directory created${NC}"

# Copy init.lua
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/init.lua" ]; then
    cp "$SCRIPT_DIR/init.lua" "$NVIM_CONFIG_DIR/init.lua"
    echo -e "${GREEN}✓ Configuration file copied${NC}"
else
    echo -e "${RED}Error: init.lua not found in script directory${NC}"
    exit 1
fi

# Create notes directory
NOTES_DIR="$HOME/notes"
mkdir -p "$NOTES_DIR"
mkdir -p "$NOTES_DIR/daily"
echo -e "${GREEN}✓ Notes directory created at $NOTES_DIR${NC}"

# Create a sample note
cat > "$NOTES_DIR/welcome.md" << 'EOF'
# Welcome to Your Note-Taking System! 📝

This is your new Neovim-based note-taking setup. Here's how to get started:

## Quick Start Guide

### Creating Notes
- **New note**: Press `Space` + `n` + `n`, then type the note name
- **Daily note**: Press `Space` + `n` + `d` (creates/opens today's note)

### Finding Notes
- **Find files**: Press `Space` + `f` + `f` to fuzzy search all notes
- **Search content**: Press `Space` + `f` + `g` to search inside notes
- **Recent files**: Press `Space` + `f` + `r`

### Markdown Formatting
Select text in visual mode (press `v` and move cursor), then:
- **Bold**: `Space` + `m` + `b`
- **Italic**: `Space` + `m` + `i`
- **Code**: `Space` + `m` + `c`
- **Strikethrough**: `Space` + `m` + `s`

### Checkbox Management
- **Toggle checkbox**: `Space` + `m` + `t` (on the line with checkbox)

Example checkboxes:
- [ ] Incomplete task
- [x] Completed task

### Markdown Preview
- **Start preview**: `Space` + `m` + `p`
- **Stop preview**: `Space` + `m` + `s`

### File Navigation
- **Toggle file tree**: `Space` + `e`
- **Focus file tree**: `Space` + `o`
- **Next buffer**: `Tab`
- **Previous buffer**: `Shift` + `Tab`
- **Close buffer**: `Space` + `b` + `d`

### Templates
Use the `:NewTemplate` command followed by type:
- `:NewTemplate meeting` - Meeting notes
- `:NewTemplate project` - Project planning
- `:NewTemplate idea` - Idea capture

### Search by Tags
Use tags in your notes like `#important #work #personal`

Search for tagged notes:
```
:NotesByTag work
```

## Tips

1. **Auto-save is enabled** - Your notes save automatically when you make changes
2. **Press Enter in lists** - Automatically continues lists and checkboxes
3. **Use tags liberally** - Makes searching easier
4. **Daily notes** - Great for journaling and task tracking

## File Explorer

The file tree on the left shows your notes directory. You can:
- Navigate with `j` (down) and `k` (up)
- Open files with `Enter`
- Create files with `a`
- Delete files with `d`
- Rename files with `r`

## Customization

Your config is located at: `~/.config/nvim/init.lua`

Feel free to modify keybindings and settings to your preference!

---

**Happy note-taking!** 🎉
EOF

echo -e "${GREEN}✓ Welcome note created${NC}"

echo ""
echo "=========================================="
echo -e "${GREEN}Installation Complete!${NC}"
echo "=========================================="
echo ""
echo "Your notes are stored in: $NOTES_DIR"
echo ""
echo "To start taking notes:"
echo "  1. Run: nvim"
echo "  2. Wait for plugins to install (first launch only)"
echo "  3. Press: Space + f + f to open the welcome note"
echo ""
echo "Key bindings cheatsheet:"
echo "  Space + n + n  → New note"
echo "  Space + n + d  → Daily note"
echo "  Space + f + f  → Find notes"
echo "  Space + f + g  → Search in notes"
echo "  Space + e      → Toggle file explorer"
echo ""
echo -e "${YELLOW}Note: First launch will install plugins automatically.${NC}"
echo -e "${YELLOW}This may take 1-2 minutes.${NC}"
echo ""

# Optional: Launch Neovim
read -p "Would you like to launch Neovim now? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Launching Neovim..."
    echo "Note: Plugins will install automatically. Please wait..."
    sleep 2
    nvim "$NOTES_DIR/welcome.md"
fi

echo ""
echo "Setup complete! Happy note-taking! 📝"
