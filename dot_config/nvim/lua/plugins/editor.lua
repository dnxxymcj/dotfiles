return {

  -- explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>E", "<cmd>Neotree toggle<cr>", desc = "Explorer toggle" },
      { "<leader>e", "<cmd>Neotree<cr>", desc = "Explorer" },
    },
    opts = {
      window = {
        width = 30,
        mappings = {
          ["o"] = "open",
          ["-"] = "open_split",
          ["|"] = "open_vsplit",
        },
      },
    },
  },

  -- leap
  -- {
  --   "ggandor/leap.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     {
  --       "ggandor/flit.nvim",
  --       opts = {
  --         labeled_modes = "nv",
  --         multiline = false,
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     local leap = require("leap")
  --     for k, v in pairs(opts) do
  --       leap.opts[k] = v
  --     end
  --     leap.opts.safe_labels = {}
  --
  --     vim.keymap.set({ "x", "o" }, "t", "<Plug>(leap-forward-till)", { noremap = true, silent = true })
  --     vim.keymap.set({ "x", "o" }, "T", "<Plug>(leap-backward-till)", { noremap = true, silent = true })
  --     vim.keymap.set("n", "t", "<Plug>(leap-forward-to)", { noremap = true, silent = true })
  --     vim.keymap.set("n", "T", "<Plug>(leap-backward-to)", { noremap = true, silent = true })
  --
  --     vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
  --     vim.api.nvim_set_hl(0, "LeapMatch", {
  --       fg = "black", -- for light themes, set to 'black' or similar
  --       bold = true,
  --       nocombine = true,
  --     })
  --     leap.opts.highlight_unlabeled_phase_one_targets = true
  --   end,
  -- },

  -- easily jump to any location and enhanced f motions for Leap
  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs({ "f", "F" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = {
      labeled_modes = "nx",
      multiline = false,
    },
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "t", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "T", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gt", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.opts.safe_labels = {}
      vim.keymap.set({ "x", "o" }, "t", "<Plug>(leap-forward-till)", { noremap = true, silent = true })
      vim.keymap.set({ "x", "o" }, "T", "<Plug>(leap-backward-till)", { noremap = true, silent = true })
      vim.keymap.set("n", "t", "<Plug>(leap-forward-to)", { noremap = true, silent = true })
      vim.keymap.set("n", "T", "<Plug>(leap-backward-to)", { noremap = true, silent = true })
      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
      vim.api.nvim_set_hl(0, "LeapMatch", {
        fg = "black", -- for light themes, set to 'black' or similar
        bold = true,
        nocombine = true,
      })
      leap.opts.highlight_unlabeled_phase_one_targets = true
    end,
  },

  -- which-key extensions
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        breadcrumb = "/", -- symbol used in the command line area that shows your active key combo
        separator = "·", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      key_labels = {
        ["<space>"] = "󱁐",
        ["<cr>"] = "↩︎",
        ["<tab>"] = "⇥",
        ["<leader>"] = " ",
        ["<esc>"] = "⎋",
      },
    },
  },

  -- symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>o", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = function()
      require("symbols-outline").setup({
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = "right",
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = false,
        preview_bg_highlight = "Pmenu",
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { "", "" },
        wrap = false,
        lsp_blacklist = {},
        symbol_blacklist = {},
      })
    end,
  },
}
