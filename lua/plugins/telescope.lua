local utils = require("utils")
local telescope = require("telescope")
local telescope_themes = require("telescope.themes")

local setup_telescope = function()
	telescope.setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--ignore-file",
				".gitignore",
			},
			prompt_prefix = "❯ ",
			selection_caret = "❯ ",
			sorting_strategy = "ascending",
			scroll_strategy = "limit",
			layout_strategy = "vertical",
			layout_config = {
				height = 0.75,
				width = 0.75,
				horizontal = { mirror = false, prompt_position = "top", preview_cutoff = 120 },
				vertical = { mirror = true, prompt_position = "top" },
			},
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
			-- file_previewer = require"telescope.previewers".vim_buffer_cat.new,
		},
		extensions = {
			-- coc = {
			--   prefer_locations = true,
			-- },
			fzy_native = {
				override_generic_sorter = true,
				override_file_sorter = true,
			},
		},
	})
end

local setup_extensions = function()
	-- Telescope.load_extension "coc"
	telescope.load_extension("fzy_native")
end

local setup_autocmds = function()
	vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
end

local setup_keymaps = function()
	utils.keymap("n", "<C-p>", ":<C-u>ProjectRootExe Telescope find_files<cr>")

	utils.keymap("n", "<C-t>", ":Telescope git_files<cr>")
	utils.keymap("n", "<leader>t", ":Telescope git_files<cr>")

	utils.keymap("n", "<C-f>", ":<C-u>ProjectRootExe lua require('telescope.builtin').live_grep({debounce=100})<cr>")
	utils.keymap("n", "<leader>f", ":<C-u>ProjectRootExe Telescope live_grep<cr>")
	utils.keymap("n", "<leader>l", ":<C-u>Telescope live_grep<cr>")

	utils.keymap("n", "<leader>b", ":lua require('telescope.builtin').buffers({layout_config={width=0.8}})<cr>")

	utils.keymap("n", "<leader>s", "<cmd>Telescope git_status<cr>")
end

local setup = function()
	setup_telescope()
	setup_extensions()
	setup_autocmds()
	setup_keymaps()
end

return {
	setup = setup,
}
