local utils = require "utils"
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
  local path = fish_like_path(vim.fn.expand "%:p", 2)
  local status = file_status(vim.bo.modified)

  if #status == 0 then
    return path
  end

  return path .. " " .. status
end

local fishpath = function(level)
  return function()
    local path = fish_like_path(vim.fn.expand "%:p", level)
    local status = file_status(vim.bo.modified)

    if #status == 0 then
      return path
    end

    return path .. " " .. status
  end
end

local dark_theme = {
  normal = {
    a = { bg = colors.bmagenta, fg = colors.bblack, gui = "bold" },
    b = { bg = colors.bgreen, fg = colors.black },
    c = { bg = colors.status_bg, fg = colors.white },
  },
  insert = { a = { bg = colors.green, fg = colors.black, gui = "bold" } },
  visual = { a = { bg = colors.yellow, fg = colors.black, gui = "bold" } },
  replace = { a = { bg = colors.red, fg = colors.black, gui = "bold" } },
  command = { a = { bg = colors.bblue, fg = colors.black, gui = "bold" } },
  inactive = {
    a = { bg = colors.status_bg, fg = colors.dimmed_text },
    b = { bg = colors.status_bg, fg = colors.dimmed_text },
    c = { bg = colors.status_bg, fg = colors.dimmed_text },
  },
}

local light_theme = {
  normal = {
    a = { bg = colors.bmagenta, fg = colors.bblack, gui = "bold" },
    b = { bg = colors.bgreen, fg = colors.black },
    c = { bg = colors.white, fg = colors.black },
  },
  insert = { a = { bg = colors.green, fg = colors.black, gui = "bold" } },
  visual = { a = { bg = colors.yellow, fg = colors.black, gui = "bold" } },
  replace = { a = { bg = colors.red, fg = colors.black, gui = "bold" } },
  command = { a = { bg = colors.bblue, fg = colors.black, gui = "bold" } },
  inactive = {
    a = { bg = colors.white, fg = colors.dimmed_text },
    b = { bg = colors.white, fg = colors.dimmed_text },
    c = { bg = colors.white, fg = colors.dimmed_text },
  },
}

local get_theme = function(bg)
  if bg == "light" then
    return light_theme
  end
  return dark_theme
end

local setup = function()
  require("lualine").setup {
    options = {
      icons_enabled = true,
      globalstatus = true,
      -- theme = "horizon",
      theme = get_theme(vim.o.background),
      -- theme = "auto",
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = { filename },
      lualine_x = { "filetype" },
      lualine_y = { },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { fishpath(2) },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { fishpath(3) },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },

    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { fishpath(3) },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          "tabs",
          mode = 2,
          tabs_color = {
            -- Same values as the general color option can be used here.
            active = "TabLineSel", -- Color for active tab.
            inactive = "TabLine", -- Color for inactive tab.
          },
        },
      },
      lualine_x = {"require'phoenix.utils.lsp'.get_attached_clients()"},
      -- lualine_y = {"require'lsp-status'.status()"},
      lualine_z = { "branch" },
    },
    extensions = {},
  }
end

vim.cmd [[
autocmd ColorScheme * lua require'plugins.lualine'.setup()
autocmd OptionSet background lua require'plugins.lualine'.setup()
]]

return {
  setup = setup,
}
