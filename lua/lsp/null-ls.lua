local null_ls = require("null-ls")
local b = null_ls.builtins

return function(on_attach, capabilities)
  null_ls.setup {
    sources = {
      b.formatting.prettier.with({
        filetypes = {
          "graphql", "gql", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "css",
          "scss", "html", "json", "yaml", "markdown"
        }
      })
      --
    }
  }

  require("lspconfig")["null-ls"].setup({on_attach = on_attach, capabilities = capabilities})
end
