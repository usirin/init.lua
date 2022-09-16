local setup_plugin = function()
  vim.cmd [[
let g:go_highlight_fields = 0
let g:go_highlight_functions = 0
let g:go_highlight_function_calls = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
]]
end

local setup = function()
  setup_plugin()
end

return {
  setup = setup,
}
