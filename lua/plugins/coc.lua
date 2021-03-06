local u = require("utils")
local t, check_back_space = u.t, u.check_back_space

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
    -- elseif vim.fn.call("vsnip#available", {1}) == 1 then
    -- 	return t "<Plug>(vsnip-expand-or-jump)"
  elseif vim.fn["coc#expandableOrJumpable"]() == 1 then
    return t [[\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>]]
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["coc#refresh"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
    -- elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    -- return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.g.coc_node_path = "/Users/umutsirin/.nvm/versions/node/v15.12.0/bin/node"
vim.g.coc_enable_locationlist = 1
vim.g.coc_global_extensions = {
  "coc-json", "coc-marketplace", "coc-prettier", "coc-snippets", "coc-syntax", "coc-tslint-plugin", "coc-tsserver",
  "coc-yank"
}

u.keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
u.keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
u.keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
u.keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

u.keymap("i", "<c-space>", "coc#refresh()", {expr = true})
u.keymap("i", "<cr>", [[pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]], {expr = true})

u.keymap("n", "gd", "<Plug>(coc-definition)", {noremap = false})
u.keymap("n", "gf", "<Plug>(coc-implementation)", {noremap = false})
u.keymap("n", "<C-g>f", ":vsplit<cr><Plug>(coc-implementation)", {noremap = false})
-- u.keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
u.keymap("n", "gr", "<Plug>(coc-references)", {noremap = false})
u.keymap("n", "K", ":call CocAction(\"doHover\")<CR>", {noremap = false})
u.keymap("n", "]q", "<Plug>(coc-diagnostic-next)", {noremap = false})
u.keymap("n", "[q", "<Plug>(coc-diagnostic-prev)", {noremap = false})
u.keymap("n", "<leader>w", "<Plug>(coc-codeaction)", {noremap = false})
u.keymap("v", "<leader>w", "<Plug>(coc-codeaction-selected)", {noremap = false})
u.keymap("n", "<leader>rn", "<Plug>(coc-rename)", {noremap = false})

-- Highlight the symbol and its references when holding the cursor.
vim.cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])
