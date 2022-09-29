local get_config = function()
  local config = require("alpha.themes.startify").config
  return config
end

local setup = function(opts)
  opts = opts or {}
  require("alpha").setup(get_config())
end

return {
  setup = setup,
}
