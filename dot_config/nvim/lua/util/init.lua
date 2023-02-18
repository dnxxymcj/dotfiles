local M = {}

function M.cowboy()
  ---@type table?
  local id
  for _, key in ipairs({ "h", "j", "k", "l" }) do
    local count = 0
    vim.keymap.set("n", key, function()
      if count >= 10 then
        id = vim.notify("Hold it Cowboy!", vim.log.levels.WARN, {
          icon = "󰺛",
          replace = id,
          keep = function()
            return count >= 10
          end,
        })
      else
        count = count + 1
        vim.defer_fn(function()
          count = count - 1
        end, 5000)
        return key
      end
    end, { expr = true, silent = true })
  end
end

return M
