local packer_utils = require("phoenix.utils.packer")
local packer_plugins = require("phoenix.packer_plugins")

local is_fresh_install = packer_utils.ensure_packer_installed().is_fresh_install

return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use({ "wbthomason/packer.nvim" })

    packer_plugins.setup(use)

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if is_fresh_install then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
