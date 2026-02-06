-- ============================================================================
-- NEOVIM NOTE-TAKING CONFIGURATION
-- Lightweight, fast, and feature-rich note-taking setup
-- ============================================================================

-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.conceallevel = 2
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

-- Set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ============================================================================
-- PLUGIN MANAGER - Lazy.nvim
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- THEME SELECTION
-- Change this to switch themes easily!
-- ============================================================================
local ACTIVE_THEME = "catppuccin" -- Options: github_dark, github_dark_dimmed, 
                                    -- carbonfox, oxocarbon, moonlight, tokyonight,
                                    -- vscode, kanagawa, catppuccin

-- ============================================================================
-- PLUGINS
-- ============================================================================
require("lazy").setup({
  -- ============================================================================
  -- THEMES COLLECTION - All minimal dark themes
  -- ============================================================================
  
  -- GitHub Theme (Official GitHub colors)
  {
    "projekt0n/github-nvim-theme",
    lazy = ACTIVE_THEME:match("github") == nil,
    priority = 1000,
    config = function()
      require('github-theme').setup({
        options = {
          transparent = false,
          hide_end_of_buffer = true,
          hide_nc_statusline = true,
          styles = {
            comments = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
          }
        }
      })
      if ACTIVE_THEME == "github_dark" then
        vim.cmd('colorscheme github_dark')
      elseif ACTIVE_THEME == "github_dark_dimmed" then
        vim.cmd('colorscheme github_dark_dimmed')
      elseif ACTIVE_THEME == "github_dark_high_contrast" then
        vim.cmd('colorscheme github_dark_high_contrast')
      end
    end,
  },

  -- Nightfox (Carbonfox variant - sleek and minimal)
  {
    'EdenEast/nightfox.nvim',
    lazy = ACTIVE_THEME ~= "carbonfox",
    priority = 1000,
    config = function()
      require('nightfox').setup({
        options = {
          transparent = false,
          terminal_colors = true,
          dim_inactive = false,
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        }
      })
      if ACTIVE_THEME == "carbonfox" then
        vim.cmd('colorscheme carbonfox')
      end
    end,
  },

  -- Oxocarbon (Modern IBM Carbon-inspired)
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = ACTIVE_THEME ~= "oxocarbon",
    priority = 1000,
    config = function()
      if ACTIVE_THEME == "oxocarbon" then
        vim.opt.background = "dark"
        vim.cmd('colorscheme oxocarbon')
      end
    end,
  },

  -- Moonlight (Deep blue-purple tones)
  {
    'shaunsingh/moonlight.nvim',
    lazy = ACTIVE_THEME ~= "moonlight",
    priority = 1000,
    config = function()
      if ACTIVE_THEME == "moonlight" then
        vim.cmd('colorscheme moonlight')
      end
    end,
  },

  -- Tokyo Night (Clean and modern)
  {
    'folke/tokyonight.nvim',
    lazy = ACTIVE_THEME ~= "tokyonight",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- storm, moon, night
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
        },
      })
      if ACTIVE_THEME == "tokyonight" then
        vim.cmd('colorscheme tokyonight')
      end
    end,
  },

  -- VSCode Dark+ (Familiar VSCode aesthetic)
  {
    'Mofiqul/vscode.nvim',
    lazy = ACTIVE_THEME ~= "vscode",
    priority = 1000,
    config = function()
      require('vscode').setup({
        transparent = false,
        italic_comments = true,
        disable_nvimtree_bg = true,
      })
      if ACTIVE_THEME == "vscode" then
        vim.cmd('colorscheme vscode')
      end
    end,
  },

  -- Kanagawa (Inspired by the Great Wave painting)
  {
    'rebelot/kanagawa.nvim',
    lazy = ACTIVE_THEME ~= "kanagawa",
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        keywordStyle = { italic = false },
        transparent = false,
      })
      if ACTIVE_THEME == "kanagawa" then
        vim.cmd('colorscheme kanagawa')
      end
    end,
  },

  -- Catppuccin (Your original theme - kept as fallback)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = ACTIVE_THEME ~= "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        integrations = {
          treesitter = true,
          telescope = true,
          nvimtree = true,
          markdown = true,
        },
      })
      if ACTIVE_THEME == "catppuccin" then
        vim.cmd.colorscheme "catppuccin"
      end
    end,
  },

  -- ============================================================================
  -- ESSENTIAL PLUGINS (Same as your original config)
  -- ============================================================================

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })
    end,
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              preview_width = 0.55,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
    end,
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master", 
    config = function()
      local status, configs = pcall(require, "nvim-treesitter.configs")
      if not status then 
        vim.notify("Treesitter config module failed to load", vim.log.levels.ERROR)
        return 
      end

      configs.setup({
        ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = 'dark'
    end,
    ft = { "markdown" },
  },

  -- Auto-pairs for brackets
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  -- Better markdown editing
  {
    "preservim/vim-markdown",
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 2
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_new_list_item_indent = 2
    end,
  },

  -- Status line (automatically adapts to theme)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- Auto-detect theme for lualine
      local theme_map = {
        github_dark = 'auto',
        github_dark_dimmed = 'auto',
        carbonfox = 'nightfox',
        oxocarbon = 'auto',
        moonlight = 'auto',
        tokyonight = 'tokyonight',
        vscode = 'vscode',
        kanagawa = 'kanagawa',
        catppuccin = 'catppuccin',
      }
      
      require('lualine').setup({
        options = {
          theme = theme_map[ACTIVE_THEME] or 'auto',
          component_separators = '|',
          section_separators = '',
        },
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = false },
      })
    end,
  },
})

