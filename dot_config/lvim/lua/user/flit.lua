local M = {}

M.config = function()
  local status_ok, flit = pcall(require, "flit")
  if not status_ok then
    return
  end
  flit.setup {
    keys = { f = 'f', F = 'F', t = 'j', T = 'J' },
    labeled_modes = "v",
    multiline = true,
    opts = {}
  }

end

return M
