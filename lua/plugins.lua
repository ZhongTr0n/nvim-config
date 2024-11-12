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

require("lazy").setup({
  {
	'ellisonleao/gruvbox.nvim',
	config = function()
	  vim.g.gruvbox_contrast_dark = "soft"
	  vim.cmd.colorscheme("gruvbox")

	end,
  },
  {
	"nvim-treesitter/nvim-treesitter",
	config = function()
	  require("nvim-treesitter.configs").setup({
		ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "python", "javascript", "html", "css", "json" },

		auto_install = true,
		highlight = {
		  enable = true,
		}
	  })
	end,
  },
})


