local utils = require "utils"
local gl = require "galaxyline"
local gls = gl.section
local condition = require "galaxyline.condition"
-- local vcs = require("galaxyline.provider_vcs")
local buffer = require "galaxyline.provider_buffer"
local fileinfo = require "galaxyline.provider_fileinfo"
-- local diagnostic = require('galaxyline.provider_diagnostic')
-- local lspclient = require('galaxyline.provider_lsp')
local icons = require("galaxyline.provider_fileinfo").define_file_icon()
-- local lsp_status = require("lsp-status")

local colors = utils.colors.bleed_purple
local fish_like_path = utils.fish_like_path

icons["man"] = { colors.green, "" }

local mode_colors = {
  n = colors.magenta,
  i = colors.green,
  v = colors.bred,
  [""] = colors.bred,
  V = colors.bred,
  c = colors.blue,
  no = colors.blue,
  s = colors.orange,
  S = colors.orange,
  ic = colors.yellow,
  R = colors.red,
  Rv = colors.red,
  cv = colors.blue,
  ce = colors.blue,
  r = colors.cyan,
  rm = colors.cyan,
  ["r?"] = colors.cyan,
  ["!"] = colors.blue,
  t = colors.blue,
}

gls.left = {
  {
    ViMode = {
      provider = function()
        local mode = vim.fn.mode()
        local mode_color = mode_colors[mode] or "NONE"
        utils.highlight("GalaxyViMode", mode_color, colors.status_bg)
        return "  " .. utils.get_mode(mode) .. " "
      end,
      condition = condition.buffer_not_empty,
      highlight = { colors.blue, colors.status_bg, "bold" },
      -- separator_highlight = {colors.magenta, colors.black}
    },
  },
  {
    -- FileIcon = {
    --   provider = function() return string.format("  %s ", fileinfo.get_file_icon()) end,
    --   condition = condition.buffer_not_empty,
    --   highlight = {fileinfo.get_file_icon_color, colors.status_bg}
    -- }
  },
  {
    FileName = {
      provider = function()
        return fish_like_path(vim.fn.expand "%:p", 2)
      end,
      condition = condition.buffer_not_empty,
      highlight = { colors.white, colors.status_bg },
    },
  },
  {
    --
    Blank = {
      --
      provider = function()
        return ""
      end,
      highlight = { colors.black, colors.status_bg },
    },
  },
}

gls.right = {
  -- {
  --   CocStatus = {
  --     provider = function() return " " .. vim.fn["coc#status"]() .. " " end,
  --     condition = condition.buffer_not_empty,
  --     highlight = {colors.dimmed_text, colors.status_bg}
  --   }
  -- },
  -- {
  --   LspStatus = {
  --     provider = function() return " " .. lsp_status.status() .. " " end,
  --     condition = condition.buffer_not_empty,
  --     highlight = {colors.dimmed_text, colors.status_bg}
  --   }
  -- }, {
  --   GitIcon = {
  --     provider = function() return "  " end,
  --     condition = function() return condition.check_git_workspace() and condition.hide_in_width() end,
  --     highlight = {colors.red, colors.status_bg}
  --   }
  -- }, {
  --   GitBranch = {
  --     provider = "GitBranch",
  --     condition = condition.check_git_workspace,
  --     highlight = {colors.blue, colors.status_bg}
  --   }
  -- }, {
  --   DiffAdd = {
  --     provider = vcs.diff_add,
  --     icon = " +",
  --     condition = function() return condition.check_git_workspace() and condition.hide_in_width() end,
  --     highlight = {colors.green, colors.status_bg}
  --   }
  -- }, {
  --   DiffModified = {
  --     provider = vcs.diff_modified,
  --     icon = "~",
  --     condition = function() return condition.check_git_workspace() and condition.hide_in_width() end,
  --     highlight = {colors.yellow, colors.status_bg}
  --   }
  -- }, {
  --   DiffRemove = {
  --     provider = vcs.diff_remove,
  --     icon = "-",
  --     condition = function() return condition.check_git_workspace() and condition.hide_in_width() end,
  --     highlight = {colors.red, colors.status_bg}
  --   }
  -- }, -- {
  --     DiagnosticError = {
  --       provider = diagnostic.get_diagnostic_error,
  --       icon = '  ',
  --       condition = function() return condition.check_active_lsp() and condition.hide_in_width() end,
  --       highlight = {colors.red, colors.black}
  --     }
  --   }, {
  --     DiagnosticWarn = {
  --       provider = diagnostic.get_diagnostic_warn,
  --       icon = '  ',
  --       condition = function() return condition.check_active_lsp() and condition.hide_in_width() end,
  --       highlight = {colors.yellow, colors.black}
  --     }
  --   }, {
  --     DiagnosticHint = {
  --       provider = diagnostic.get_diagnostic_hint,
  --       icon = '  ',
  --       condition = function() return condition.check_active_lsp() and condition.hide_in_width() end,
  --       highlight = {colors.cyan, colors.black}
  --     }
  --   }, {
  --     DiagnosticInfo = {
  --       provider = diagnostic.get_diagnostic_info,
  --       icon = '  ',
  --       condition = function() return condition.check_active_lsp() and condition.hide_in_width() end,
  --       highlight = {colors.cyan, colors.black}
  --     }
  --   },
  {
    FileType = {
      provider = function()
        return string.format("  %s ", vim.bo.filetype)
      end,
      condition = function()
        return buffer.get_buffer_filetype() ~= ""
      end,
      highlight = { colors.yellow, colors.status_bg },
    },
  },
  {
    LineInfo = {
      provider = function()
        return string.format(" %s ", fileinfo.line_column())
      end,
      highlight = { colors.dimmed_text, colors.bg },
    },
  },
}

gl.short_line_list = { "NvimTree", "help" }
gls.short_line_left = {
  {
    BufferIcon = {
      provider = function()
        local icon = buffer.get_buffer_type_icon()
        if icon ~= nil then
          return string.format(" %s ", icon)
        end
      end,
      highlight = { colors.white, colors.bblack },
    },
  },
  {
    BufferName = {
      provider = function()
        if vim.fn.index(gl.short_line_list, vim.bo.filetype) ~= -1 then
          local filetype = vim.bo.filetype
          if filetype == "NvimTree" then
            return " Explorer "
          end
        else
          if fileinfo.get_current_file_name() ~= "" then
            return string.format("  %s %s ", fileinfo.get_file_icon(), fish_like_path(vim.fn.expand "%:p", 2))
          end
        end
      end,
      separator = "",
      highlight = { colors.dimmed_text, colors.status_bg },
    },
  },
  {
    BufferBlank = {
      provider = function()
        return ""
      end,
      highlight = { colors.black, colors.status_bg },
    },
  },
}
