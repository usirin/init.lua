local lspconfig = require("lspconfig")

local lua = {
  formatCommand = "lua-format -i --single-quote-to-double-quote --no-break-after-operator --no-use-tab --indent-width=2 --tab-width=2 --column-limit=120 --break-after-table-lb",
  formatStdin = true,
}

return function(on_attach, capabilities)
  lspconfig.efm.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = { documentFormatting = true },
    filetypes = { "lua" },
    settings = { rootMarkers = { ".git/" }, languages = { lua = { lua } } },
  })
end
