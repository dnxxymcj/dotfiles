return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["e"] = "none",
          ["o"] = "open",
          ["-"] = "open_split",
          ["|"] = "open_vsplit",
          ["i"] = "toggle_auto_expand_width",
        },
      },
    },
  },
}
