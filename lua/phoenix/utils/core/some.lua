--- Returns true if "cb" returns true for any of the items in a table
---
---@param tbl table
---@param cb function
---@return boolean
local some = function(tbl, cb)
	for k, v in pairs(tbl) do
		if cb(k, v) then
			return true
		end
	end
	return false
end

return some
