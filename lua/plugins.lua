-- ========================================
-- Lazy.nvim Bootstrap
-- ========================================

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

-- ========================================
-- Plugin Setup with Lazy.nvim
-- ========================================
require("lazy").setup({

  -- ========================================
  -- Color Scheme
  -- ========================================
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme('gruvbox-material')  -- Load color scheme
    end
  },

  -- ========================================
-- Telescope - Fuzzy Finder
-- ========================================
{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency for Telescope
  config = function()
    require("telescope").setup({
      defaults = {
        -- Configuration for Telescope's defaults
        prompt_prefix = "> ",
        selection_caret = "> ",
        path_display = { "smart" },
      },
      pickers = {
        find_files = {
          theme = "dropdown", -- Display find_files in dropdown mode
        },
        live_grep = {
          theme = "ivy", -- Display live_grep in ivy mode (bottom search panel)
        },
      },
      extensions = {
        -- Configure extensions here if you add any
      },
    })

    -- Load Telescope extensions if needed (e.g., fzf, media_files)
    -- require("telescope").load_extension("fzf")
  end
},


  -- ========================================
  -- Syntax Highlighting and Text Objects
  -- ========================================
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript", "html", "css", "json" },
        auto_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },

  -- ========================================
  -- LSP Management
  -- ========================================
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "ts_ls", "cssls", "html" }
      })
    end,
  },

  -- ========================================
  -- LSP Configurations
  -- ========================================
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Enable snippet support for HTML and CSS
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Setup LSP servers
      lspconfig.pyright.setup {}
      lspconfig.ts_ls.setup {}
      lspconfig.html.setup {
        capabilities = capabilities,  -- Enable snippet support
      }
      lspconfig.cssls.setup {
        capabilities = capabilities,  -- Enable snippet support
      }
    end,
  },

  -- ========================================
  -- Completion Plugins
  -- ========================================
  {
    "hrsh7th/nvim-cmp",  -- Completion framework
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP completion source
      "L3MON4D3/LuaSnip",      -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }),
      })
    end,
  },

  -- ========================================
  -- Status Line
  -- ========================================
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for file icons
    config = function()
      require("lualine").setup({
        options = {
          theme = 'gruvbox-material',  -- Set lualine theme
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename', {'%f'}},  -- Show full path
          lualine_x = {'encoding', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        }
      })
    end,
  },

})
