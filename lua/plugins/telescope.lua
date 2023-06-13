return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",

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
			{
				"<leader>ft",
				function()
					require("telescope").extensions.file_browser.file_browser()
				end,
				desc = "Find browser tree",
			},
			-- UI
			{
				"<leader>ss",
				function()
					require("telescope.builtin").colorscheme()
				end,
				desc = "Search colorscheme",
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
			{
				"<leader>sg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Search (Grep)",
			},
			{
				"<leader>sw",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Search word",
			},
			-- LSP
		},

		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
				sorting_strategy = "ascending",

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
				file_browser = {
					git_status = true,
					use_fd = true,

					hidden = {
						file_browser = true,
						folder_browser = true,
					},
					display_stat = {
						size = true,
						date = false,
						mode = false,
					},
					mappings = {},
				}
			},
		},
		config = function(_, opts)
			local map = {
				["n"] = {
						["a"] = require "telescope".extensions.file_browser.actions.create, -- [A]dd
						["r"] = require "telescope".extensions.file_browser.actions.rename, -- [R]ename
						["m"] = require "telescope".extensions.file_browser.actions.move,   -- [M]ove
						["y"] = require "telescope".extensions.file_browser.actions.copy,   -- [Y]ank
						["d"] = require "telescope".extensions.file_browser.actions.remove, -- [D]elete
						["o"] = require "telescope".extensions.file_browser.actions.open,   -- [O]pen
						["<BS>"] = require "telescope".extensions.file_browser.actions.goto_parent_dir,
						["e"] = require "telescope".extensions.file_browser.actions.goto_home_dir, -- default
						["c"] = require "telescope".extensions.file_browser.actions.goto_cwd, -- [C]wd
						["."] = require "telescope".extensions.file_browser.actions.change_cwd,
						["f"] = require "telescope".extensions.file_browser.actions.toggle_browser, -- [F]ile/[F]older
						["h"] = require "telescope".extensions.file_browser.actions.toggle_hidden, -- [H]idden
						["s"] = require "telescope".extensions.file_browser.actions.toggle_all, -- default
					},
			}

			opts = vim.tbl_deep_extend(
				"force",
				vim.deepcopy(opts),
				{ extensions = { file_browser = { mappings = map } } }
			)
			require("telescope").setup(opts)

			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = true,
		build = "make",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = true,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
}
