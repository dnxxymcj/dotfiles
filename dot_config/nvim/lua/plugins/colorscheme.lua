return {

  { "folke/tokyonight.nvim", enabled = false },

  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          -- transparent = true,
        },
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordfox",
    },
  },
}
