local lspconfig = require('lspconfig')

local USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""
if vim.fn.has("mac") == 1 then
  sumneko_root_path = "/Users/" .. USER .. "/.config/language-servers/lua"
  sumneko_binary = "/Users/" .. USER .. "/.config/language-servers/lua/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
  sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
  sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
else
  print("Unsupported system for sumneko")
end

return function(on_attach, capabilities)
  lspconfig.sumneko_lua.setup {
    on_attach = function(...)
      on_attach(...)
      vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]])
    end,
    capabilities = capabilities,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT'
        },
        diagnostics = {globals = {'vim'}},
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
        }
      }
    }
  }

end

