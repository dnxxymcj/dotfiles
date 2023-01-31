local M = {}

M.config = function()
  local status_ok, colorizer = pcall(require, "colorizer")
  if not status_ok then
    return
  end

  colorizer.setup {
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "css",
      "html",
      "astro",
      "lua",
    },
    user_default_options = {
      rgb_fn = true,
      tailwind = "both",
    },
    buftypes = {
      -- '*', -- seems like this doesn't work with the float window, but works with the other `buftype`s.
      -- Not sure if the window has a `buftype` at all
    },
  }
end

return M
