return {

  -- LSP
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "K", "" }
      -- add a keymap
      keys[#keys + 1] = { "J", vim.lsp.buf.hover, desc = "Hover" }
    end,
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- language specific extension modules
  { import = "plugins.extras.lang.rust" },
}
