local utils = require("utils")

require("telescope").setup {
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
      width = 0.6,
      horizontal = {mirror = false, prompt_position = "top", preview_width = 80, preview_cutoff = 210},
      vertical = {mirror = true}
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

  }
}

utils.keymap("n", "<C-p>", ":ProjectRootExe Telescope find_files<cr>")
utils.keymap("n", "<C-t>", ":Telescope git_files previewer=false<cr>")
utils.keymap("n", "<C-f>f", ":<C-u>ProjectRootExe Telescope live_grep<cr>")
utils.keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>")
utils.keymap("n", "<leader>b",
             ":lua require('telescope.builtin').buffers({layout_strategy='horizontal', layout_config={width=0.8}})<cr>")
