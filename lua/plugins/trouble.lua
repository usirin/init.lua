local utils = require("utils")

local M = {}

local setup_keymaps = function()
  utils.keymap("n", "<leader>x", "<cmd>TroubleToggle<cr>")
end

M.setup = function()
  require("trouble").setup({})

  setup_keymaps()
end

return M
