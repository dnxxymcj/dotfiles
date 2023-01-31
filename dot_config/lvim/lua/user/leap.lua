local M = {}

M.config = function()
  local status_ok, leap = pcall(require, "leap")
  if not status_ok then
    return
  end
  leap.opts.safe_labels = {}
  leap.opts.labels = { "s", "f", "t", "r", "n", "e", "i", "o", "d", "w", "l", "m", "u", "y", "k", "v", "h", "g", "h", "c",
    "x", "/", "a", "p" }
  leap.add_default_mappings()
end

return M
