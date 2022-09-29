local get_attached_clients = function()
  local count = vim.tbl_count(vim.lsp.get_active_clients({
		bufnr = 0,
	}))

  if count == 0 then
    return ""
  end

	return "(" .. count .. ")"
end

return get_attached_clients
