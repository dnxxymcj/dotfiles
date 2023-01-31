local M = {}

M.config = function()

  lvim.plugins = {

    { "shaunsingh/nord.nvim" },
    {
      "kylechui/nvim-surround",
      config = function()
        require("user.surround").config()
      end,
    },
    { "tpope/vim-repeat" },
    {
      "ggandor/leap.nvim",
      config = function()
        require("user.leap").config()
      end,
      dependencies = "tpope/vim-repeat",
      enabled = lvim.builtin.motion_provider == "leap",
    },
    {
      "ggandor/flit.nvim",
      config = function()
        require("user.flit").config()
      end,
      dependencies = "tpope/vim-repeat",
    },
    {
      "ThePrimeagen/harpoon",
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
      },
      config = function()
        require("user.harpoon").config()
      end,
      enabled = lvim.builtin.harpoon.active,
    },
    {
      "folke/zen-mode.nvim",
      lazy = true,
      cmd = "ZenMode",
      config = function()
        require("user.zen").config()
      end,
    },
    {
      "folke/trouble.nvim",
      config = function()
        require("trouble").setup {
          auto_open = false,
          auto_close = true,
          padding = false,
          height = 10,
          use_diagnostic_signs = true,
        }
      end,
      event = "VeryLazy",
      cmd = "Trouble",
    },
    {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("user.symbols_outline").config()
      end,
      event = "BufReadPost",
      enabled = lvim.builtin.tag_provider == "symbols-outline",
    },
    {
      "liuchengxu/vista.vim",
      init = function()
        require("user.vista").config()
      end,
      event = "BufReadPost",
      enabled = lvim.builtin.tag_provider == "vista",
    },
    {
      "folke/twilight.nvim",
      lazy = true,
      config = function()
        require("user.twilight").config()
      end,
    },
    {
      "andymass/vim-matchup",
      event = "BufReadPost",
      config = function()
        vim.g.matchup_enabled = 1
        vim.g.matchup_surround_enabled = 1
        vim.g.matchup_matchparen_deferred = 1
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
    {
      "windwp/nvim-spectre",
      lazy = true,
      config = function()
        require("user.spectre").config()
      end,
    },
    {
      "NvChad/nvim-colorizer.lua",
      config = function()
        require("user.colorizer").config()
      end,
    },
    {
      "folke/persistence.nvim",
      event = "BufReadPre",
      lazy = true,
      config = function()
        require("persistence").setup {
          dir = vim.fn.expand(get_cache_dir() .. "/sessions/"), -- directory where session files are saved
          options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
        }
      end,
      enabled = lvim.builtin.persistence.active,
    },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    { "mtdl9/vim-log-highlighting", ft = { "text", "log" } },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      lazy = true,
      event = "BufReadPre",
      dependencies = "nvim-treesitter",
    },
    {
      "folke/todo-comments.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      config = function()
        require("user.todo_comments").config()
      end,
      event = "BufRead",
    },
    { "MunifTanjim/nui.nvim" },
    {
      "j-hui/fidget.nvim",
      config = function()
        require("user.fidget_spinner").config()
      end,
    },
    {
      "MattesGroeger/vim-bookmarks",
      config = function()
        require("user.bookmark").config()
      end,
    },
    {
      "kevinhwang91/nvim-bqf",
      event = "BufReadPost",
      config = function()
        require("user.bqf").config()
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      cmd = "Neotree",
      dependencies = {
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("user.neotree").config()
      end,
      enabled = lvim.builtin.tree_provider == "neo-tree",
    },
    {
      "monaqa/dial.nvim",
      -- stylua: ignore
      keys = {
        { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
        { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
      },
      config = function()
        local augend = require("dial.augend")
        require("dial.config").augends:register_group({
          default = {
            augend.integer.alias.decimal,
            augend.integer.alias.hex,
            augend.date.alias["%Y/%m/%d"],
            augend.constant.alias.bool,
            augend.semver.alias.semver,
          },
        })
      end,
    },
    -- {
    --   "toppair/peek.nvim",
    --   build = "deno task --quiet build:fast",
    --   keys = {
    --     {
    --       "<leader>k",
    --       function()
    --         local peek = require("peek")
    --         if peek.is_open() then
    --           peek.close()
    --         else
    --           peek.open()
    --         end
    --       end,
    --       desc = "Peek (Markdown Preview)",
    --     },
    --   },
    -- },
  }

end

return M
