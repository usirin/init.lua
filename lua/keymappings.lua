local utils = require "utils"
local map = utils.keymap

local setup = function()
  vim.g.mapleader = ","

  map("n", "<leader>ev", ":e ~/.config/nvim/init.lua<CR>")
  map("n", "<leader>SO", ":e ~/.config/nvim/init.lua<CR>")
  map("n", "<leader>ed", ":e ~/dotfiles/install.sh<CR>")

  map("i", "jj", "<Esc>")
  map("t", "jj", [[<C-\><C-n>]])

  map("n", "<leader><space>", ":nohlsearch<cr>")
  map("n", "<leader><leader>", "<C-^>")
  -- cd into the file's directory for updating filetree
  map("n", "<leader>cd", ":cd %:h<cr>")

  map("n", ";", ":")
  map("v", ";", ":")
  map("n", "<Enter>", "o<Esc>")
  map("n", "<space>", "i<space><C-c>l")

  -- Better split switching
  map("n", "<C-J>", "<C-W>j")
  map("n", "<C-K>", "<C-W>k")
  map("n", "<C-H>", "<C-W>h")
  map("n", "<C-L>", "<C-W>l")

  -- easy splits | for vertical _ for horizontal
  map("n", "<bar>", ":vsp<CR>")
  map("n", "_", [[Hmx``<C-w>szz<C-w><C-p>`x``<C-w><C-p>]])

  -- tabs
  map("n", "tt", ":tabe<cr>:Alpha<cr>:ProjectRootCD<cr>")
  map("n", "[t", ":tabprev<cr>")
  map("n", "t[", ":tabprev<cr>")
  map("n", "]t", ":tabnext<cr>")
  map("n", "t]", ":tabnext<cr>")
  map("n", "[T", ":tabfirst<cr>")
  map("n", "]T", ":tablast<cr>")

  map("n", "]f", ":cnext<cr>")
  map("n", "[f", ":cprev<cr>")
end

return {
  setup = setup,
}
