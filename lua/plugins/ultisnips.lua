local M = {}

local get_config = function()
  return [[
let g:UltiSnipsExpandTrigger="<F1>"
let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
  ]]
end

M.setup = function()
  vim.cmd(get_config())
end

return M
