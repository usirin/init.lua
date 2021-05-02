local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "terrortylor/nvim-comment"
  use "dbakker/vim-projectroot"
  use "windwp/nvim-autopairs"
  use "mhinz/vim-startify"
  use "tpope/vim-surround"
  use "glepnir/indent-guides.nvim"
  -- use {"blackCauldron7/surround.nvim"}

  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  use {"glepnir/galaxyline.nvim", branch = "main", requires = {"kyazdani42/nvim-web-devicons", opt = true}}

  use "HerringtonDarkholme/yats.vim"
  use "jparise/vim-graphql"
  use "fatih/vim-go"
  use "norcalli/nvim-colorizer.lua"

  use {"junegunn/fzf.vim", requires = {"junegunn/fzf"}, run = function() vim.fn["fzf#install"]() end}
  use {"neoclide/coc.nvim", branch = "release"}
  use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

  -- use "neovim/nvim-lspconfig"
  -- use "glepnir/lspsaga.nvim"
  -- use "hrsh7th/nvim-compe"
  -- use "nvim-lua/lsp-status.nvim"
  -- use {
  --   "ojroques/nvim-lspfuzzy",
  --   requires = {
  --     {"junegunn/fzf"}, {"junegunn/fzf.vim"} -- to enable preview (optional)
  --   }
  -- }

  use "rktjmp/lush.nvim"
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "whatyouhide/vim-gotham"
  use "arzg/vim-colors-xcode"
end)
