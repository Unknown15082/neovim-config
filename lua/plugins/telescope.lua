return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",

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
		},
	},

	opts = {
		defaults = {
			prompt_prefix = " ",
        	selection_caret = " ",
			file_ignore_patterns = { ".git/", "%.png" },
			color_devicons = true,
			mappings = {
				i = {
					["<Esc>"] = function(...)
						require("telescope.actions").close(...)
					end,
				},
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
		}
	},
}
