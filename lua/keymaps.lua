-- ========================================
-- Telescope Keymaps
-- ========================================
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Find files
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)

-- Live grep
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

-- Buffers
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

-- Help tags
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

