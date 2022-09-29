--- Extends source table with overrides table.
---@param source table
---@param overrides table
---@return table
local extend = function(source, overrides)
	overrides = overrides or {}
	return vim.tbl_deep_extend("force", source, overrides)
end

return extend
