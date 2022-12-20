local M = {}

--- Register packer plugins
--- @param use function use this function to register packer packages
M.setup = function(use)
  use("lewis6991/impatient.nvim")

  use("terrortylor/nvim-comment")
  use("dbakker/vim-projectroot")
  use("windwp/nvim-autopairs")
  -- use "mhinz/vim-startify"
  --
  --
  use("tpope/vim-surround")
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")

  use("lukas-reineke/indent-blankline.nvim")

  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")

  use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

  use("leafgarland/typescript-vim")
  use("MaxMEllon/vim-jsx-pretty")
  use("jparise/vim-graphql")
  use("fatih/vim-go")
  use("norcalli/nvim-colorizer.lua")
  use({ "phaazon/hop.nvim", as = "hop" })

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-raw.nvim" },
    },
  })
  use("nvim-telescope/telescope-fzy-native.nvim")
  -- use("nvim-telescope/telescope-ui-select.nvim")
  use({ "stevearc/dressing.nvim" })

  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })

  -- use({ "akinsho/toggleterm.nvim", tag = "v2.*" })

  use("rktjmp/lush.nvim")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/playground")
  use("~/code/github.com/usirin/vim-bleed-purple")


  use({
    "hrsh7th/nvim-cmp", -- completion
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "petertriho/cmp-git",
      "andersevenrud/cmp-tmux",
      "Sirver/ultisnips",
      "quangnguyen30192/cmp-nvim-ultisnips",
    },
  })
  -- lsp???
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "folke/neodev.nvim",
    "folke/trouble.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "jose-elias-alvarez/typescript.nvim",
    "j-hui/fidget.nvim",
  })
end

return M
