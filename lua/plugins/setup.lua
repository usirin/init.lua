local path_utils = require "phoenix.utils.path"
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if not path_utils.is_empty_path(install_path) then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "lewis6991/impatient.nvim"

  use "terrortylor/nvim-comment"
  use "dbakker/vim-projectroot"
  use "windwp/nvim-autopairs"
  -- use "mhinz/vim-startify"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"

  use "lukas-reineke/indent-blankline.nvim"

  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  use { "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }

  use "leafgarland/typescript-vim"
  use "MaxMEllon/vim-jsx-pretty"
  use "jparise/vim-graphql"
  use "fatih/vim-go"
  use "norcalli/nvim-colorizer.lua"
  use { "phaazon/hop.nvim", as = "hop" }

  use { "neoclide/coc.nvim", branch = "release" }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-raw.nvim" },
    },
  }
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "fannheyward/telescope-coc.nvim"

  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }

  use { "akinsho/toggleterm.nvim", tag = "v2.*" }

  use "rktjmp/lush.nvim"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "nvim-treesitter/playground"
  use "~/code/github.com/usirin/vim-bleed-purple"

  -- use {
  --   "usirin/bleed-purple.nvim",
  --   branch = "phoenix",
  -- }
end)
