local utils = require('utils')
local lsp_status = require('lsp-status')

--- Configure lsp-status.nvim.
--- Currently supported configuration variables are:
--- - `kind_labels`: A map from LSP symbol kinds to label symbols. Used to decorate the current
--- function name. Default: `{}`
--- - `select_symbol`: A callback of the form `function(cursor_pos, document_symbol)` that should
--- return `true` if `document_symbol` (a `DocumentSymbol`) should be accepted as the symbol
--- currently containing the cursor.
--- - `indicator_errors`: Symbol to place next to the error count in `status`. Default: '',
--- - `indicator_warnings`: Symbol to place next to the warning count in `status`. Default: '',
--- - `indicator_info`: Symbol to place next to the info count in `status`. Default: '🛈',
--- - `indicator_hint`: Symbol to place next to the hint count in `status`. Default: '❗',
--- - `indicator_ok`: Symbol to show in `status` if there are no diagnostics. Default: '',
--- - `spinner_frames`: Animation frames for progress spinner in `status`. Default: { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
--- - `status_symbol`: Symbol to start the statusline segment in `status`. Default: ' 🇻',
lsp_status.config {
  kind_labels = utils.kind_symbols,
  status_symbol = ''
  --   select_symbol = function(cursor_pos, symbol)
  --     if symbol.valueRange then
  --       local value_range = {
  --         ['start'] = {character = 0, line = vim.fn.byte2line(symbol.valueRange[1])},
  --         ['end'] = {character = 0, line = vim.fn.byte2line(symbol.valueRange[2])}
  --       }
  --
  --       return require('lsp-status/util').in_range(cursor_pos, value_range)
  --     end
  --   end
  -- current_function = false
}

lsp_status.register_progress()
