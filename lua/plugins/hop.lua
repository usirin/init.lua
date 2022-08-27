local u = require("utils")

local setup = function()
  require("hop").setup {
    keys = "arstgmneiodh"
  }
  u.keymap("n", "<C-e>", "<cmd>lua require'hop'.hint_words()<cr>", { noremap = true, silent = true })
end

return {
  setup = setup
}
