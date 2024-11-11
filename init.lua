print("Hello ZT")

vim.opt.number = true

vim.opt.relativenumber = true

vim.optsplitbelow = true
vim.optsplitright = true

vim.opt.wrap = false

vim.o.encoding = "utf-8"

-- Set tabs and indentation
vim.o.tabstop = 4          -- Number of spaces a <Tab> in file counts for
vim.o.softtabstop = 4      -- Number of spaces in insert mode for <Tab>
vim.o.shiftwidth = 2       -- Indentation level
vim.o.backspace = "indent,eol,start"  -- Allows backspacing over indents, EOL, and start

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 5 


-- Show whitespace characters
vim.opt.list = true

-- Define whitespace characters
vim.opt.listchars = {
  tab = '▸ ',      -- Symbol to represent tabs
  eol = '¬',       -- Symbol to represent end of line
  trail = '.',     -- Symbol for trailing spaces
  space = '·',     -- Symbol for spaces (optional)
}


-- Mouse and visual options
vim.opt.mouse = ""  -- Disable mouse to prevent accidental scrolling
vim.opt.ruler = true  -- Show cursor position in the status line

-- Set custom ruler format
vim.opt.rulerformat = "%55(%{strftime('%a\\ %b\\ %e\\ %I:%M\\ %p')}\\ %5l,%-6(%c%V%)\\ %P%)"

-- Disable visual bells
vim.opt.visualbell = false
vim.opt.belloff = "all"  -- Disable all types of bells

vim.env.LANG = "en_US.UTF-8"

-- Set auto-change directory to match the open file's directory
vim.opt.autochdir = true

-- Display partial commands in the last line of the screen
vim.opt.showcmd = true

vim.opt.inccommand = "split"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
-- Highlight all matching search terms
vim.opt.hlsearch = true

-- Show partial matches as you type during search
vim.opt.incsearch = true


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

