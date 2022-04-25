local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "terrortylor/nvim-comment"
  use "dbakker/vim-projectroot"
  use "windwp/nvim-autopairs"
  use "mhinz/vim-startify"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  -- use "glepnir/indent-guides.nvim"
  use "Yggdroot/indentLine"
  -- use {"blackCauldron7/surround.nvim"}
  --
  -- use "github/copilot.vim"

  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- use {"glepnir/galaxyline.nvim", branch = "main", requires = {"kyazdani42/nvim-web-devicons", opt = true}}
  use {"hoob3rt/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}}

  -- use "HerringtonDarkholme/yats.vim"
  use "leafgarland/typescript-vim"
  use "MaxMEllon/vim-jsx-pretty"
  use "jparise/vim-graphql"
  use "fatih/vim-go"
  use "norcalli/nvim-colorizer.lua"
  use {"phaazon/hop.nvim", as = "hop"}

  -- use {"junegunn/fzf.vim", requires = {"junegunn/fzf"}, run = function() vim.fn["fzf#install"]() end}
  use {"neoclide/coc.nvim", branch = "release"}
  use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-live-grep-raw.nvim"}}}
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "fannheyward/telescope-coc.nvim"

  use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

  use {"akinsho/toggleterm.nvim"}

  use "rktjmp/lush.nvim"
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "nvim-treesitter/playground"
  use "~/code/usirin/vim-bleed-purple"
end)
