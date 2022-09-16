local lspconfig = require("lspconfig")

return function(on_attach, capabilities)
  lspconfig.graphql.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "graphql", "gql" },
    --
  })
end
