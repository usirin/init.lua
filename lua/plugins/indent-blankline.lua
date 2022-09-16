local setup = function()
  require("indent_blankline").setup {
    -- char = "│",
    char_blankline = "┆",
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = {
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "startify",
    },
  }
end

return {
  setup = setup,
}
