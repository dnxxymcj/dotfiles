return {
  -- LSP keymaps
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
}
