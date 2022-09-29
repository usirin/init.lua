local telescope_builtin = require("telescope.builtin")

local map = require("phoenix.utils.nvim_wrappers").buf_map
local command = require("phoenix.utils.nvim_wrappers").buf_command

local border_opts = { border = "single", focusable = true, scope = "line" }
vim.diagnostic.config({ virtual_text = false, float = border_opts })

local lsp = vim.lsp
lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)

local lsp_formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  map("n", "K", lsp.buf.hover)
  map("n", "gd", telescope_builtin.lsp_definitions)
  map("n", "gr", telescope_builtin.lsp_references)
  map("n", "]q", vim.diagnostic.goto_next)
  map("n", "[q", vim.diagnostic.goto_prev)

  map("n", "<leader>w", lsp.buf.code_action)
  map("n", "<leader>rn", function()
    vim.lsp.buf.rename()
  end)

  local lsp_highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
  vim.api.nvim_clear_autocmds({ group = lsp_highlight_group, buffer = bufnr })

  if client.server_capabilities.document_highlight then
    vim.api.nvim_create_autocmd("CursorHold", {
      command = "silent! lua vim.lsp.document_highlight()",
      buffer = bufnr,
      group = lsp_highlight_group,
    })
  end

  vim.api.nvim_create_autocmd("CursorHold", {
    command = "silent! lua vim.diagnostic.open_float()",
    group = lsp_highlight_group,
    buffer = bufnr,
  })

  if client.supports_method("textDocument/formatting") then
    command(bufnr, "LspFormatting", function()
      lsp.buf.format({
        filter = function(c)
          return c.name ~= "tsserver"
        end
      })
    end)

    vim.api.nvim_clear_autocmds({ group = lsp_formatting_group, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      command = "LspFormatting",
      group = lsp_formatting_group,
      buffer = bufnr,
    })

    map("n", "<leader>p", ":LspFormatting<CR>")
  end
end

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

require("phoenix.lsp.eslint").setup(on_attach, capabilities)
require("phoenix.lsp.null-ls").setup(on_attach)
require("phoenix.lsp.sumneku_lua").setup(on_attach, capabilities)
require("phoenix.lsp.tsserver").setup(on_attach)
