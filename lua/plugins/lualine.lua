local utils = require("utils")
-- local lsp_status = require("lsp-status")
local fish_like_path = utils.fish_like_path
local colors = utils.colors.bleed_purple

local file_status = function(is_modified)
  if is_modified then
    return "·"
  else
    return ""
  end
end

local filename = function()
  local path = fish_like_path(vim.fn.expand("%:p"), 2)
  local status = file_status(vim.bo.modified)

  if #status == 0 then return path end

  return path .. " " .. status
end

local theme = {
  normal = {
    a = {bg = colors.bmagenta, fg = colors.bblack, gui = "bold"},
    b = {bg = colors.bgreen, fg = colors.black},
    c = {bg = colors.status_bg, fg = colors.white}
  },
  insert = {a = {bg = colors.green, fg = colors.black, gui = "bold"}},
  visual = {a = {bg = colors.yellow, fg = colors.black, gui = "bold"}},
  replace = {a = {bg = colors.red, fg = colors.black, gui = "bold"}},
  command = {a = {bg = colors.bblue, fg = colors.black, gui = "bold"}},
  inactive = {
    a = {bg = colors.status_bg, fg = colors.dimmed_text},
    b = {bg = colors.status_bg, fg = colors.dimmed_text},
    c = {bg = colors.status_bg, fg = colors.dimmed_text}
  }
}

require"lualine".setup {
  options = {
    icons_enabled = true,
    -- theme = "horizon",
    theme = theme,
    component_separators = {"", ""},
    section_separators = {"", ""},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {filename},
    lualine_x = {"filetype"},
    lualine_y = {"g:coc_status"},
    -- lualine_y = {lsp_status.status},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {filename},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {"nvim-tree"}
}
