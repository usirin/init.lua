-- require("indent_guides").setup({
--   -- put your options in here
--   indent_levels = 30,
--   indent_guide_size = 2,
--   indent_start_level = 1,
--   indent_enable = true,
--   indent_space_guides = true,
--   indent_tab_guides = false,
--   indent_soft_pattern = "\\s",
--   exclude_filetypes = {"help", "dashboard", "dashpreview", "NvimTree", "vista", "sagahover", "startify"},
--   even_colors = {fg = "#0e1418", bg = "#0e1418"},
--   odd_colors = {fg = "#0e1216", bg = "#0e1216"}
-- })
-- vim.g.indentLine_leadingSpaceEnabled = 1
-- vim.g.indentLine_leadingSpaceChar = "·"
vim.g.indentLine_char = "│"
vim.g.vim_json_syntax_conceal = 0
vim.g.vim_json_conceal = 0
-- vim.g.indentLine_setConceal = 0
--
vim.g.indentLine_fileTypeExclude = { "json", "md", "markdown" }
