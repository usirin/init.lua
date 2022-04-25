-- getmetatable("").__index = function(str, i) return string.sub(str, i, i) end
vim.o.termguicolors = true
vim.cmd("syntax on")
vim.o.mouse = "a"
vim.o.visualbell = false
vim.o.errorbells = false
vim.o.showcmd = true
vim.o.belloff = "all"

vim.o.showmode = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.ttyfast = true
vim.o.autowrite = true
vim.o.autoread = true
vim.o.updatetime = 300
vim.o.cmdheight = 2
vim.o.shortmess = vim.o.shortmess .. "c"

-- vim.o.re=0

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.backspace = "indent,eol,start"
vim.wo.number = true
vim.wo.wrap = false
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.hidden = true
vim.o.showtabline = 2

vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.cmd([[set expandtab]])
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.cmd("set ts=2") -- Insert 2 spaces for a tab
vim.cmd("set sw=2") -- Change the number of space characters inserted for indentation
vim.o.shiftround = true
-- vim.o.diffopt = vim.o.diffopt .. "vertical"

vim.o.scrolloff = 5
vim.cmd("set inccommand=split") -- Make substitution work in realtime
vim.cmd([[set list listchars=tab:\ \ ,trail:·,nbsp:·]])
vim.cmd([[set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store,*/node_modules/*]])

-- set working directory to current buffer's directory
vim.cmd([[autocmd BufEnter * silent! lcd %:p:h]])

-- remove whitespace on save
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- color columns
vim.cmd([[autocmd BufNewFile,BufReadPost *.js,*.ts,*.tsx setl colorcolumn=80,120]])

-- undodir
vim.cmd([[
  set undodir=$HOME/.config/nvim/temp_dirs/undodir
  set undofile
]])

