local setup = function()
  require("dressing").setup({
    input = {
      enabled = true,
      min_width = { 60, 0.6 }
    },
    select = {
      enabled = true,
      backend = { "telescope", "builtin" },
      telescope = require("telescope.themes").get_cursor({
        layout_config = {
          height = 20
        }
      }),
    },
  })
end

return {
  setup = setup,
}
