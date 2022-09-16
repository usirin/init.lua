local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")

return function(on_attach, capabilities)
  if not lspconfig.golangcilsp then
    configs.golangcilsp = {
      default_config = {
        cmd = { "golangci-lint-langserver" },
        root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
        init_options = { command = { "golangci-lint", "--out-format", "json" } },
      },
    }
  end

  -- setup lsp
  lspconfig.gopls.setup({ on_attach = on_attach, capabilities = capabilities })
  lspconfig.golangcilsp.setup({ filetypes = { "go" } })
end
