local map = require("phoenix.utils.nvim_wrappers").buf_map

local M = {}
M.setup = function(on_attach, capabilities)
  require("typescript").setup({
    server = {
      -- root_dir = require("lspconfig").util.root_pattern(".git"),
      init_options = {
        maxTsServerMemory = 8192,
      },
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        map("n", "go", ":TypescriptAddMissingImports<CR>")
        map("n", "gO", ":TypescriptOrganizeImports<CR>")
        map("n", "gI", ":TypescriptRenameFile<CR>")

        -- map(bufnr, "n", "gx", ":set opfunc=v:lua.css_to_js<CR>g@")
        -- map(bufnr, "n", "gxx", ":CssToJs<CR>")
        -- map(bufnr, "v", "gx", ":CssToJs<CR>")

        -- override
        map("n", "gd", ":TypescriptGoToSourceDefinition<CR>")
      end,
      capabilities = capabilities,
    },
  })
end

return M
