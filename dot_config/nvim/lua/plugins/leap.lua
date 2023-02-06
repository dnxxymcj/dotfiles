return {
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "ggandor/flit.nvim",
        opts = { labeled_modes = "nv" },
        -- keys = { f = "f", F = "F" },
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
      vim.keymap.set("", "s", "h", { noremap = true, silent = true })
      vim.keymap.set("", "t", "l", { noremap = true, silent = true })
      -- leap.add_default_mappings(true)

      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
      vim.api.nvim_set_hl(0, "LeapMatch", {
        fg = "white", -- for light themes, set to 'black' or similar
        bold = true,
        nocombine = true,
      })
      leap.opts.highlight_unlabeled_phase_one_targets = true
    end,
  },
}
