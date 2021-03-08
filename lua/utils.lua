local M = {}

function M.map(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

function M.split(str, sep)
  if sep == nil then sep = "%s" end

  local t = {}

  for part in string.gmatch(str, "([^"..sep.."]+)") do
    table.insert(t, part)
  end

  return t
end

function M.buf_get_filetype(buf)
  local buf_name = vim.api.nvim_buf_get_name(buf)
  local parts = M.split(buf_name, ".")
  local filetype = parts[#parts]
  return filetype
end

return M