-- ============================================================================
-- NOTE-TAKING SPECIFIC CONFIGURATION
-- ============================================================================

-- Notes directory
local notes_dir = vim.fn.expand("~/notes")

-- Create notes directory if it doesn't exist
if vim.fn.isdirectory(notes_dir) == 0 then
  vim.fn.mkdir(notes_dir, "p")
end

-- Auto-save for markdown files
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
  pattern = "*.md",
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
      vim.cmd("silent! write")
    end
  end,
})

-- Auto-format lists when pressing enter
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("i", "<CR>", function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      
      local checkbox = line:match("^%s*[-*+]%s+%[.%]%s+")
      local bullet = line:match("^%s*[-*+]%s+")
      local numbered = line:match("^%s*%d+%.%s+")
      
      if checkbox then
        local indent = line:match("^%s*")
        return "<CR>" .. indent .. "- [ ] "
      elseif bullet then
        local indent = line:match("^%s*")
        local marker = line:match("^%s*([-*+])")
        if line:match("^%s*[-*+]%s*$") then
          return "<BS><BS><BS>"
        end
        return "<CR>" .. indent .. marker .. " "
      elseif numbered then
        local indent = line:match("^%s*")
        local num = tonumber(line:match("^%s*(%d+)"))
        if line:match("^%s*%d+%.%s*$") then
          return "<BS><BS><BS>"
        end
        return "<CR>" .. indent .. (num + 1) .. ". "
      else
        return "<CR>"
      end
    end, { expr = true, buffer = true })
  end,
})

-- ============================================================================
-- KEYMAPS
-- ============================================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File Explorer
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>o', ':NvimTreeFocus<CR>', opts)

