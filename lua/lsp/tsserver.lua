local lspconfig = require('lspconfig')
local lspconfig_util = require('lspconfig/util')
local root_pattern = lspconfig_util.root_pattern

return function(on_attach, capabilities)
  lspconfig.tsserver.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
    capabilities = capabilities,
    settings = {documentFormatting = false},
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
    root_dir = root_pattern(".git")
  }
end

