local hsl_convert = require("lush.vivid.hsl.convert")
local format = string.format
local utils = {}

utils.keymap = function(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

utils.exec = function(command) vim.api.nvim_exec(command, false) end
utils.hsl_to_hex = function(h, s, l) return hsl_convert.hsl_to_hex({h = h, s = s, l = l}) end

local hsl = utils.hsl_to_hex

utils.colors = {
  gotham = {
    black = "#0a0f14",
    bblack = "#10141b",
    red = "#c23026",
    bred = "#d26935",
    green = "#2aa888",
    bgreen = "#99d1ce",
    yellow = "#edb441",
    byellow = "#235260",
    blue = "#195365",
    bblue = "#093748",
    magenta = "#4e5065",
    bmagenta = "#888ba6",
    cyan = "#33849e",
    bcyan = "#599caa",
    white = "#99d1ce",
    bwhite = "#d3ebe9"
  },
  bleed_purple = {
    black = hsl(240, 7, 13),
    bblack = hsl(240, 7, 16),
    red = hsl(1, 83, 40),
    bred = hsl(1, 83, 50),
    bgreen = hsl(156, 100, 48),
    green = hsl(172, 100, 34),
    yellow = hsl(40, 100, 74),
    byellow = hsl(40, 100, 84),
    blue = hsl(220, 100, 56),
    bblue = hsl(220, 100, 66),
    magenta = hsl(264, 100, 64),
    bmagenta = hsl(264, 100, 72),
    cyan = hsl(180, 98, 26),
    bcyan = hsl(180, 100, 32),
    white = hsl(240, 7, 84),
    bwhite = hsl(240, 7, 94)
  },
  bleed_purple_light = {
    black = hsl(240, 7, 13),
    bblack = hsl(240, 7, 16),
    red = hsl(1, 83, 40),
    bred = hsl(1, 83, 50),
    bgreen = hsl(156, 100, 48),
    green = hsl(172, 100, 34),
    yellow = hsl(40, 100, 74),
    byellow = hsl(40, 100, 84),
    blue = hsl(220, 100, 56),
    bblue = hsl(220, 100, 66),
    magenta = hsl(264, 100, 64),
    bmagenta = hsl(264, 100, 72),
    cyan = hsl(180, 98, 26),
    bcyan = hsl(180, 100, 32),
    white = hsl(240, 7, 84),
    bwhite = hsl(240, 7, 94)
  }
}
utils.colors.gotham.status_bg = "#11171c"
utils.colors.gotham.dimmed_text = "#212c36"

utils.colors.bleed_purple.status_bg = utils.colors.bleed_purple.black
utils.colors.bleed_purple.dimmed_text = hsl(240, 7, 25)

utils.highlight = function(group, fg, bg, gui)
  local cmd = string.format("highlight %s guifg=%s guibg=%s", group, fg, bg)
  if gui ~= nil then cmd = cmd .. " gui=" .. gui end
  vim.cmd(cmd)
end

utils.mode_table = {
  n = "Normal",
  no = "N·Operator Pending",
  v = "Visual",
  V = "V·Line",
  ["^V"] = "V·Block",
  s = "Select",
  S = "S·Line",
  ["^S"] = "S·Block",
  i = "Insert",
  R = "Replace",
  Rv = "V·Replace",
  c = "Command",
  cv = "Vim Ex",
  ce = "Ex",
  r = "Prompt",
  rm = "More",
  ["r?"] = "Confirm",
  ["!"] = "Shell",
  t = "Terminal"
}

utils.kind_symbols = {
  Text = "",
  Method = "Ƒ",
  Function = "ƒ",
  Constructor = "",
  Variable = "",
  Class = "",
  Interface = "ﰮ",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "了",
  Keyword = "",
  Snippet = "﬌",
  Color = "",
  File = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = ""
}

utils.get_mode = function(mode) return string.upper(utils.mode_table[mode] or "V-Block") end

utils.check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

utils.t = function(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end

utils.at = function(str, index) return string.sub(str, index, index) end

-- Helper function to check if value passed by parameter is a table
-- @obj {table}
-- @returns {boolean}
utils.is_table = function(obj) return type(obj) == "table" end

-- Verify if table object works as an array
-- @param obj {table}
-- @return {boolean}
utils.is_array = function(obj)
  if not utils.is_table(obj) then return false end

  local i = 0
  for _ in pairs(obj) do
    i = i + 1
    if obj[i] == nil then return false end
  end

  return true
end

-- Checks wether value is nil
-- @obj {any}
-- @returns {boolean}
utils.is_nil = function(value) return value == nil end

-- Checks if parameter is an empty table
-- @param obj {table}
-- @return {boolean}
utils.is_empty = function(obj) return utils.is_array(obj) and #obj == 0 end

-- Returns a shallow copy of a portion of a table into a new table
-- @param obj {table}
-- @param start {number} start value
-- @param finish {number} end value
-- @return {boolean}
utils.slice_table = function(obj, start, finish)
  if utils.is_empty(obj) or start == finish then return {} end

  local output = {}
  local _finish = #obj
  local _start = 1

  if start >= 0 then
    _start = start
  elseif utils.is_nil(finish) and start < 0 then
    _start = #obj + start + 1
  end

  if (finish and finish >= 0) then
    _finish = finish - 1
  elseif finish and finish < 0 then
    _finish = #obj + finish
  end

  for i = _start, _finish do table.insert(output, obj[i]) end

  return output
end

local substitute_home = function(path) return vim.fn.substitute(path, vim.fn.expand("$HOME"), "~", "") end
utils.substitute_home = substitute_home

local shrink_path = function(path)
  local at = utils.at

  if at(path, 1) == "." then
    return at(path, 1) .. at(path, 2)
  else
    return at(path, 1)
  end
end

utils.shrink_path = shrink_path

local fish_like_path = function(path, level)
  if path == "" then return "[No Name]" end

  local paths = vim.fn.split(substitute_home(path), "/")

  if #paths == 0 then
    return "/"
  elseif #paths == 1 then
    if paths[1] == "~" then
      return "~/"
    else
      return path
    end
  end

  local after = utils.slice_table(paths, -(level))
  local before = utils.slice_table(paths, 1, -(level))

  for key, value in pairs(before) do before[key] = utils.shrink_path(value) end

  return vim.fn.join(before, "/") .. "/" .. vim.fn.join(after, "/")
end

utils.fish_like_path = fish_like_path

utils.command = function(name, fn) vim.cmd(format("command! %s %s", name, fn)) end

utils.lua_command = function(name, fn) utils.command(name, "lua " .. fn) end

return utils
