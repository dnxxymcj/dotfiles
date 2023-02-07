return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_config = {
          vertical = {
            preview_cutoff = 0.2,
            preview_height = 0.4,
          },
          height = 0.9,
          width = 0.9,
        },
        mappings = {
          -- for input mode
          i = {
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-e>"] = require("telescope.actions").move_selection_previous,

            ["<C-b>"] = require("telescope.actions").results_scrolling_up,
            ["<C-f>"] = require("telescope.actions").results_scrolling_down,

            ["<Down>"] = require("telescope.actions").move_selection_next,
            ["<Up>"] = require("telescope.actions").move_selection_previous,

            ["<CR>"] = require("telescope.actions").select_default,
            ["<esc>"] = require("telescope.actions").close,
            ["<Tab>"] = require("telescope.actions").close,

            ["<C-k>"] = require("telescope.actions").which_key,
          },
          -- for normal mode
          n = {
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-e>"] = require("telescope.actions").move_selection_previous,

            ["<C-b>"] = require("telescope.actions").results_scrolling_up,
            ["<C-f>"] = require("telescope.actions").results_scrolling_down,

            ["<Down>"] = require("telescope.actions").move_selection_next,
            ["<Up>"] = require("telescope.actions").move_selection_previous,

            ["<CR>"] = require("telescope.actions").select_default,
            ["<esc>"] = require("telescope.actions").close,
            ["<Tab>"] = require("telescope.actions").close,

            ["<C-k>"] = require("telescope.actions").which_key,

            ["s"] = require("telescope.actions").cycle_history_next,
            ["t"] = require("telescope.actions").cycle_history_prev,
            ["n"] = require("telescope.actions").move_selection_next,
            ["e"] = require("telescope.actions").move_selection_previous,
            ["q"] = require("telescope.actions").close,

            ["gg"] = require("telescope.actions").move_to_top,
            ["G"] = require("telescope.actions").move_to_bottom,

            ["?"] = require("telescope.actions").which_key,
          },
        },
      },
    },
  },
}
