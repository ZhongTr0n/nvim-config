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
  -- Gruvbox color scheme
  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      vim.cmd.colorscheme("gruvbox")
      vim.g.gruvbox_contrast_dark = "soft"
    end,
  },
  -- Treesitter for syntax highlighting and text objects
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

  -- Mason for LSP management
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  
  -- Mason-LSPConfig to manage LSP servers
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "pyright", "ts_ls", "cssls", "html" }
      }
    end,
  },
  
  -- LSP configurations
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

  -- Completion plugins
  {
    "hrsh7th/nvim-cmp", -- Completion framework
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP completion source
      "L3MON4D3/LuaSnip", -- Snippet engine
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
})

