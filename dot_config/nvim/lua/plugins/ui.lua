local spec = require("nightfox.spec").load("nordfox")
local palette = require("nightfox.palette").load("nordfox")

return {

  -- floating winbar
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = palette.pink.base, guifg = palette.black.base },
            InclineNormalNC = { guifg = palette.pink.base, guibg = palette.black.base },
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
          Cursor = { color = palette.red.base },
          Search = { color = palette.orange.base },
          Misc = { color = palette.magenta.base },
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
      stages = "slide",
      timeout = 3000,
      render = "compact",
    },
  },

  -- colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        virtualtext = "■",
      },
    },
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = "┊", --        
        section_separators = "",
      },
    },
  },
}
