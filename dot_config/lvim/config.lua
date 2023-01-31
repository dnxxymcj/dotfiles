-- vim options
-- =========================================
vim.opt.relativenumber = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- General
-- =========================================
lvim.colorscheme = "nord"
lvim.log.level = "warn"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
  filter = require("lvim.lsp.utils").format_filter,
}

-- Customization
-- =========================================
lvim.builtin.terminal.active = true
lvim.builtin.motion_provider = "leap"
lvim.builtin.tag_provider = "symbols-outline" -- ( symbols-outline or vista )
lvim.builtin.tree_provider = "nvimtree" -- can be "neo-tree" or "nvimtree" or ""
lvim.builtin.nvimtree.active = lvim.builtin.tree_provider == "nvimtree"
lvim.builtin.dap.active = true
lvim.builtin.harpoon = { active = true }
lvim.builtin.persistence = { active = true }

-- Config
-- =========================================
require("user.autocommands").config()
require("user.keymappings").config()
require("user.plugins").config()
require("user.builtin").config()
