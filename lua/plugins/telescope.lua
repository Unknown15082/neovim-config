return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",

			"nvim-tree/nvim-web-devicons",
		},

		cmd = "Telescope",
		keys = {
			-- Files
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fF",
				function()
					require("telescope.builtin").find_files({ cwd = '~', hidden = false })
				end,
				desc = "Find files (home)",
			},
			-- Search
			{
				"<leader>sb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Search buffers",
			},
			{
				"<leader>sc",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Search commands",
			},
			{
				"<leader>sk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Search keybinds",
			},
			-- LSP
		},

		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				file_ignore_patterns = { ".git/", "%.png" },
				color_devicons = true,
				mappings = {
					n = {
						["q"] = function(...)
							require("telescope.actions").close(...)
						end,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = true,
		build = "make",
	},
}
