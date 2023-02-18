-- if true then
--   return {}
-- end

local palette = require("nightfox.palette").load("nordfox")
local magenta = palette.magenta.base

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    -- opts = function(plugin)
    opts = function(_)
      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            -- stylua: ignore
            {
              function() return require("nvim-navic").get_location() end,
              cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            },
          },
          lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = fg("Statement")
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = fg("Constant") ,
            },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },

            { "location", color = { fg = magenta } },

            {
              function()
                -- { "🧛", "👻", "👺", "🧟", "🎃", "🌴", "🌊", "🏂", "❄️", "⛷️", "🎅", "🎄", "🌟", "🎁" }
                return "❄️"
              end,
            },

            {
              function()
                local current_line = vim.fn.line(".")
                local total_lines = vim.fn.line("$")
                local chars = { "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
                local line_ratio = current_line / total_lines
                local index = math.ceil(line_ratio * #chars)
                return chars[index]
              end,
              padding = 0,
              color = { fg = magenta },
              cond = nil,
            },
          },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "neo-tree" },
      }
    end,
  },
}
