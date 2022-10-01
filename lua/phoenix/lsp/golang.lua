local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  require("lspconfig").golangci_lint_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
