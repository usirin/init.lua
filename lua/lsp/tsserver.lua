local lspconfig = require "lspconfig"
local ts_utils = require "nvim-lsp-ts-utils"

local ts_utils_settings = {
  debug = true,
  enable_import_on_completion = true,
  import_all_scan_buffers = 100,
  eslint_bin = "eslint_d",
  eslint_enable_diagnostics = true,
  enable_formatting = false,
  formatter = "prettier",
  update_imports_on_move = false,
}

local cmd = { "typescript-language-server", "--stdio" }

return function(on_attach, capabilities)
  lspconfig.tsserver.setup {
    cmd = cmd,
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      on_attach(client, bufnr)

      ts_utils.setup(ts_utils_settings)
      ts_utils.setup_client(client)
    end,
    capabilities = capabilities,
    -- root_dir = root_pattern(".git")
  }
end
