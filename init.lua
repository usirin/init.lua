require("impatient")

require("phoenix")

require("settings").setup()
require("plugins.nvim-cmp").setup()

require("phoenix.lsp")

require("keymappings").setup()
require("colorscheme").setup()

require("plugins.nvim-treesitter").setup()
require("plugins.nvim-tree").setup()
require("plugins.nvim-comment").setup()
require("plugins.nvim-autopairs").setup()
require("plugins.gitsigns").setup()
require("plugins.colorizer").setup()
require("plugins.vim-go").setup()
require("plugins.hop").setup()
require("plugins.telescope").setup()
require("plugins.lualine").setup()
require("plugins.indent-blankline").setup()
require("plugins.alpha-nvim").setup()
require("plugins.dressing").setup()
require("plugins.fidget").setup()
require("plugins.trouble").setup()
require("plugins.ultisnips").setup()

require("plugins.mason").setup()
