local fn = vim.fn

---@param target_path string
local is_empty_path = function(target_path)
  ---@diagnostic disable-next-line: missing-parameter
  return fn.empty(fn.glob(target_path)) > 0
end

return {
  is_empty_path = is_empty_path,
}
