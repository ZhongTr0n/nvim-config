-- Print Hello ZT (this will always run)
print("Hello ZhongTr0n")

-- Load additional configurations
require("options")
require("plugins")
require("keymaps")

require("colorscheme")

-- Set environment variable
vim.env.LANG = "en_US.UTF-8"
vim.o.wrap = true


-- Autocommand to format JSON, topojson, and geojson files on open
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = {"*.json", "*.topojson", "*.geojson"},
  command = "%!python3 -m json.tool",
})
