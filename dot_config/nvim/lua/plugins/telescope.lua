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
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,

            ["<CR>"] = require("telescope.actions").select_default,
            ["<esc>"] = require("telescope.actions").close,
            ["<Tab>"] = require("telescope.actions").close,

            ["<A-/>"] = require("telescope.actions").which_key,
          },
          -- for normal mode
          n = {

            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,

            ["<CR>"] = require("telescope.actions").select_default,
            ["<esc>"] = require("telescope.actions").close,
            ["<Tab>"] = require("telescope.actions").close,

            ["<A-/>"] = require("telescope.actions").which_key,
          },
        },
      },
    },
  },
}
