-- Only load AlphaVim if no file is provided
if vim.fn.argc() == 0 then
  -- Only load AlphaVim if no arguments (i.e., no file is passed)
  require('alpha').setup(require('alpha').opts)
else
  -- If a file is passed, open the file normally
  vim.cmd("edit " .. vim.fn.argv(0))
end

-- Print Hello ZT (this will always run)
print("Hello ZT")

-- Load additional configurations
require("options")
require("plugins")
require("keymaps")

-- Set environment variable
vim.env.LANG = "en_US.UTF-8"




