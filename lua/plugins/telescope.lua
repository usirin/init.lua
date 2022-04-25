local utils = require("utils")
local Telescope = require("telescope")

Telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"
    },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      height = 0.75,
      width = 0.75,
      horizontal = {mirror = false, prompt_position = "top", preview_width = 100, preview_cutoff = 210},
      vertical = {mirror = true, prompt_position = "top"}
    },
    file_sorter = require"telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require"telescope.sorters".get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    -- file_previewer = require"telescope.previewers".vim_buffer_cat.new,
    file_previewer = nil,
    grep_previewer = require"telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require"telescope.previewers".vim_buffer_qflist.new

  },
  extensions = {fzy_native = {override_generic_sorter = false, override_file_sorter = true}}
}

Telescope.load_extension("coc")
Telescope.load_extension("fzy_native")

utils.keymap("n", "<C-p>", ":<C-u>ProjectRootExe Telescope find_files<cr>")
utils.keymap("n", "<C-t>", ":Telescope git_files<cr>")
utils.keymap("n", "<leader>t", ":Telescope git_files<cr>")
utils.keymap("n", "<C-f>", ":<C-u>ProjectRootExe Telescope live_grep<cr>")
utils.keymap("n", "<leader>f", ":<C-u>ProjectRootExe Telescope live_grep<cr>")
utils.keymap("n", "<C-/>", ":<C-u>ProjectRootExe Telescope live_grep<cr>")
utils.keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>")
utils.keymap("n", "<leader>b",
             ":lua require('telescope.builtin').buffers({layout_config={width=0.8}})<cr>")
utils.keymap("n", "<leader>q", "<cmd>Telescope quickfix<cr>")
utils.keymap("n", "<leader>s", "<cmd>Telescope git_status<cr>")
