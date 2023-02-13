local spec = require("nightfox.spec").load("nordfox")
local palette = require("nightfox.palette").load("nordfox")
local magenta = palette.magenta.base
local black = palette.black.base
local yellow = palette.yellow.base
local orange = palette.orange.base

return {

  -- floating winbar
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = magenta, guifg = black },
            InclineNormalNC = { guifg = magenta, guibg = black },
          },
        },
        window = {
          margin = { vertical = 0, horizontal = 1 },
          winhighlight = {
            active = {
              EndOfBuffer = "None",
              Normal = "InclineNormal",
              Search = "None",
            },
            inactive = {
              EndOfBuffer = "None",
              Normal = "InclineNormalNC",
              Search = "None",
            },
          },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      local scrollbar = require("scrollbar")
      scrollbar.setup({
        excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "alpha", "neo-tree" },
        handle = { color = palette.bg3.base },
        marks = {
          Cursor = { color = magenta },
          Search = { color = yellow },
          Misc = { color = orange },
          Error = { color = spec.diag.error },
          Warn = { color = spec.diag.warn },
          Info = { color = spec.diag.info },
          Hint = { color = spec.diag.hint },
        },
      })
    end,
  },

  -- notify customization
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade_in_slide_out",
      timeout = 3000,
      render = "minimal",
    },
  },
}
