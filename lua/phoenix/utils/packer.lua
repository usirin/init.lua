local fn = vim.fn
local path = require("phoenix.utils.path")

---Checks if packer is installed in given path
---@param install_path string
---@return boolean
local function is_packer_installed(install_path)
  ---@diagnostic disable-next-line: missing-parameter
  return not path.is_empty_path(install_path)
end

local function install_packer(install_path)
  fn.termopen(("git clone depth --1 https://github.com/wbthomason/packer.nvim %q"):format(install_path))
end

-- Download packer if it's not installed
local default_packer_path = ("%s/site/pack/packer/start/packer.nvim"):format(fn.stdpath("data"))

local ensure_packer_installed = function(override_path)
  local packer_path = default_packer_path
  if override_path ~= nil then
    packer_path = override_path
  end

  local is_fresh_install = false

  if not is_packer_installed(packer_path) then
    install_packer(packer_path)
    is_fresh_install = true
    vim.cmd([[packadd packer.nvim]])
  end

  return {
    is_fresh_install = is_fresh_install,
  }
end

return {
  install_packer = install_packer,
  is_packer_installed = is_packer_installed,
  packer_path = default_packer_path,
  ensure_packer_installed = ensure_packer_installed,
}
