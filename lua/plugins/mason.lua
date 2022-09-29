local setup = function()
  require("mason").setup()

  require("mason-lspconfig").setup({
    ensure_installed = {
      "sumneko_lua",
      "eslint",
      "tsserver",
      "golangci_lint_ls",
      "gopls",
      "graphql",
      "jsonls",
    },
  })
end

return {
  setup = setup,
}
