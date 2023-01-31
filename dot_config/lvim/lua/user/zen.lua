local M = {}

M.config = function()
  local status_ok, zen_mode = pcall(require, "zen-mode")
  if not status_ok then
    return
  end

  zen_mode.setup {
    window = {
      backdrop = 1,
      height = 0.9,
      width = 0.6,
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
        cursorline = true,
        cursorcolumn = false, -- disable cursor column
        -- foldcolumn = "0", -- disable fold column
        -- list = false, -- disable whitespace characters
      },
    },
    plugins = {
      gitsigns = { enabled = false },
      twilight = { enabled = true },
    },
    on_open = function()
      lvim.builtin.cmp.active = false
      lvim.builtin.breadcrumbs.active = false
    end,
    on_close = function()
      lvim.builtin.breadcrumbs.active = true
      lvim.builtin.cmp.active = true
    end,
  }
end

return M
