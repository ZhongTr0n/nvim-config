-- ========================
-- General Settings
-- ========================

-- Line Numbers
vim.opt.number = true               -- Show absolute line number for the current line
vim.opt.relativenumber = true       -- Show relative line numbers for other lines

-- Window Splitting
vim.opt.splitbelow = true           -- New horizontal splits open below the current window
vim.opt.splitright = true           -- New vertical splits open to the right of the current window

-- Text Wrapping
vim.opt.wrap = false                -- Disable line wrapping

-- Encoding
vim.opt.encoding = "utf-8"          -- Set default file encoding to UTF-8

-- Clipboard
vim.opt.clipboard = "unnamedplus"   -- Use system clipboard

-- Scrolling
vim.opt.scrolloff = 5               -- Minimum number of lines to keep above/below the cursor

-- Swap Files
vim.opt.swapfile = false            -- Disable swap files

-- ========================
-- Indentation Settings
-- ========================

-- Tabs and Indentation
vim.opt.tabstop = 4                 -- Width of a <Tab> character
vim.opt.softtabstop = 4             -- Width of a <Tab> in insert mode
vim.opt.shiftwidth = 2              -- Width of an indentation
vim.opt.backspace = "indent,eol,start" -- Allow backspace over indentation, EOL, and start of insert

-- ========================
-- Visual and Display Options
-- ========================

-- Display whitespace characters
vim.opt.list = true                 -- Show whitespace characters
vim.opt.listchars = {
  tab = '▸ ',                       -- Symbol to represent tabs
  eol = '¬',                        -- Symbol to represent end of line
  trail = '.',                      -- Symbol for trailing spaces
  space = '·',                      -- Symbol for spaces (optional)
}

-- Mouse and Ruler
vim.opt.mouse = ""                  -- Disable mouse to prevent accidental scrolling
vim.opt.ruler = true                -- Show cursor position in the status line
vim.opt.rulerformat = "%55(%{strftime('%a\\ %b\\ %e\\ %I:%M\\ %p')}\\ %5l,%-6(%c%V%)\\ %P%)" -- Custom ruler format

-- Status Line
vim.o.statusline = "%f %y %m %=%{expand('%:p:h')}" -- Display file path, type, modified status, and directory path in the status line

-- Visual and Audible Bells
vim.opt.visualbell = false          -- Disable visual bells
vim.opt.belloff = "all"             -- Disable all types of bells

-- Color Settings
vim.opt.termguicolors = true        -- Enable true color support

-- ========================
-- Search Settings
-- ========================

vim.opt.ignorecase = true           -- Ignore case when searching
vim.opt.smartcase = true            -- Enable smart case: if search contains uppercase, respect case
vim.opt.hlsearch = true             -- Highlight all matches for the search
vim.opt.incsearch = true            -- Show search matches as you type

-- ========================
-- Command Behavior
-- ========================

vim.opt.showcmd = true              -- Display partial commands in the last line of the screen
vim.opt.inccommand = "split"        -- Show results of substitute commands incrementally in a split

-- ========================
-- Directory Management
-- ========================

vim.opt.autochdir = true            -- Automatically change directory to the current file's location

-- ========================
-- Leader Key
-- ========================

vim.g.mapleader = " "               -- Set the leader key to space

