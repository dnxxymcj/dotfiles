local M = {}

local create_aucmd = vim.api.nvim_create_autocmd

M.config = function()

  create_aucmd({ "VimLeave" }, {
    pattern = { "*" },
    callback = function()
      vim.cmd "set guicursor=a:ver100"
    end,
  })

end

return M
