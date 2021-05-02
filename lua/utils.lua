local utils = {}

utils.keymap = function(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

utils.exec = function(command) vim.api.nvim_exec(command, false) end

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
  }
}
utils.colors.gotham.status_bg = "#11171c"
utils.colors.gotham.dimmed_text = "#212c36"

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

return utils
