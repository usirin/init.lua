--- Apply a function to all values of a table.
---
---@param table table Table
---@param func function|table Function or callable table
---@return table Table of transformed values
local map = function (table, func)
  return vim.tbl_map(func, table)
end

return map