-- Telescope - Finding notes
keymap('n', '<leader>ff', function()
  require('telescope.builtin').find_files({ cwd = notes_dir })
end, { desc = 'Find notes' })
keymap('n', '<leader>fg', function()
  require('telescope.builtin').live_grep({ cwd = notes_dir })
end, { desc = 'Search in notes' })
keymap('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = 'Recent files' })

-- Note creation
keymap('n', '<leader>nn', function()
  local note_name = vim.fn.input('Note name: ')
  if note_name ~= '' then
    local file_path = notes_dir .. '/' .. note_name .. '.md'
    vim.cmd('edit ' .. file_path)
  end
end, { desc = 'New note' })

-- Daily note
keymap('n', '<leader>nd', function()
  local date = os.date('%Y-%m-%d')
  local file_path = notes_dir .. '/daily/' .. date .. '.md'
  vim.fn.mkdir(notes_dir .. '/daily', 'p')
  vim.cmd('edit ' .. file_path)
  
  if vim.fn.filereadable(file_path) == 0 then
    local lines = {
      '# Daily Note - ' .. date,
      '',
      '## Tasks',
      '- [ ] ',
      '',
      '## Notes',
      '',
      '## Ideas',
      '',
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.cmd('write')
  end
end, { desc = 'Daily note' })

-- Markdown formatting
keymap('v', '<leader>mb', 'c**<C-r>"**<Esc>', { desc = 'Bold' })
keymap('v', '<leader>mi', 'c*<C-r>"*<Esc>', { desc = 'Italic' })
keymap('v', '<leader>mc', 'c`<C-r>"`<Esc>', { desc = 'Code' })
keymap('v', '<leader>ms', 'c~~<C-r>"~~<Esc>', { desc = 'Strikethrough' })

-- Toggle checkbox
keymap('n', '<leader>mt', function()
  local line = vim.api.nvim_get_current_line()
  if line:match('%[%s%]') then
    line = line:gsub('%[%s%]', '[x]', 1)
  elseif line:match('%[x%]') then
    line = line:gsub('%[x%]', '[ ]', 1)
  else
    line = line:gsub('^(%s*[-*+]%s+)', '%1[ ] ', 1)
  end
  vim.api.nvim_set_current_line(line)
end, { desc = 'Toggle checkbox' })

-- Markdown preview
keymap('n', '<leader>mp', ':MarkdownPreview<CR>', { desc = 'Preview markdown' })
keymap('n', '<leader>ms', ':MarkdownPreviewStop<CR>', { desc = 'Stop preview' })

-- Insert link
keymap('n', '<leader>ml', function()
  local url = vim.fn.input('URL: ')
  local text = vim.fn.input('Link text: ')
  if url ~= '' and text ~= '' then
    local link = '[' .. text .. '](' .. url .. ')'
    vim.api.nvim_put({link}, 'c', true, true)
  end
end, { desc = 'Insert link' })

-- Theme switcher (NEW!)
keymap('n', '<leader>th', function()
  local themes = {
    'github_dark',
    'github_dark_dimmed', 
    'carbonfox',
    'oxocarbon',
    'moonlight',
    'tokyonight',
    'vscode',
    'kanagawa',
    'catppuccin',
  }
  
  vim.ui.select(themes, {
    prompt = 'Select Theme:',
  }, function(choice)
    if choice then
      -- Map theme names to colorscheme commands
      local theme_commands = {
        github_dark = 'github_dark',
        github_dark_dimmed = 'github_dark_dimmed',
        carbonfox = 'carbonfox',
        oxocarbon = 'oxocarbon',
        moonlight = 'moonlight',
        tokyonight = 'tokyonight',
        vscode = 'vscode',
        kanagawa = 'kanagawa',
        catppuccin = 'catppuccin',
      }
      
      vim.cmd('colorscheme ' .. theme_commands[choice])
      print('Theme changed to: ' .. choice)
    end
  end)
end, { desc = 'Switch theme' })

-- Quick save
keymap('n', '<leader>w', ':w<CR>', opts)

-- Navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Buffer navigation
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)
keymap('n', '<leader>bd', ':bdelete<CR>', opts)

-- Window management
keymap('n', '<leader>sh', ':vsplit<CR>', opts)
keymap('n', '<leader>su', ':split<CR>', opts)
keymap('n', '<leader>da', ':close<CR>', opts)

-- Clear search highlighting
keymap('n', '<Esc>', ':noh<CR>', opts)

-- Terminal insert to normal
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n>', { noremap = true, silent = true })

-- ============================================================================
-- AUTO COMMANDS
-- ============================================================================

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Go to last location when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Set markdown filetype for .md files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.md",
  callback = function()
    vim.bo.filetype = "markdown"
  end,
})

-- ============================================================================
-- CUSTOM FUNCTIONS
-- ============================================================================

-- Search for notes by tag
vim.api.nvim_create_user_command('NotesByTag', function(opts)
  local tag = opts.args
  if tag == '' then
    tag = vim.fn.input('Tag: ')
  end
  if tag ~= '' then
    require('telescope.builtin').live_grep({
      cwd = notes_dir,
      default_text = '#' .. tag,
    })
  end
end, { nargs = '?' })

-- Create note template
vim.api.nvim_create_user_command('NewTemplate', function(opts)
  local template_type = opts.args
  local templates = {
    meeting = {
      '# Meeting Notes - ' .. os.date('%Y-%m-%d'),
      '',
      '**Date:** ' .. os.date('%Y-%m-%d %H:%M'),
      '**Attendees:** ',
      '',
      '## Agenda',
      '',
      '## Discussion',
      '',
      '## Action Items',
      '- [ ] ',
      '',
      '## Next Steps',
      '',
    },
    project = {
      '# Project: ',
      '',
      '**Status:** Planning',
      '**Created:** ' .. os.date('%Y-%m-%d'),
      '',
      '## Overview',
      '',
      '## Goals',
      '',
      '## Tasks',
      '- [ ] ',
      '',
      '## Resources',
      '',
      '## Notes',
      '',
    },
    idea = {
      '# Idea: ',
      '',
      '**Date:** ' .. os.date('%Y-%m-%d'),
      '**Tags:** #idea',
      '',
      '## Description',
      '',
      '## Potential',
      '',
      '## Next Steps',
      '',
    },
  }
  
  if templates[template_type] then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, templates[template_type])
  else
    print('Unknown template type. Available: meeting, project, idea')
  end
end, { nargs = 1 })

-- Print welcome message with current theme
print("📝 Note-taking setup loaded! Active theme: " .. ACTIVE_THEME)
print("Use <Space>ff to find notes, <Space>nn for new note, <Space>th to switch themes")
