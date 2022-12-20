local utils = require("utils")

local setup_proto = function()
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.proto = {
    install_info = {
      url = "~/.config/tree-sitter/tree-sitter-proto", -- local path or git repo
      files = { "src/parser.c" },
    },
    filetype = "proto", -- if filetype does not agrees with parser name
  }
end

local setup_treesitter = function()
  require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
  })
end

local setup_keymaps = function()
  utils.keymap("n", "L", ":lua print(vim.inspect(vim.treesitter.get_captures_at_cursor(0)))<CR>")
  utils.keymap("n", "L", ":TSHighlightCapturesUnderCursor<CR>")
end

local setup = function()
  setup_proto()
  setup_treesitter()
  setup_keymaps()
end

return {
  setup = setup,
}
