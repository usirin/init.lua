local utils = require("utils")

local M = {}

M.setup = function()
  utils.keymap("n", "<leader>g", ":0G<cr>")
  utils.keymap("n", "<leader>G", ":G<cr>")
end

return M
