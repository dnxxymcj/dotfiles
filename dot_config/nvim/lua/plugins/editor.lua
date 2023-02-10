return {

  -- customize file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      { "<leader>E", "<cmd>Neotree toggle<cr>", desc = "Explorer toggle" },
      { "<leader>e", "<cmd>Neotree<cr>", desc = "Explorer" },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
        group_empty_dirs = true, -- when true, empty folders will be grouped together
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",
          ["e"] = "none",
          ["o"] = "open",
          ["-"] = "open_split",
          ["|"] = "open_vsplit",
          ["i"] = "toggle_auto_expand_width",
        },
      },
    },
  },

  -- customize leap
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "ggandor/flit.nvim",
        opts = {
          labeled_modes = "nv",
          multiline = false,
        },
        keys = { f = "f", F = "F" },
      },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.opts.safe_labels = {}
      leap.opts.labels = {
        "s",
        "f",
        "t",
        "r",
        "n",
        "e",
        "i",
        "o",
        "d",
        "w",
        "l",
        "m",
        "u",
        "y",
        "k",
        "v",
        "h",
        "g",
        "h",
        "c",
        "x",
        "/",
        "a",
        "p",
      }
      -- leap.add_default_mappings(true)
      -- leap
      vim.keymap.set({ "x", "o" }, "h", "<Plug>(leap-forward-till)", { noremap = true, silent = true })
      vim.keymap.set({ "x", "o" }, "H", "<Plug>(leap-backward-till)", { noremap = true, silent = true })
      vim.keymap.set("n", "h", "<Plug>(leap-forward-to)", { noremap = true, silent = true })
      vim.keymap.set("n", "H", "<Plug>(leap-backward-to)", { noremap = true, silent = true })

      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
      vim.api.nvim_set_hl(0, "LeapMatch", {
        fg = "white", -- for light themes, set to 'black' or similar
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
        ["<space>"] = "␣",
        ["<cr>"] = "↩︎",
        ["<tab>"] = "⇥",
        ["<leader>"] = "🐑",
        ["<esc>"] = "⎋",
      },
    },
  },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>o", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = function()
      local icons = require("lazyvim.config").icons
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
        keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = { "<Esc>", "q" },
          goto_location = "<Cr>",
          focus_location = "o",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r",
          code_actions = "a",
          fold = "s",
          unfold = "t",
          fold_all = "S",
          unfold_all = "T",
          fold_reset = "R",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
          File = { icon = icons.kinds.File, hl = "TSURI" },
          Module = { icon = icons.kinds.Module, hl = "TSNamespace" },
          Namespace = { icon = icons.kinds.Namespace, hl = "TSNamespace" },
          Package = { icon = icons.kinds.Package, hl = "TSNamespace" },
          Class = { icon = icons.kinds.Class, hl = "TSType" },
          Method = { icon = icons.kinds.Method, hl = "TSMethod" },
          Property = { icon = icons.kinds.Property, hl = "TSMethod" },
          Field = { icon = icons.kinds.Field, hl = "TSField" },
          Constructor = { icon = icons.kinds.Constructor, hl = "TSConstructor" },
          Enum = { icon = icons.kinds.Enum, hl = "TSType" },
          Interface = { icon = icons.kinds.Interface, hl = "TSType" },
          Function = { icon = icons.kinds.Function, hl = "TSFunction" },
          Variable = { icon = icons.kinds.Variable, hl = "TSConstant" },
          Constant = { icon = icons.kinds.Constant, hl = "TSConstant" },
          String = { icon = icons.kinds.String, hl = "TSString" },
          Number = { icon = icons.kinds.Number, hl = "TSNumber" },
          Boolean = { icon = icons.kinds.Boolean, hl = "TSBoolean" },
          Array = { icon = icons.kinds.Array, hl = "TSConstant" },
          Object = { icon = icons.kinds.Object, hl = "TSType" },
          Key = { icon = icons.kinds.Key, hl = "TSType" },
          Null = { icon = icons.kinds.Null, hl = "TSType" },
          EnumMember = { icon = icons.kinds.EnumMember, hl = "TSField" },
          Struct = { icon = icons.kinds.Struct, hl = "TSType" },
          Event = { icon = icons.kinds.Event, hl = "TSType" },
          Operator = { icon = icons.kinds.Operator, hl = "TSOperator" },
          TypeParameter = { icon = icons.kinds.TypeParameter, hl = "TSParameter" },
        },
      })
    end,
  },
}
