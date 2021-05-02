local lspconfig = require("lspconfig")

local lua = {
  formatCommand = "lua-format -i --single-quote-to-double-quote --no-break-after-operator --no-use-tab --indent-width=2 --tab-width=2 --column-limit=120 --break-after-table-lb",
  formatStdin = true
}

local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin --stdin-filepath ${INPUT}", formatStdin = true}
local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

return function(on_attach, capabilities)
  lspconfig.efm.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {documentFormatting = true},
    filetypes = {"lua", "typescript", "typescriptreact", "typescript.tsx"},
    settings = {
      rootMarkers = {".git/"},
      languages = {lua = {lua}, typescript = {prettier, eslint}, typescriptreact = {prettier, eslint}}
    }
  }
end

