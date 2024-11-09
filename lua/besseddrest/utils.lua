--@class Utils
--- Check if any value is a table
---@field is_tbl fun(v: any): boolean
--- Create a keymap local to buffer
---@field buf_map fun(buf?: integer, mode: string, lhs: string | table, rhs: string, opts?: table)

local M = {}

M.buf_map = function(buf, mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  if M.is_tbl(lhs) then
    ---@cast lhs table
    for _, trigger in ipairs(lhs) do
      vim.api.nvim_buf_set_keymap(buf or 0, mode, trigger, rhs, options)
    end
  else
    ---@cast lhs string
    vim.api.nvim_buf_set_keymap(buf or 0, mode, lhs, rhs, options)
  end
end

M.is_tbl = function(v)
  if type(v) == "table" then
    return true
  else
    return false
  end
end

return M
