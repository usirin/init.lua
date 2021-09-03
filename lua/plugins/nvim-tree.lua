local utils = require("utils")

vim.g.nvim_tree_indent_markers = 1

local tree_cb = require"nvim-tree.config".nvim_tree_callback
vim.g.nvim_tree_bindings = {
  -- ["<CR>"] = ":YourVimFunction()<cr>",
  -- ["u"] = ":lua require'some_module'.some_function()<cr>",

  -- default mappings
  {key = "<CR>", cb = tree_cb("edit")}, {key = "o", cb = tree_cb("edit")},
  {key = "<2-LeftMouse>", cb = tree_cb("edit")}, {key = "<2-RightMouse>", cb = tree_cb("cd")},
  {key = "<C-]>", cb = tree_cb("d")}, {key = "<C-v>", cb = tree_cb("vsplit")}, {key = "<C-x>", cb = tree_cb("split")},
  {key = "<C-t>", cb = tree_cb("tabnew")}, {key = "<", cb = tree_cb("prev_sibling")},
  {key = ">", cb = tree_cb("next_sibling")}, -- ["<BS>"] = tree_cb("close_node"),
  {key = "<S-CR>", cb = tree_cb("close_node")}, {key = "-", cb = tree_cb("close_node")},
  {key = "<Tab>", cb = tree_cb("preview")}, {key = "I", cb = tree_cb("toggle_ignored")},
  {key = "H", cb = tree_cb("toggle_dotfiles")}, {key = "R", cb = tree_cb("refresh")},
  {key = "N", cb = tree_cb("create")}, {key = "d", cb = tree_cb("remove")}, {key = "r", cb = tree_cb("rename")},
  {key = "<C-r>", cb = tree_cb("full_rename")}, {key = "x", cb = tree_cb("cut")}, {key = "c", cb = tree_cb("copy")},
  {key = "p", cb = tree_cb("paste")}, {key = "[c", cb = tree_cb("prev_git_item")},
  {key = "]c", cb = tree_cb("next_git_item")}, {key = "-", cb = tree_cb("dir_up")},
  {key = "<backspace>", cb = tree_cb("dir_up")}, {key = "q", cb = tree_cb("close")}
}

vim.g.nvim_tree_show_icons = {git = 0, folders = 1, files = 1}
vim.g.nvim_tree_follow = 0
vim.g.nvim_tree_update_cwd = 0

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
  folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
}

utils.keymap("n", "<leader>kb", ":NvimTreeToggle<cr>")
