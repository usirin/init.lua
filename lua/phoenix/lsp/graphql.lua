local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").graphql.setup({
    filetypes = { "graphql" },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
