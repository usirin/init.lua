vim.g.startify_session_dir = "~/nvim-sessions"
vim.g.startify_bookmarks = { "~/dotfiles", "~/.config" }

vim.g.startify_lists = {
  { type = "dir", header = { "   MRU " .. vim.fn.getcwd() } },
  { type = "files", header = { "   MRU" } },
  { type = "sessions", header = { "   Sessions" } },
  { type = "bookmarks", header = { "   Bookmarks" } },
  { type = "commands", header = { "   Commands" } },
}
