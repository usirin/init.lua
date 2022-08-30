local u = require("utils")

local setup_coc = function()
  vim.g.coc_node_path = "/Users/umutsirin/.nvm/versions/node/v16.13.1/bin/node"
  vim.g.coc_enable_locationlist = 1
  vim.g.coc_global_extensions = {
    "coc-json",
    "coc-marketplace",
    "coc-prettier",
    "coc-snippets",
    "coc-syntax",
    "coc-tslint-plugin",
    "coc-tsserver",
    "coc-yank",
    "coc-prisma"
  }
  -- Highlight the symbol and its references when holding the cursor.
  vim.cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])
end


local setup_keymaps = function()
  vim.cmd([[
    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
  ]])

  u.keymap("i",
    "<TAB>",
    [[coc#pum#visible() ? coc#pum#next(1): CheckBackspace() ? "\<Tab>" : coc#refresh()]],
    { expr = true, silent = true }
  )

  u.keymap("i",
    "<S-TAB>",
    [[ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>" ]],
    { expr = true }
  )

  u.keymap("i", "<c-space>", "coc#refresh()", { expr = true })
  u.keymap("i",
    "<cr>",
    [[ coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" ]],
    { expr = true }
  )

  u.keymap("n", "gd", "<Plug>(coc-definition)", { noremap = false })
  u.keymap("n", "gf", "<Plug>(coc-implementation)", { noremap = false })
  u.keymap("n", "<C-g>f", ":vsplit<cr><Plug>(coc-implementation)", { noremap = false })
  u.keymap("n", "gR", "<Plug>(coc-references)", { noremap = false })
  u.keymap("n", "gr", ":Telescope coc references<CR>", { noremap = false })
  u.keymap("n", "<leader>d", ":Telescope coc document_symbols<CR>", { noremap = false })
  u.keymap("n", "<C-x>", ":Telescope coc diagnostics<CR>", { noremap = false })

  u.keymap("n", "K", ":call CocAction(\"doHover\")<CR>", { noremap = false })
  u.keymap("n", "]q", "<Plug>(coc-diagnostic-next)", { noremap = false })
  u.keymap("n", "[q", "<Plug>(coc-diagnostic-prev)", { noremap = false })
  u.keymap("n", "<leader>w", "<Plug>(coc-codeaction)", { noremap = false })
  u.keymap("v", "<leader>w", "<Plug>(coc-codeaction-selected)", { noremap = false })
  u.keymap("n", "<leader>rn", "<Plug>(coc-rename)", { noremap = false })
  u.keymap("n", "<leader>p", ":CocCommand editor.action.formatDocument<CR>", { noremap = false })
end

local setup = function()
  setup_coc()
  setup_keymaps()
end

return {
  setup = setup
}
