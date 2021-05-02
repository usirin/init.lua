local lsp_status = require('lsp-status')

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then return end
  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then vim.api.nvim_command("noautocmd :update") end
  end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {spacing = 2},
  signs = true,
  update_in_insert = false
})

local opts = {noremap = true, silent = true}
local on_attach = function(client, bufnr)
  lsp_status.on_attach(client)

  local function set_keymap(mode, lhs, rhs) vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts) end
  -- local function set_option(...) vim.api.nvim_buf_set_option(bufnr, ..., opts) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  -- set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')
  set_keymap('n', ']q', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  set_keymap('n', '[q', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  set_keymap('n', '<leader>w', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

  -- set_keymap('n', '<leader>w', [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]])
  -- set_keymap('v', '<leader>w', [[<cmd>lua require('lspsaga.codeaction').range_code_action()<CR>]])
  -- set_keymap('n', '<leader>rn', [[<cmd>lua require('lspsaga.rename').rename()<CR>]])

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
		augroup LspAutocommands
				autocmd! * <buffer>
				autocmd BufWritePost <buffer> LspFormatting
		augroup END
		]], true)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#10141b
      hi LspReferenceText cterm=bold ctermbg=red guibg=#10141b
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#10141b
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

require('lsp.lua')(on_attach, lsp_status.capabilities)
require('lsp.efm')(on_attach, lsp_status.capabilities)
require('lsp.tsserver')(on_attach, lsp_status.capabilities)

