local M = {}

M.config = function()
  local status_ok, todo = pcall(require, "todo-comments")
  if not status_ok then
    return
  end

  -- ISSUE:
  -- WARN:
  -- TODO:
  -- PERF:
  -- NOTE:
  -- TEST:

  local icons = require("user.lsp_kind").todo_comments
  local colors = require("user.colors").nord

  todo.setup {
    sign_priority = 8, -- sign priority
    signs = true, -- show icons in the signs column
    keywords = {
      FIX = {
        icon = icons.FIX, -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      },
      TODO = { icon = icons.TODO, color = "hint", alt = { "TIP" } },
      HACK = { icon = icons.HACK, color = "warn" },
      WARN = { icon = icons.WARN, color = "warn", alt = { "WARNING", "XXX" } },
      PERF = { icon = icons.PERF, color = "perf", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = icons.NOTE, color = "info", alt = { "INFO" } },
      TEST = { icon = icons.TEST, color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    colors = {
      error = colors.nord11,
      warn = colors.nord12,
      info = colors.nord14,
      hint = colors.nord13,
      test = colors.nord15,
      perf = colors.nord7,
      default = colors.nord10,
    },
    highlight = {
      before = "", -- "fg" or "bg" or empty
      keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
      after = "fg", -- "fg" or "bg" or empty
      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
      comments_only = true, -- uses treesitter to match keywords in comments only
      max_line_len = 400, -- ignore lines longer than this
      exclude = { "markdown" }, -- list of file types to exclude highlighting
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    },
  }
end

return M
