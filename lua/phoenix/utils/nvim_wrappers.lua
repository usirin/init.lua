local api = vim.api

local get_map_options = function(custom_options)
	local options = { silent = true }
	if custom_options then
		options = vim.tbl_extend("force", options, custom_options)
	end
	return options
end

local M = {}

---@param mode string|table    Same mode short names as |nvim_set_keymap()|.
---                            Can also be list of modes to create mapping on multiple modes.
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping. Can also be a Lua function.
--
---@param opts table A table of |:map-arguments|.
---                  + Accepts options accepted by the {opts} parameter in |nvim_set_keymap()|,
---                    with the following notable differences:
---                    - replace_keycodes: Defaults to `true` if "expr" is `true`.
---                    - noremap: Always overridden with the inverse of "remap" (see below).
---                  + In addition to those options, the table accepts the following keys:
---                    - buffer: (number or boolean) Add a mapping to the given buffer.
---                    When `0` or `true`, use the current buffer.
---                    - remap: (boolean) Make the mapping recursive.
---                    This is the inverse of the "noremap" option from |nvim_set_keymap()|.
---                    Defaults to `false`.
M.map = function(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, get_map_options(opts))
end

M.buf_map = function(mode, target, source, opts)
	opts = opts or {}
	opts.buffer = 0

	M.map(mode, target, source, get_map_options(opts))
end

M.command = function(name, fn, opts)
	api.nvim_create_user_command(name, fn, opts or {})
end

M.buf_command = function(bufnr, name, fn, opts)
	api.nvim_buf_create_user_command(bufnr, name, fn, opts or {})
end

return M
