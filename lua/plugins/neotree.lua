return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true })
			end,
			desc = "NeoTree",
			remap = true,
		},
	},
	opts = {
		sources = { "filesystem", "buffers", "git_status", "document_symbols" },
		filesystem = {
			bind_to_cwd = true,
			follow_current_file = true,
			use_libuv_file_watcher = true,
		},
		window = {
			width = "30%",
		},
	},
}
