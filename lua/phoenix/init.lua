local packer_utils = require("phoenix.utils.packer")

local is_fresh_install = packer_utils.ensure_packer_installed().is_fresh_install

return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use({ "wbthomason/packer.nvim" })

		use("lewis6991/impatient.nvim")

		use("terrortylor/nvim-comment")
		use("dbakker/vim-projectroot")
		use("windwp/nvim-autopairs")
		-- use "mhinz/vim-startify"
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

		use("Sirver/ultisnips")
		use("quangnguyen30192/cmp-nvim-ultisnips")

		use({
			"hrsh7th/nvim-cmp", -- completion
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"andersevenrud/cmp-tmux",
			},
		})
		-- lsp???
		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"folke/lua-dev.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "jose-elias-alvarez/typescript.nvim",
		})

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
