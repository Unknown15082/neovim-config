return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				background_colour = "#000000",
			}
		},
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<leader>nh",
			function()
				require("noice").cmd("history")
			end,
			desc = "NoiceHistory"
		},
		{
			"<leader>nd",
			function()
				require("noice").cmd("dismiss")
			end,
		},
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
		},
	},
}
