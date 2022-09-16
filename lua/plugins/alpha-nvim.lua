local get_config = function()
  return require("alpha.themes.startify").config
end

local setup = function()
  require("alpha").setup(get_config())
end

return {
  setup = setup,
}
